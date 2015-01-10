from django.db import models

Class userProfile(models.Model):
	user = models.OneToOneField(User)
	team = models.ForeignKey(userTeam)
	age = models.IntegerField()
	sex = models.CharField()
	height = models.IntegerField()
	weight = IntegerField()
	dailyCaloricGoal = IntegerField()
	currentCaloricCount = IntegerField()

Class userTeam(models.Model):
	name = models.CharField(max_length=30,)
	score = models.IntegerField()