from django.shortcuts import render, redirect
from django.contrib.auth.models import auth,User
from django.contrib.sessions.models import Session
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout as django_logout
from .models import *
from django.contrib import messages



# Create your views here.
site_name = 'Monopoly'
data = {"site_name":site_name}

def home(request):
    if request.user.is_authenticated:
        return redirect('/dashboard')
    else:
        return render(request, 'home/home.html', data)

def account_login(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            user_count = UserCount.objects.get(user = user.id)
            if user_count.login_count == 0:
                user_count.login_count = 1
                user_count.save()
                auth.login(request, user)
                return redirect('/dashboard')
            else:
                messages.info(request, 'User is Online, logout from previous device')
                return redirect('/')
        else:
            messages.info(request, 'Please Enter correct email id or password')
            return redirect('/')
    else:
        return redirect('/')

@login_required(login_url = '/') 
def account_logout(request):
    if request.method == "GET":
        user = User.objects.get(id = request.user.id)
        user_count = UserCount.objects.get(user = user.id)
        user_count.login_count = user_count.login_count - 1
        user_count.save()
        auth.logout(request)
        messages.info(request, 'Logout Successfull')
        return redirect('/')
    
def user_data(request):
    data.update({'icon_image':'images/dashboard/User_icon.png'})
    data.update({'game_room':'round_3'})

@login_required(login_url = '/') 
def dashboard(request):
    if request.method == 'GET':
        user_data(request)
        return render(request, 'dashboard/base.html', data)

@login_required(login_url = '/') 
def game(request):
    if request.user.is_superuser:
        if request.method == 'GET':
            user_data(request)
            return render(request, 'dashboard/game.html', data)

@login_required(login_url = '/') 
def your_game(request):
    if request.method == 'GET':
        user_data(request)
        player_data = PlayerCoins.objects.get(user = request.user.id)
        data.update({'player_data':player_data})
        data.update({'team_id':int(player_data.id)})
        properties = PropertyUserMap.objects.filter(player = player_data)
        data.update({'properties':properties})
        return render(request, 'dashboard/your_game.html', data)
    
@login_required(login_url = '/') 
def bank(request):
    if request.user.is_superuser:
        if request.method == 'GET':
            user_data(request)
            teams = PlayerCoins.objects.all()
            data.update({'teams':teams})
            return render(request, 'dashboard/bank.html', data)
    
@login_required(login_url = '/') 
def bank_transaction(request):
    if request.user.is_superuser:
        if request.method == 'POST':
            team_1 = User.objects.get(username = request.POST['team_name'])
            player_1 = PlayerCoins.objects.get(user = team_1)
            pay_recieve = request.POST['pay_recieve']
            if pay_recieve == 'True':
                balance_1 = player_1.balance + int(request.POST['amount'])
                transaction_1 = Transactions.objects.create(
                    player = player_1,
                    action = request.POST['action'],
                    amount = request.POST['amount'],
                    balanceAtTransaction = player_1.balance,
                    payOrReveive = True,
                    transaction_to = request.POST['transaction_to'],
                    newBalance = balance_1,
                )
                transaction_1.save()
                player_1.balance = balance_1
                player_1.save()
                if request.POST['transaction_to'] != "bank":
                    team_2 = User.objects.get(username = request.POST['transaction_to'])
                    player_2 = PlayerCoins.objects.get(user = team_2)
                    balance_2 = player_2.balance - int(request.POST['amount'])
                    transaction_2 = Transactions.objects.create(
                        player = player_2,
                        action = 'Pay to Player',
                        amount = request.POST['amount'],
                        balanceAtTransaction = player_2.balance,
                        payOrReveive = False,
                        transaction_to = request.POST['team_name'],
                        newBalance = balance_2,
                    )
                    transaction_2.save()
                    player_2.balance = balance_2
                    player_2.save()
            else:
                balance_1 = player_1.balance - int(request.POST['amount'])
                transaction_1 = Transactions.objects.create(
                    player = player_1,
                    action = request.POST['action'],
                    amount = request.POST['amount'],
                    balanceAtTransaction = player_1.balance,
                    payOrReveive = False,
                    transaction_to = request.POST['transaction_to'],
                    newBalance = balance_1,
                )
                transaction_1.save()
                player_1.balance = balance_1
                player_1.save()
                if request.POST['transaction_to'] != "bank":
                    team_2 = User.objects.get(username = request.POST['transaction_to'])
                    player_2 = PlayerCoins.objects.get(user = team_2)
                    balance_2 = player_2.balance + int(request.POST['amount'])
                    transaction_2 = Transactions.objects.create(
                        player = player_2,
                        action = 'Recieve from Player',
                        amount = request.POST['amount'],
                        balanceAtTransaction = player_2.balance,
                        payOrReveive = True,
                        transaction_to = request.POST['team_name'],
                        newBalance = balance_2,
                    )
                    transaction_2.save()
                    player_2.balance = balance_2
                    player_2.save()
            messages.info(request, 'Done Transaction')
            return redirect('/dashboard/bank')
    
@login_required(login_url = '/') 
def transactions(request, team):
    if request.method == 'GET':
        if team == 'all':
            user_data(request)
            transactions = Transactions.objects.all()
            transactions = transactions.order_by('-data_time')
            data.update({'transactions':transactions})
            return render(request, 'dashboard/transactions.html', data)
        elif team == 'Team_1' or team == 'Team_2' or team == 'Team_3' or team == 'Team_4' or team == 'Team_5' or team == 'Team_6':
            print(team)
            user_data(request)
            user = User.objects.get(username = team)
            player = PlayerCoins.objects.get(user = user)
            transactions = Transactions.objects.filter(player = player)
            transactions = transactions.order_by('-data_time')
            data.update({'transactions':transactions})
            return render(request, 'dashboard/transactions.html', data)
        else:
            pass
        
@login_required(login_url = '/') 
def all_properties(request, team):
    if request.method == 'GET':
        if team == 'all':
            user_data(request)
            properties = PropertyUserMap.objects.all()
            data.update({'properties':properties})
            return render(request, 'dashboard/allProperties.html', data)
            
        elif team == 'Team_1' or team == 'Team_2' or team == 'Team_3' or team == 'Team_4' or team == 'Team_5' or team == 'Team_6':
            user_data(request)
            user = User.objects.get(username = team)
            player = PlayerCoins.objects.get(user = user)
            properties = PropertyUserMap.objects.filter(player = player)
            data.update({'properties':properties})
            return render(request, 'dashboard/allProperties.html', data)
        else:
            pass
        
@login_required(login_url = '/') 
def support(request):
    if request.user.is_superuser:
        user_data(request)
        teams = PlayerCoins.objects.all()
        data.update({'teams':teams})
        return render(request, 'dashboard/support.html', data)
        
@login_required(login_url = '/') 
def support_logout(request):
    if request.user.is_superuser:
        user = User.objects.get(username= request.POST['team_name'])
        for s in Session.objects.all():
            if s.get_decoded().get('_auth_user_id') == str(user.id):
                s.delete()
        return redirect('/dashboard/support/')
    else:
        pass