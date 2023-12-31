window.onload = printDice();
document.querySelector('input[type=button]').addEventListener('click', function(){rollTheDice();});
const user_id = JSON.parse(document.getElementById('user_id').textContent);
const roomName = JSON.parse(document.getElementById('game_room').textContent);
const team_id = JSON.parse(document.getElementById('team_id').textContent);


const chatSocket = new WebSocket(
    'ws://' +
    window.location.host +
    '/dashboard/game/' +
    roomName +
    '/'
);

function sendResult(result) {
    chatSocket.send(JSON.stringify({
        'team_id': team_id,
        'result': result,
        'game_status': true,
    }));
};

chatSocket.onmessage = function (e) {
    const data = JSON.parse(e.data);
    console.log(data);
    if(data.game_status == false){
        document.getElementById('displayTurn').innerHTML = "Turn : Team " + data.turn;
        document.getElementById('roll').style.display = "none";
        document.getElementById('notRoll').style.display = "none";
        document.getElementById('game_status').style.display = "inline";
    }
    else{
        document.getElementById('displayTurn').innerHTML = "Turn : Team " + data.turn;
        if(team_id == data.turn){
            document.getElementById('roll').style.display = "inline";
            document.getElementById('notRoll').style.display = "none";
            document.getElementById('game_status').style.display = "none";
        }
        else{
            document.getElementById('roll').style.display = "none";
            document.getElementById('notRoll').style.display = "inline";
            document.getElementById('game_status').style.display = "none";
        }
    }
}

function printDice() {
    var i,
        faceValue,
        output = '';
    for (i = 0; i < 2; i++) {
        faceValue = Math.floor(Math.random() * 6);
        output += "&#x268" + faceValue + "; ";
    }
    document.getElementById('dice').innerHTML = output;
    document.getElementById('roll').style.display = "none";
}

var rollTheDice = function() {
    var i,
        faceValue,
        output = '',
        result = 0;
    for (i = 0; i < 2; i++) {
        faceValue = Math.floor(Math.random() * 6);
        result += faceValue+1;
        output += "&#x268" + faceValue + "; ";
    }
    console.log(result);
    document.getElementById('dice').innerHTML = output;
    sendResult(result)
}