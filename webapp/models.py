from django.contrib.auth.models import PermissionsMixin, BaseUserManager, \
    AbstractBaseUser
from django.core.validators import RegexValidator
from django.db import models
from django.utils.crypto import get_random_string
from rest_framework.authtoken.models import Token


def fut_code():
    return get_random_string(length=8)


def solicitante_code():
    return get_random_string(length=10)


class UserManager(BaseUserManager):
    def _create_user(self, email, password, is_staff, is_superuser,
                     **extra_fields):
        user = self.model(email=email, is_active=True,
                          is_staff=is_staff, is_superuser=is_superuser,
                          **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password=None, **extra_fields):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, **extra_fields):
        return self._create_user(email, password, True, True,
                                 **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True)
    first_name = models.CharField(max_length=100, verbose_name='nombres')
    last_name = models.CharField(max_length=100, verbose_name='apellidos')
    dni = models.CharField(max_length=8, validators=[
        RegexValidator(regex='^.{8}$',
                       message="El dni debe ser de 8 números")])
    codigo = models.CharField(max_length=8, validators=[
        RegexValidator(regex='^.{8}$', message="El código debe ser 8 números")])
    direccion = models.CharField(max_length=50)
    telefono = models.CharField(max_length=9, validators=[
        RegexValidator(regex='^.{9}$',
                       message="El celular debe tener 9 números")])
    objects = UserManager()
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    USERNAME_FIELD = 'email'

    def get_short_name(self):
        return '{0}'.format(self.first_name)

    def get_fullname(self):
        return '{0}-{1}'.format(self.first_name, self.last_name)

    class Meta:
        verbose_name = "Usuario"
        verbose_name_plural = "Usuarios"


class Cargo(models.Model):
    nombre = models.CharField(max_length=35)
    descripcion = models.CharField(max_length=150)

    def __str__(self):
        return u'{0}-{1}'.format(self.nombre, self.descripcion)


class Solicitante(models.Model):
    user = models.ForeignKey(User, related_name='solicitante')
    solicitante_codigo = models.CharField(max_length=10,
                                          default=solicitante_code)

    def __str__(self):
        return u'{} {}'.format(self.user.first_name, self.user.last_name)


class JefeDeTramite(models.Model):
    user = models.ForeignKey(User, related_name='jtramite')
    jefe_tramite_codigo = models.CharField(max_length=10)

    def __str__(self):
        return u'{} {} {}'.format(self.user.first_name, self.user.last_name,
                                  self.jefe_tramite_codigo)


class JefeDeOficina(models.Model):
    user = models.ForeignKey(User, related_name='joficina')
    jefe_oficina_codigo = models.CharField(max_length=10)

    def __str__(self):
        return u'{} {} {}'.format(self.user.first_name, self.user.last_name,
                                  self.jefe_oficina_codigo)


class Requisito(models.Model):
    nombre = models.CharField(max_length=30)
    monto = models.CharField(max_length=10, null=True, blank=True)
    concepto_de_pago = models.CharField(max_length=7, null=True, blank=True)
    estado = models.CharField(max_length=8, choices=(
        ('FISICO', 'FÍSICO'), ('VIRTUAL', 'VIRTUAL')))

    def __str__(self):
        return u'{0}-{1}'.format(self.nombre, self.concepto_de_pago)


class TipoTramite(models.Model):
    nombre = models.CharField(max_length=30)

    def __str__(self):
        return u'{0}'.format(self.nombre)


class Oficina(models.Model):
    jefe_oficina = models.ForeignKey(JefeDeOficina, related_name='jefe_oficina')
    nombre = models.CharField(max_length=35)
    descripcion = models.CharField(max_length=150)
    dependencia = models.CharField(max_length=35)

    def __str__(self):
        return u'{0}'.format(self.nombre)


class Tramite(models.Model):
    jefe_tramite = models.ForeignKey(JefeDeTramite, related_name='jefe_tramite')
    nombre = models.CharField(max_length=150)
    descripcion = models.CharField(max_length=150, null=True, blank=True)
    tipo = models.ForeignKey(TipoTramite, related_name='tramite')
    requisitos = models.ManyToManyField(Requisito, related_name='requisitos',
                                        null=True, blank=True)
    visita = models.PositiveIntegerField(default=0)
    hoja_de_ruta = models.ManyToManyField(Oficina, related_name='oficinas',
                                          null=True, blank=True)

    class Meta:
        ordering = '-visita',

    def __str__(self):
        return u'{0}'.format(self.nombre)


class UsuarioTramite(models.Model):
    usuario = models.ForeignKey(Solicitante, related_name='tramitante')
    tramite = models.ForeignKey(Tramite, related_name='tramite')
    boucher = models.FileField(upload_to='documents', null=True, blank=True)
    oficina = models.ForeignKey(Oficina, related_name='ut_oficina', null=True,
                                blank=True)
    codigo = models.CharField(max_length=12, null=True, blank=True)
    estado = models.CharField(max_length=25, choices=(
        ('NUEVO', 'NUEVO'), ('PERDIDO', 'PERDIDO'),
        ('EN MOVIMIENTO', 'EN MOVIMIENTO'),
        ('FINALIZADO', 'FINALIZADO'),('CANCELADO','CANCELADO')),default='NUEVO', null=True, blank=True)

    def __str__(self):
        return u'{} -   {} {} {} - {}'.format(self.estado,
                                         self.usuario.user.first_name,
                                         self.usuario.user.last_name,
                                         self.tramite,self.codigo)
