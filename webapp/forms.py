from django import forms

from webapp.models import UsuarioTramite


class LoginForm(forms.Form):
    username = forms.CharField(max_length=50)
    password = forms.CharField(max_length=50,
                               widget=forms.TextInput(attrs={
                                   'type': 'password'
                               }))


class UsuarioTramiteForm(forms.ModelForm):
    class Meta:
        model = UsuarioTramite
        exclude = ['created_at', 'usuario', 'estado', 'oficina']
