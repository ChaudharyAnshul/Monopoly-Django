const user_id = JSON.parse(document.getElementById('user_id').textContent);
const roomName = JSON.parse(document.getElementById('game_room').textContent);

const chatSocket = new WebSocket(
    'ws://' +
    window.location.host +
    '/dashboard/game/' +
    roomName +
    '/'
);

chatSocket.onmessage = function (e) {
    const data = JSON.parse(e.data);
    if(data.game_status==true){
        document.getElementById('pauseButton').style.display = "inline";
        document.getElementById('resumeButton').style.display = "none";
    }
    if(data.game_status==false){
        document.getElementById('pauseButton').style.display = "none";
        document.getElementById('resumeButton').style.display = "inline";
    }
    const o_1 = '#b'+data.O_team_1+' '+'.T1';
    const team_o1 = document.querySelector(o_1);
    team_o1.innerHTML = '';
    team_o1.style.display = 'none';
    const p_1 = '#b'+data.P_team_1+' '+'.T1';
    const team_1 = document.querySelector(p_1);
    team_1.innerHTML = 'T1';
    team_1.style.display = 'inline';

    const o_2 = '#b'+data.O_team_2+' '+'.T2';
    const team_o2 = document.querySelector(o_2);
    team_o2.innerHTML = '';
    team_o2.style.display = 'none';
    const p_2 = '#b'+data.P_team_2+' '+'.T2';
    const team_2 = document.querySelector(p_2);
    team_2.innerHTML = 'T2';
    team_2.style.display = 'inline';

    const o_3 = '#b'+data.O_team_3+' '+'.T3';
    const team_o3 = document.querySelector(o_3);
    team_o3.innerHTML = '';
    team_o3.style.display = 'none';
    const p_3 = '#b'+data.P_team_3+' '+'.T3';
    const team_3 = document.querySelector(p_3);
    team_3.innerHTML = 'T3';
    team_3.style.display = 'inline';

    const o_4 = '#b'+data.O_team_4+' '+'.T4';
    const team_o4 = document.querySelector(o_4);
    team_o4.innerHTML = '';
    team_o4.style.display = 'none';
    const p_4 = '#b'+data.P_team_4+' '+'.T4';
    const team_4 = document.querySelector(p_4);
    team_4.innerHTML = 'T4';
    team_4.style.display = 'inline';

    const o_5 = '#b'+data.O_team_5+' '+'.T5';
    const team_o5 = document.querySelector(o_5);
    team_o5.innerHTML = '';
    team_o5.style.display = 'none';
    const p_5 = '#b'+data.P_team_5+' '+'.T5';
    const team_5 = document.querySelector(p_5);
    team_5.innerHTML = 'T5';
    team_5.style.display = 'inline';

    const o_6 = '#b'+data.O_team_6+' '+'.T6';
    const team_o6 = document.querySelector(o_6);
    team_o6.innerHTML = '';
    team_o6.style.display = 'none';
    const p_6 = '#b'+data.P_team_6+' '+'.T6';
    const team_6 = document.querySelector(p_6);
    team_6.innerHTML = 'T6';
    team_6.style.display = 'inline';

    const gameStats = document.querySelector('#gameStats');
    gameStats.innerHTML = 'Current Turn : Team ' + data.turn + '<br /> Previous Roll : ' + data.previous_roll;
    document.getElementById('currentTeam').value = data.turn;

}

function pauseGame(){
    alert('Game Paused');
    // document.getElementById('pauseButton').style.display = "none";
    // document.getElementById('resumeButton').style.display = "inline";
    chatSocket.send(JSON.stringify({
        'team_id': document.getElementById('currentTeam').value,
        'result': 0,
        'game_status': 'pause',
    }));
}

function resumeGame(){
    alert('Game Resumed');
    // document.getElementById('pauseButton').style.display = "inline";
    // document.getElementById('resumeButton').style.display = "none";
    chatSocket.send(JSON.stringify({
        'team_id': document.getElementById('currentTeam').value,
        'result': 0,
        'game_status': 'resume',
    }));
}

function skipTurn(){
    alert('Turn Skipped');
    chatSocket.send(JSON.stringify({
        'team_id': document.getElementById('currentTeam').value,
        'result': 0,
        'game_status': true,
    }));
}

