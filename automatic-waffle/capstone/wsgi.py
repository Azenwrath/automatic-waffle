"""
WSGI config for capstone project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/howto/deployment/wsgi/
"""
import newrelic.agent
import os


newrelic.agent.initialize('newrelic.ini')

from django.core.wsgi import get_wsgi_application



os.environ.setdefault("DJANGO_SETTINGS_MODULE", "capstone.settings")

application = get_wsgi_application()
application = newrelic.agent.wsgi_application()(application)
