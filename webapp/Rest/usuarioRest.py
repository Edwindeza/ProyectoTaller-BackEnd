from django.contrib.auth.models import Group
from rest_framework.authtoken.models import Token
from rest_framework import serializers
from webapp.models import User


class GroupsRest(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = ('name',)


class CreateUserRest(serializers.ModelSerializer):
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


class RetrieveUserRest(serializers.ModelSerializer):
    groups = GroupsRest(many=True)

    class Meta:
        model = User
        exclude = (
            "password", "is_active", 'is_staff', 'user_permissions',
            'is_superuser',)
        

