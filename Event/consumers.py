import json
from channels.generic.websocket import AsyncWebsocketConsumer
from channels.db import database_sync_to_async
from .models import *

class MonopolyEvent(AsyncWebsocketConsumer):
    async def connect(self):
        self.game_name = 'round_3'
        self.game_group_name = 'group_%s' % self.game_name

        await self.channel_layer.group_add(
            self.game_group_name,
            self.channel_name
        )

        await self.accept()
        
        turn_list = await self.get_moves()
        turn_list_old = await self.get_moves()
        
        
        await self.channel_layer.group_send(
            self.game_group_name,
            {
                'type': 'on_page_load',
                'turn': turn_list[0],
                'P_team_1': turn_list[1],
                'P_team_2':turn_list[2],
                'P_team_3': turn_list[3],
                'P_team_4': turn_list[4],
                'P_team_5': turn_list[5],
                'P_team_6': turn_list[6],
                'previous_roll': turn_list[7],
                'game_status': turn_list[8], 
                'O_team_1': turn_list_old[1],
                'O_team_2': turn_list_old[2],
                'O_team_3': turn_list_old[3],
                'O_team_4': turn_list_old[4],
                'O_team_5': turn_list_old[5],
                'O_team_6': turn_list_old[6],
            }
        )

        
    async def on_page_load(self, event):
        turn = event['turn']
        P_team_1 = event['P_team_1']
        P_team_2 = event['P_team_2']
        P_team_3 = event['P_team_3']
        P_team_4 = event['P_team_4']
        P_team_5 = event['P_team_5']
        P_team_6 = event['P_team_6']
        previous_roll = event['previous_roll']
        game_status = event['game_status']
        O_team_1 = event['O_team_1']
        O_team_2 = event['O_team_2']
        O_team_3 = event['O_team_3']
        O_team_4 = event['O_team_4']
        O_team_5 = event['O_team_5']
        O_team_6 = event['O_team_6']
        
        
        await self.send(text_data=json.dumps({
            'turn':turn,
            'P_team_1':P_team_1,
            'P_team_2':P_team_2,
            'P_team_3':P_team_3,
            'P_team_4':P_team_4,
            'P_team_5':P_team_5,
            'P_team_6':P_team_6,
            'previous_roll':previous_roll,
            'game_status':game_status,
            'O_team_1':O_team_1,
            'O_team_2':O_team_2,
            'O_team_3':O_team_3,
            'O_team_4':O_team_4,
            'O_team_5':O_team_5,
            'O_team_6':O_team_6,
            
        }))
        
    
    @database_sync_to_async
    def get_moves(self):
        turn_obj = Moves.objects.get(id=1)
        turn_list = [turn_obj.current_turn.id, turn_obj.team_1, turn_obj.team_2, turn_obj.team_3, turn_obj.team_4, turn_obj.team_5, turn_obj.team_6, turn_obj.previous_roll, turn_obj.game_status]
        return turn_list

    @database_sync_to_async
    def update_moves(self, next_team, position, team_id, dice):
        turn_obj = Moves.objects.get(id=1)
        turn = PlayerCoins.objects.get(id=next_team)
        turn_obj.current_turn = turn
        if team_id == 1:
            turn_obj.team_1 = position
        elif team_id == 2:
            turn_obj.team_2 = position
        elif team_id == 3:
            turn_obj.team_3 = position
        elif team_id == 4:
            turn_obj.team_4 = position
        elif team_id == 5:
            turn_obj.team_5 = position
        elif team_id == 6:
            turn_obj.team_6 = position
        turn_obj.previous_roll = dice
        turn_obj.save()
        return

    @database_sync_to_async
    def update_game_pause(self):
        turn_obj = Moves.objects.get(id=1)
        turn_obj.game_status = False
        turn_obj.save()
        return

    @database_sync_to_async
    def update_game_resume(self):
        turn_obj = Moves.objects.get(id=1)
        turn_obj.game_status = True
        turn_obj.save()
        return

    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.game_group_name,
            self.channel_name
        )

    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        if text_data_json['game_status'] == True:
            team_id = int(text_data_json['team_id'])
            dice = text_data_json['result']
            if dice == 12:
                next_team = team_id 
            else:
                next_team = (team_id + 1) % 6
                if next_team == 0:
                    next_team = 6

            turn_list_old = await self.get_moves()
            pos = turn_list_old[team_id]
            pos = (pos + dice) % 40
            if pos == 0:
                pos = 40
                
            await self.update_moves(next_team, pos, team_id, dice)
            turn_list = await self.get_moves()
        
        elif text_data_json['game_status'] == 'pause':
            turn_list_old = await self.get_moves()
            await self.update_game_pause()
            turn_list = await self.get_moves()
            pass
        elif text_data_json['game_status'] == 'resume':
            turn_list_old = await self.get_moves()
            await self.update_game_resume()
            turn_list = await self.get_moves()
            pass
        await self.channel_layer.group_send(
            self.game_group_name,
            {
                'type': 'next_turn',
                # 'dice': dice,
                'turn': turn_list[0],
                'P_team_1': turn_list[1],
                'P_team_2': turn_list[2],
                'P_team_3': turn_list[3],
                'P_team_4': turn_list[4],
                'P_team_5': turn_list[5],
                'P_team_6': turn_list[6],
                'game_status': turn_list[8], 
                'previous_roll': turn_list[7],
                'O_team_1': turn_list_old[1],
                'O_team_2': turn_list_old[2],
                'O_team_3': turn_list_old[3],
                'O_team_4': turn_list_old[4],
                'O_team_5': turn_list_old[5],
                'O_team_6': turn_list_old[6],
            }
        )
    
    async def next_turn(self, event):
        # dice = event['dice']
        turn = event['turn']
        P_team_1 = event['P_team_1']
        P_team_2 = event['P_team_2']
        P_team_3 = event['P_team_3']
        P_team_4 = event['P_team_4']
        P_team_5 = event['P_team_5']
        P_team_6 = event['P_team_6']
        previous_roll = event['previous_roll']
        game_status = event['game_status']
        O_team_1 = event['O_team_1']
        O_team_2 = event['O_team_2']
        O_team_3 = event['O_team_3']
        O_team_4 = event['O_team_4']
        O_team_5 = event['O_team_5']
        O_team_6 = event['O_team_6']

        await self.send(text_data=json.dumps({
            # 'dice': dice,
            'turn': turn,
            'P_team_1':P_team_1,
            'P_team_2':P_team_2,
            'P_team_3':P_team_3,
            'P_team_4':P_team_4,
            'P_team_5':P_team_5,
            'P_team_6':P_team_6,
            'previous_roll':previous_roll,
            'game_status':game_status,
            'O_team_1':O_team_1,
            'O_team_2':O_team_2,
            'O_team_3':O_team_3,
            'O_team_4':O_team_4,
            'O_team_5':O_team_5,
            'O_team_6':O_team_6,
        }))
        
        