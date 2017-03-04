from rest_framework import serializers
from django.utils.crypto import get_random_string

from webapp.models import TipoTramite, Requisito
from webapp.models import User, Tramite, UsuarioTramite, Solicitante, Oficina, JefeDeTramite


class UserRest(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('__all__')


class HojaDeRutaRest(serializers.ModelSerializer):
    class Meta:
        model = Oficina
        fields = ('__all__')


class TramiteRest(serializers.ModelSerializer):
    hoja_de_ruta = HojaDeRutaRest(many=True)

    class Meta:
        model = Tramite
        fields = ('__all__')


class ListTramitesRest(serializers.ModelSerializer):
    class Meta:
        model = Tramite
        fields = ('__all__')


class JefeDeTramiteRest(serializers.ModelSerializer):
    user = UserRest()

    class Meta:
        model = JefeDeTramite
        fields = ('__all__')


class TipoTramiteRest(serializers.ModelSerializer):
    class Meta:
        model = TipoTramite
        fields = ('__all__')


class OficinaRest(serializers.ModelSerializer):
    class Meta:
        model = Oficina
        fields = ('__all__')


class RetrieveTramiteRest(serializers.ModelSerializer):
    requisitos = serializers.StringRelatedField(many=True)
    jefe_tramite = JefeDeTramiteRest()
    tipo = TipoTramiteRest()
    hoja_de_ruta = OficinaRest(many=True)

    class Meta:
        model = Tramite
        fields = ('__all__')


class MisTramitesRest(serializers.ModelSerializer):
    tramite = TramiteRest()
    oficina = OficinaRest()

    class Meta:
        model = UsuarioTramite
        fields = ('__all__')


class PedirTramiteRest(serializers.ModelSerializer):
    boucher = serializers.ImageField(required=False)

    class Meta:
        model = UsuarioTramite
        read_only_fields = ('codigo', 'usuario', 'tramite', 'estado', 'oficina')

    def create(self, validated_data):
        request = self.context.get('request')
        view = self.context['view']
        code = get_random_string(length=10)
        tramite = Tramite.objects.get(id=view.kwargs['pk'])
        tramite.visita += 1
        tramite.save()
        oficina = Oficina.objects.filter(
            nombre__contains='Tramite Documentario').first()
        solicitante = Solicitante.objects.create(
            user=User.objects.filter(id=view.kwargs['user_pk']).first())
        instance = UsuarioTramite.objects.create(usuario=solicitante,
                                                 tramite_id=int(
                                                     view.kwargs['pk']),
                                                 codigo=code,
                                                 oficina=oficina)
        return instance


class DetalleMiTramiteRest(serializers.ModelSerializer):
    tramite = TramiteRest()
    oficina = OficinaRest()

    class Meta:
        model = UsuarioTramite
        fields = ('__all__')


class CancelarMiTramiteRest(serializers.ModelSerializer):
    class Meta:
        model = UsuarioTramite
        fields = ('estado',)

    def update(self, instance, validated_data):
        instance.estado = 'CANCELADO'
        instance.save()
        return instance


class RequisitosRest(serializers.ModelSerializer):
    class Meta:
        model = Requisito
        fields = ('__all__')


class CreateTramiteRest(serializers.ModelSerializer):
    class Meta:
        model = Tramite
        fields = ('__all__')
