from django.db import models


# Create your models here.

class Stoppage(models.Model):
	name = models.CharField(max_length=100, primary_key=True)
	latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
	longitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    #code = models.CharField(max_length=10)
	#location = PointField()
    
	def __str__(self):
		return f"{self.name}"

class Bus(models.Model):
	number = models.CharField(max_length=100, primary_key=True)
	#name = models.CharField(max_length=100)
	#type = models.CharField(max_length=50)
	#start_station = models.ForeignKey(Station, related_name='start_station', on_delete=models.CASCADE)
	#end_station = models.ForeignKey(Station, related_name='end_station', on_delete=models.CASCADE)

	def __str__(self):
		return f"{self.number}"

class Route(models.Model):
	bus = models.ForeignKey(Bus, on_delete=models.CASCADE)
	stoppage = models.ForeignKey(Stoppage, on_delete=models.CASCADE)
	prev_stop_time = models.TimeField()
	next_stop_time = models.TimeField()
	sequence = models.PositiveSmallIntegerField()

	def __str__(self):
		return f"{self.bus} {self.sequence} {self.stoppage}"
    
	class Meta:
		unique_together = (('bus', 'sequence'))  # Ensures no duplicate entries for the same bus and station
		ordering = ['bus', 'sequence']  # Orders the routes by train and sequence

class Schedule(models.Model):
	bus = models.ForeignKey(Bus, on_delete=models.CASCADE)
	reverse_direction = models.BooleanField(default=False)
	start_time = models.TimeField()
	special_note = models.CharField(max_length=100, blank=True, null=True)
	days_of_week = models.PositiveSmallIntegerField(default=6) #5 for weekdays, 6 for Saturday, 7 for Sunday

	def __str__(self):
		return f"{self.start_time} {self.bus} {self.special_note}"
	
	class Meta:
		unique_together = ('bus', 'reverse_direction', 'start_time')  # Ensures no duplicate entries for the same bus and station
		ordering = ['bus', 'start_time']

class LiveStatus(models.Model):
    bus = models.ForeignKey(Bus, on_delete=models.CASCADE)
    stoppage = models.ForeignKey(Stoppage, on_delete=models.CASCADE)
    start_time = models.ForeignKey(Schedule, on_delete=models.CASCADE)
    sequence = models.ForeignKey(Route, on_delete=models.CASCADE)
    update_time = models.DateTimeField()
    #delay = models.IntegerField()
    #current_location = models.CharField(max_length=255)
