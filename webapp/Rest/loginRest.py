from rest_framework import serializers
from django.contrib.auth import authenticate, login


class LoginRest(serializers.Serializer):
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
