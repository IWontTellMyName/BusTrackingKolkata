from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializers import * #all
from tracking.models import * #all

# Create your views here.

@api_view(['GET'])
def getBus(request):
	buses = Bus.objects.all()
	serializer = BusSerializer(buses, many=True)
	return Response(serializer.data)

@api_view(['GET'])
def busDetails(request, routeNumber):
	try:
		bus = Bus.objects.get(number=routeNumber)
	except Bus.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)
	serializer = BusSerializer(bus)
	return Response(serializer.data)

@api_view(['POST'])
def addBus(request):
	serializer = BusSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
	return Response(serializer.data)



@api_view(['GET'])
def getSchedule(request):
	schedules = Schedule.objects.all()
	serializer = ScheduleSerializer(schedules, many=True)
	return Response(serializer.data)

@api_view(['GET'])
def scheduleDetails(request, routeNumber):
	try:
		schedule = Schedule.objects.filter(bus=routeNumber)
	except Schedule.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)
	serializer = ScheduleSerializer(schedule, many=True)
	return Response(serializer.data)



@api_view(['GET'])
def getRoutes(request, stop):
	try:
		route = Route.objects.filter(stoppage=stop)
	except Route.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)
	serializer = RouteSerializer(route, many=True)
	return Response(serializer.data)

@api_view(['GET'])
def routeDetails(request, routeNumber):
	try:
		route = Route.objects.filter(bus=routeNumber)
	except Route.DoesNotExist:
		return Response(status=status.HTTP_404_NOT_FOUND)
	serializer = RouteSerializer(route, many=True)
	return Response(serializer.data)

@api_view(['POST'])
def addRoute(request):
	serializer = RouteSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
	return Response(serializer.data)



@api_view(['POST'])
def addStop(request):
	serializer = StoppageSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
	return Response(serializer.data)



@api_view(['GET'])
def getUpdates(request):
	updates = LiveStatus.objects.all()
	serializer = LiveStatusSerializer(updates, many=True)
	return Response(serializer.data)

@api_view(['POST'])
def addUpdate(request):
	serializer = LiveStatusSerializer(data=request.data)
	if serializer.is_valid():
		serializer.save()
	return Response(serializer.data)
