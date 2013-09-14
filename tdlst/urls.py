from django.conf.urls import patterns, include, url
from todo.views import home, toggle, delete

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
                       url(r'^$',
                           home,
                           name='home'),

                       url(r'^toggle/(?P<task_id>[-A-Za-z0-9_]+)$',
                           toggle,
                           name='toggle'),

                       url(r'^delete/(?P<task_id>[-A-Za-z0-9_]+)$',
                           delete,
                           name='delete'),


)
