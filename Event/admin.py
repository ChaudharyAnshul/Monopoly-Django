from django.contrib import admin
from .models import *
# Register your models here.

class user_count(admin.ModelAdmin):
    list_display = ('id', 'user', 'login_count')
    search_fields = ('user',)
    ordering = ('id', 'user',)
    list_filter = ('user',)
admin.site.register(UserCount, user_count)


class player_coins(admin.ModelAdmin):
    list_display = ('id', 'user', 'balance')
    search_fields = ('user',)
    ordering = ('id', 'user',)
    list_filter = ('user',)
admin.site.register(PlayerCoins, player_coins)

class property_card(admin.ModelAdmin):
    list_display = ('id', 'name', 'cost', 'rent', 'mortgage', 'status', 'mortgaged')
    search_fields = ('name',)
    ordering = ('id', 'name',)
    list_filter = ('name',)
admin.site.register(PropertyCard, property_card)

class property_user_map(admin.ModelAdmin):
    list_display = ('id', 'player', 'properties')
    search_fields = ('player', 'properties',)
    ordering = ('id', 'player',)
admin.site.register(PropertyUserMap, property_user_map)

class transaction(admin.ModelAdmin):
    list_display = ('id', 'player', 'action', 'amount', 'balanceAtTransaction', 'payOrReveive', 'transaction_to')
    search_fields = ('player',)
    ordering = ('id', 'player',)
admin.site.register(Transactions, transaction)

class move(admin.ModelAdmin):
    list_display = ('current_turn', 'team_1', 'team_2', 'team_3', 'team_4', 'team_5', 'team_6', 'previous_roll', 'game_status')
admin.site.register(Moves, move)