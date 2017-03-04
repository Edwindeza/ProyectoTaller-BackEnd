__author__='klaatu'
from .base import *
APPSECRET_PROOF = False
DATABASES = {
    'default': { 
 	'ENGINE': 'django.db.backends.postgresql_psycopg2',
	'NAME': 'tramites',
	'USER': 'postgres',
	'PASSWORD': 'root',
	'HOST': 'localhost',
	'PORT': '',
    }
}