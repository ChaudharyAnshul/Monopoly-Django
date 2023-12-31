from django.db import models
from django.contrib.auth.models import User
from datetime import datetime    
# Create your models here.


class UserCount(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    login_count = models.IntegerField()
    
class PlayerCoins(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, default=None)
    balance = models.IntegerField()
    
class PropertyCard(models.Model):
    name = models.CharField(max_length=50)
    desc = models.CharField(max_length=100, default='')
    cost = models.IntegerField()
    rent = models.IntegerField()
    mortgage = models.IntegerField()
    status = models.BooleanField(default=True)
    mortgaged = models.BooleanField(default=False)
    def __str__(self):
        return self.name
    
class PropertyUserMap(models.Model):
    player = models.ForeignKey(PlayerCoins, on_delete=models.CASCADE)
    properties = models.ForeignKey(PropertyCard, on_delete=models.CASCADE)
    
class Transactions(models.Model):
    player = models.ForeignKey(PlayerCoins, on_delete=models.CASCADE)
    action = models.CharField(max_length=100)
    amount = models.IntegerField()
    balanceAtTransaction = models.IntegerField()
    payOrReveive = models.BooleanField()
    transaction_to = models.CharField(max_length=50)
    newBalance = models.IntegerField(default=0)
    data_time = models.DateTimeField(default=datetime.now)
    
class Moves(models.Model):
    current_turn = models.ForeignKey(PlayerCoins, on_delete=models.CASCADE)
    team_1 = models.IntegerField(default=0)
    team_2 = models.IntegerField(default=0)
    team_3 = models.IntegerField(default=0)
    team_4 = models.IntegerField(default=0)
    team_5 = models.IntegerField(default=0)
    team_6 = models.IntegerField(default=0)
    previous_roll = models.IntegerField(default=0)
    game_status = models.BooleanField(default=True)