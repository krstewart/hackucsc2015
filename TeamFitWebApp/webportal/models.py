from django.db import models
from django.contrib.auth.models import User

class userTeam(models.Model):
	name = models.CharField(max_length=30,)
	score = models.IntegerField()

class userProfile(models.Model):
	user = models.OneToOneField(User)
	team = models.ForeignKey(userTeam)
	age = models.IntegerField()
	sex = models.CharField(max_length=30,)
	height = models.IntegerField()
	weight = models.IntegerField()
	dailyCaloricGoal = models.IntegerField()
	currentCaloricCount = models.IntegerField()