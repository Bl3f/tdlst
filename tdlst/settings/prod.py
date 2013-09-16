import os.path
import dj_database_url
from tdlst.settings.base import *

DEBUG = False
TEMPLATE_DEBUG = DEBUG

ADMINS = (
    ("Christophe Blefari", "christophe.blefari@gmail.com")
)

MANAGERS = ADMINS

DATABASES = {}
DATABASES['default'] = dj_database_url.config()

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
STATIC_ROOT = 'staticfiles'
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

SECRET_KEY = os.environ.get('SECRET_KEY', '4kdon8($1*c*5y(q&l&qgs&!febw=g!4t@i3jjtawu3cm#-ga_')

ROOT_URLCONF = 'tdlst.urls'

WSGI_APPLICATION = 'tdlst.wsgi.application'

INSTALLED_APPS += (
)