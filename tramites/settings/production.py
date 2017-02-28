__author__ = 'klaatu'
from .base import *

ALLOWED_HOSTS = ['138.197.17.11']
DEBUG = False
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'tramites',
        'USER': 'postgres',
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

STATIC_URL = '/static/'
APPSECRET_PROOF = False
ADMINS = (
    ('Erik Admin', 'erikd.guiba@gmail.com'),
)
