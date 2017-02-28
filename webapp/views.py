from django.contrib.auth import authenticate
from django.contrib.auth import login, logout
from django.contrib.auth.forms import AuthenticationForm
from django.shortcuts import redirect, render
from django.utils.crypto import get_random_string
from django.views.generic.base import TemplateView
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from rest_framework import generics, status, filters

from .serializers import *
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from .models import User
from .forms import *


class IndexView(TemplateView):
    template_name = 'index.html'

    def get(self, request, *args, **kwargs):
        tramites = Tramite.objects.all()
        return render(request, 'index.html', {'tramites': tramites})


class TramiteDetalle(TemplateView):
    template_name = 'tramite_detalle.html'

    def get(self, request, *args, **kwargs):
        pk = kwargs['pk']
        tramite = Tramite.objects.get(id=pk)
        return render(request, 'tramite_detalle.html', {'tramite': tramite})


class UserSesionView(TemplateView):
    template_name = 'user_sesion.html'

    def get(self, request, *args, **kwargs):
        tramites = Tramite.objects.all()
        return render(request, 'index.html', {'tramites': tramites})


class IngresarView(FormView):
    form_class = AuthenticationForm
    template_name = 'login.html'
    success_url = '/web/user-sesion/'

    def form_valid(self, form):
        try:
            User.objects.get(email=form.cleaned_data['username'])
        except User.DoesNotExist:
            return redirect('/login/')
        else:
            user = authenticate(email=form.cleaned_data['username'],
                                password=form.cleaned_data['password'])
            if user:
                login(self.request, user)
            else:
                return redirect('/sign-in/')
            return super(IngresarView, self).form_valid(form)


class UsuarioTramiteView(FormView):
    form_class = UsuarioTramiteForm
    template_name = 'usuario_tramite_form.html'
    success_url = '/index/'

    def form_valid(self, form):
        solicitante = Solicitante.objects.create(user=self.request.user)
        object = UsuarioTramite.objects.create(usuario=solicitante,
                                               tramite=form.cleaned_data[
                                                   'tramite'],
                                               boucher=form.cleaned_data[
                                                   'boucher'],
                                               estado='NUEVO',
                                               oficina=Oficina.objects.filter(
                                                   nombre__icontains='unidad').first()
                                               )
        object.boucher = self.request.FILES['boucher']
        object.save()
        return super(UsuarioTramiteView, self).form_valid(form)


class PerfilView(TemplateView):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated():
            return render(request, 'user_sesion.html')
        else:
            return redirect('/')


class VerMisTramitesView(TemplateView):
    template_name = 'mis_tramites.html'

    def get(self, request, *args, **kwargs):
        solicitante = self.request.user.solicitante.all()
        usuario_tramite = UsuarioTramite.objects.filter(
            usuario__in=solicitante)
        return render(request, 'mis_tramites.html',
                      {'usuario_tramite': usuario_tramite})


class DetalleMiTramiteView(DetailView):
    model = UsuarioTramite
    template_name = 'mi_tramite_detalle.html'


def solicitar_tramite(request, **kwargs):
    id = kwargs['id']
    code = get_random_string(length=10)
    if (request.user.is_anonymous()):
        mensaje = "Necesitas iniciar sesión para solicitar trámite"
        return render(request, 'login.html', {'mensaje': mensaje})
    solicitante = Solicitante.objects.create(user=request.user,
                                             solicitante_codigo=code)
    tramite = Tramite.objects.filter(id=id).first()
    UsuarioTramite.objects.create(usuario=solicitante, tramite=tramite)
    mensaje = "Su Solicitud de Trámite ha sido mandado"
    tramites = Tramite.objects.all()
    return render(request, 'index.html',
                  {'mensaje': mensaje, 'tramites': tramites})


def buscar_tramite(request):
    nombre = request.GET.get('nombre')
    tramites = Tramite.objects.filter(nombre__icontains=nombre)
    return render(request, 'tramite_encontrado.html', {'tramites': tramites})


class CreateUserAPIView(generics.CreateAPIView):
    serializer_class = CreateUserSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)
        return Response({'token': token.key},
                        status=status.HTTP_200_OK)


class RetrieveUserAPIView(generics.RetrieveAPIView):
    serializer_class = RetrieveUserSerializer

    def get_object(self):
        return User.objects.filter(id=self.kwargs['user_pk']).first()


class LoginAPIView(generics.GenericAPIView):
    serializer_class = LoginSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        serializer.is_valid(raise_exception=True)
        token, created = Token.objects.get_or_create(user=serializer.get_user())
        return Response({'token': token.key, 'id': serializer.get_user().id},
                        status=status.HTTP_200_OK)


class ListTramitesAPIView(generics.ListAPIView):
    serializer_class = ListTramitesSerializer
    queryset = Tramite.objects.all()
    filter_backends = (filters.SearchFilter,)
    search_fields = ('nombre',)


class RetrieveTramiteAPIView(generics.RetrieveAPIView):
    serializer_class = RetrieveTramiteSerializer
    queryset = Tramite.objects.all()


class RetrieveMisTramiteAPIView(generics.ListAPIView):
    serializer_class = MisTramitesSerializer

    def get_queryset(self):
        solicitante = User.objects.filter(
            id=self.kwargs["user_pk"]).first().solicitante.all()
        return UsuarioTramite.objects.filter(usuario__in=solicitante)


class PedirTramiteAPIView(generics.CreateAPIView):
    serializer_class = PedirTramiteSerializer

    def get_queryset(self):
        return UsuarioTramite.objects.filter(
            usuario=User.objects.filter(id=self.kwargs["user_pk"]).first())


class DetalleMiTramiteAPIView(generics.RetrieveAPIView):
    serializer_class = DetalleMiTramiteSerializer
    queryset = UsuarioTramite.objects.all()


class BuscarMiTramiteAPIView(generics.ListAPIView):
    serializer_class = DetalleMiTramiteSerializer
    queryset = UsuarioTramite.objects.all()
    filter_backends = (filters.SearchFilter,)
    search_fields = ('codigo',)


class CancelarMiTramiteAPIView(generics.UpdateAPIView):
   serializer_class=CancelarMiTramiteSerializer
   queryset = UsuarioTramite.objects.all()