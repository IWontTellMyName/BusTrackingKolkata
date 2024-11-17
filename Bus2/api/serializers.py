from rest_framework import serializers
from tracking.models import * #all

class StoppageSerializer(serializers.ModelSerializer):
	class Meta:
		model = Stoppage
		fields = '__all__'

class BusSerializer(serializers.ModelSerializer):
	class Meta:
		model = Bus
		fields = '__all__'

class ScheduleSerializer(serializers.ModelSerializer):
	class Meta:
		model = Schedule
		fields = '__all__'

class RouteSerializer(serializers.ModelSerializer):
	class Meta:
		model = Route
		fields = '__all__'		

class LiveStatusSerializer(serializers.ModelSerializer):
	class Meta:
		model = LiveStatus
		fields = '__all__'