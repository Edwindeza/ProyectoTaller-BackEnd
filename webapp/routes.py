from django.conf.urls import url

from webapp.Controller.views import *

urlpatterns = [
    url(r'^api/user/retrieve/(?P<user_pk>\d+)/$', RetrieveUserController.as_view()),
    url(r'^api/tramites/$', ListTramitesController.as_view(),
        name='lista-tramites-nl'),
    url(r'^api/tramites/(?P<pk>\d+)/$', RetrieveTramiteController.as_view(),
        name='tramite-detail'),
    url(r'^api/mis-tramites/(?P<user_pk>\d+)/$', RetrieveMisTramiteController.as_view(),
        name='mis-tramites'),
    url(r'^api/user/(?P<user_pk>\d+)/solicitar-tramite/(?P<pk>\d+)/$', PedirTramiteController.as_view(),
        name='solicitar-tramite'),
    url(r'^api/create-user/$', CreateUserController.as_view(), name='create-user'),
    url(r'^api/login/$', LoginController.as_view(), name='login-user'),
    url(r'^api/user/(?P<user_pk>\d+)/mis-tramites/(?P<pk>\d+)/$', DetalleMiTramiteController.as_view(),
        name='detalle-mi-tramite'),
    url(r'^api/buscar-tramite/$', BuscarMiTramiteController.as_view(), name='buscar-mi-tramite'),
    url(r'^api/cancelar-tramite/(?P<pk>\d+)/$', CancelarMiTramiteController.as_view(), name='cancelar-mi-tramite'),
    url(r'^api/mover-tramite/(?P<pk>\d+)/$', MoverTramiteController.as_view(), name='mover-tramite'),
    url(r'^api/tramites-jtramites/(?P<jtramite_pk>\d+)/$', MisUsuarioTramitesJefeTramiteController.as_view(),
        name='lista-de-tramites-del-jefe-de-tramite'),
    url(r'^api/crear-tramite/$', CreateTramiteController.as_view(), name='crear-tramite'),
    url(r'^api/listar-requisitos/$', RequisitoController.as_view(), name='listar-requisitos'),
    url(r'^api/crear-listar-oficina/$', OficinaController.as_view(), name='crear-listar-oficina'),
]
