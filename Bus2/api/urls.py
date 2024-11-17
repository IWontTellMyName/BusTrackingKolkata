from django.urls import path
from . import views
# . indicates current directory

urlpatterns = [
    path('bus', views.getBus),
	path('bus/add', views.addBus),
	path('bus/<str:routeNumber>', views.busDetails),

	path('schedule', views.getSchedule),
	path('schedule/<str:routeNumber>', views.scheduleDetails),

	path('stop/add', views.addStop),

	path('stop/<str:stop>', views.getRoutes),
	path('route/add', views.addRoute),
	path('route/<str:routeNumber>', views.routeDetails),

	path('updates', views.getUpdates),
	path('updates/add', views.addUpdate)
]
