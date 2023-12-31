from django.urls import path, include
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('account/login/', views.account_login, name='account_login'),
    path('account/logout/', views.account_logout, name='account_logout'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('dashboard/game', views.game, name='game'),
    path('dashboard/your_game', views.your_game, name='your game'),
    path('dashboard/bank', views.bank, name='bank'),
    path('dashboard/bank_transaction', views.bank_transaction, name='bank transaction'),
    path('dashboard/transactions/<team>', views.transactions, name='transactions'),
    path('dashboard/allProperties/<team>', views.all_properties, name='all properties'),
    path('dashboard/support/', views.support, name='support'),
    path('dashboard/support/logout', views.support_logout, name='support logout'),
    
]