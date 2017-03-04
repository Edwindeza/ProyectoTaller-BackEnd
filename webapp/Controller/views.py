from rest_framework import generics, status, filters
from rest_framework.response import Response

from webapp.Rest.administradoresRest import *
from webapp.Rest.loginRest import *
from webapp.Rest.tramiteRest import *
from webapp.Rest.usuarioRest import *
from webapp.models import User, JefeDeOficina


class CreateUserController(generics.CreateAPIView):
    serializer_class = CreateUserRest

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        token, created = Token.objects.get_or_create(user=user)
        return Response({'token': token.key},
                        status=status.HTTP_200_OK)


class RetrieveUserController(generics.RetrieveAPIView):
    serializer_class = RetrieveUserRest

    def get_object(self):
        return User.objects.filter(id=self.kwargs['user_pk']).first()


class LoginController(generics.GenericAPIView):
    serializer_class = LoginRest

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data,
                                         context={"request": request})
        serializer.is_valid(raise_exception=True)
        token, created = Token.objects.get_or_create(user=serializer.get_user())
        return Response({'token': token.key, 'id': serializer.get_user().id},
                        status=status.HTTP_200_OK)


class CreateTramiteController(generics.CreateAPIView):
    serializer_class = CreateTramiteRest
    queryset = Tramite.objects.all()


class ListTramitesController(generics.ListAPIView):
    serializer_class = ListTramitesRest
    queryset = Tramite.objects.all()
    filter_backends = (filters.SearchFilter,)
    search_fields = ('nombre',)


class RetrieveTramiteController(generics.RetrieveAPIView):
    serializer_class = RetrieveTramiteRest
    queryset = Tramite.objects.all()


class RetrieveMisTramiteController(generics.ListAPIView):
    serializer_class = MisTramitesRest

    def get_queryset(self):
        solicitante = User.objects.filter(
            id=self.kwargs["user_pk"]).first().solicitante.all()
        return UsuarioTramite.objects.filter(usuario__in=solicitante)


class PedirTramiteController(generics.CreateAPIView):
    serializer_class = PedirTramiteRest

    def get_queryset(self):
        return UsuarioTramite.objects.filter(
            usuario=User.objects.filter(id=self.kwargs["user_pk"]).first())


class DetalleMiTramiteController(generics.RetrieveAPIView):
    serializer_class = DetalleMiTramiteRest
    queryset = UsuarioTramite.objects.all()


class BuscarMiTramiteController(generics.ListAPIView):
    serializer_class = DetalleMiTramiteRest
    queryset = UsuarioTramite.objects.all()
    filter_backends = (filters.SearchFilter,)
    search_fields = ('codigo',)


class CancelarMiTramiteController(generics.UpdateAPIView):
    serializer_class = CancelarMiTramiteRest
    queryset = UsuarioTramite.objects.all()


class MisUsuarioTramitesJefeTramiteController(generics.ListAPIView):
    serializer_class = TramitesJefeOficinaRest

    def get_queryset(self):
        tramite = JefeDeTramite.objects.filter(id=self.kwargs["jtramite_pk"]).first().tramite.first()
        return UsuarioTramite.objects.filter(tramite=tramite)


class MoverTramiteController(generics.UpdateAPIView):
    serializer_class = MoverTramiteRest
    queryset = UsuarioTramite.objects.filter()


class OficinaController(generics.ListCreateAPIView):
    serializer_class = OficinaRest
    queryset = Oficina.objects.all()


class RequisitoController(generics.ListAPIView):
    serializer_class = RequisitosRest
    queryset = Requisito.objects.all()
