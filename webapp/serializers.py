from django.contrib.auth import authenticate, login
from django.contrib.auth.models import Group
from rest_framework.authtoken.models import Token
from rest_framework import serializers
from django.utils.crypto import get_random_string

from webapp.models import TipoTramite
from .models import User, Tramite, UsuarioTramite, Solicitante, Oficina, \
    JefeDeTramite


class GroupsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('name',)


class CreateUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = (
            'email', 'password', 'first_name', 'last_name', 'codigo',
            'telefono', 'direccion')
        write_only_fields = ('password',)
        read_only_fields = ('id',)

    def create(self, validated_data):
        user = User.objects.create(**validated_data)
        user.set_password(validated_data['password'])
        user.groups.add(Group.objects.filter(name='usuarios').first())
        user.save()
        Token.objects.create(user=user)
        return user


class LoginSerializer(serializers.Serializer):
    email = serializers.EmailField(
        error_messages={"blank": "Este campo es obligatorio"})
    password = serializers.CharField(
        error_messages={"blank": "Este campo es obligatorio"})

    def validate(self, attrs):
        self.user_cache = authenticate(email=attrs["email"],
                                       password=attrs["password"])
        if not self.user_cache:
            raise serializers.ValidationError("Invalid login")
        return attrs

    def get_user(self):
        return self.user_cache


class TramiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tramite
        fields = ('nombre',)


class RetrieveUserSerializer(serializers.ModelSerializer):
    groups=GroupsSerializer(many=True)
    class Meta:
        model = User
        exclude = (
            "password", "is_active", 'is_staff', 'user_permissions',
            'is_superuser',)


class ListTramitesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tramite
        fields = ('id', 'nombre',)


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('first_name', 'last_name')


class JefeDeTramiteSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = JefeDeTramite
        fields = ('__all__')


class TipoTramiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoTramite
        fields = ('nombre',)


class OficinaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Oficina
        fields = ('nombre',)


class RetrieveTramiteSerializer(serializers.ModelSerializer):
    requisitos = serializers.StringRelatedField(many=True)
    jefe_tramite = JefeDeTramiteSerializer()
    tipo = TipoTramiteSerializer()
    hoja_de_ruta = OficinaSerializer(many=True)

    class Meta:
        model = Tramite
        fields = ('__all__')


class MisTramitesSerializer(serializers.ModelSerializer):
    tramite = TramiteSerializer()
    oficina = OficinaSerializer()

    class Meta:
        model = UsuarioTramite
        fields = ('__all__')


class PedirTramiteSerializer(serializers.ModelSerializer):
    boucher = serializers.FileField(required=False)

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


class DetalleMiTramiteSerializer(serializers.ModelSerializer):
    tramite = TramiteSerializer()
    oficina = OficinaSerializer()

    class Meta:
        model = UsuarioTramite
        fields = ('__all__')


class CancelarMiTramiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsuarioTramite
        fields = ('estado',)

    def update(self, instance, validated_data):
        instance.estado = 'CANCELADO'
        instance.save()
        return instance
