from django.conf.urls import url
from .views import *
from django.contrib.auth.views import login, logout

urlpatterns = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^login/$', IngresarView.as_view(), name='login'),
    url(r'^logout/$', logout, name='logout', kwargs={'next_page': '/'}),
    url(r'^buscar/$', 'webapp.views.buscar_tramite', name='buscar_tramite'),
    url(r'^web/solicitar-tramite/(?P<id>\d+)/$',
        'webapp.views.solicitar_tramite', name='solicitartramite'),
    url(r'^web/usuario_tramite_form/$', UsuarioTramiteView.as_view(),
        name='usuario-tramite'),
    url(r'^web/user-sesion/$', UserSesionView.as_view(), name='usersesion'),
    url(r'^web/mis-tramites/$', VerMisTramitesView.as_view(),
        name='mis-tramites'),
    url(r'^web/detalle-mi-tramite/(?P<user_pk>\d+)/$',
        DetalleMiTramiteView.as_view(), name='mi-tramite-detalle'),
    url(r'^logout/$', logout, name='logout.html'),
    url(r'^api/user/retrieve/(?P<user_pk>\d+)/$', RetrieveUserAPIView.as_view()),
    url(r'^tramites/(?P<pk>\d+)/$', TramiteDetalle.as_view(),
        name='detalle-tramite'),
    url(r'^api/tramites/$', ListTramitesAPIView.as_view(),
        name='lista-tramites-nl'),
    url(r'^api/tramites/(?P<pk>\d+)/$', RetrieveTramiteAPIView.as_view(),
        name='tramite-detail'),
    url(r'^api/mis-tramites/(?P<user_pk>\d+)/$', RetrieveMisTramiteAPIView.as_view(),
        name='mis-tramites'),
    url(r'^api/user/(?P<user_pk>\d+)/solicitar-tramite/(?P<pk>\d+)/$', PedirTramiteAPIView.as_view(),
        name='solicitar-tramite'),
    url(r'^api/create-user/$', CreateUserAPIView.as_view(), name='create-user'),
    url(r'^api/login/$', LoginAPIView.as_view(), name='login-user'),
    url(r'^api/user/(?P<user_pk>\d+)/mis-tramites/(?P<pk>\d+)/$', DetalleMiTramiteAPIView.as_view(),
        name='detalle-mi-tramite'),
    url(r'^api/buscar-tramite/$',
        BuscarMiTramiteAPIView.as_view(),
        name='mis-tramites'),

    url(r'^api/cancelar-tramite/(?P<pk>\d+)/$',
        CancelarMiTramiteAPIView.as_view(),
        name='mis-tramites'),
]
