from django.contrib import admin
from .models import *
#. indicates current directory

# Register your models here.
admin.site.register(Stoppage)
admin.site.register(Bus)
admin.site.register(Route)
admin.site.register(Schedule)
admin.site.register(LiveStatus)