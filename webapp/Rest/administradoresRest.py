from rest_framework import serializers

from webapp.models import UsuarioTramite, Tramite, Oficina, TipoTramite, JefeDeTramite, User


class UserRest(serializers.ModelSerializer):
    class Meta:
        model = User
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


class TramiteRest(serializers.ModelSerializer):
    requisitos = serializers.StringRelatedField(many=True)
    jefe_tramite = JefeDeTramiteRest()
    tipo = TipoTramiteRest()
    hoja_de_ruta = OficinaRest(many=True)

    class Meta:
        model = Tramite
        fields = ('__all__')


class MoverTramiteRest(serializers.ModelSerializer):
    tramite = TramiteRest(read_only=True)

    class Meta:
        model = UsuarioTramite
        fields = ('oficina', 'tramite', 'estado')


class TramitesJefeOficinaRest(serializers.ModelSerializer):
    class Meta:
        model = UsuarioTramite
        fields = ('__all__')
