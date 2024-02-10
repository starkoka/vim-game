PImage map,player,stage;
int gameMode = 0;//0:マップ 1:ゲーム画面
void setup(){
    size(800,481);
    map = loadImage("image/map.png");
    player = loadImage("image/player.png");
    stage = loadImage("image/stage.png");
    imageMode(CENTER);
    gameSetup();
}

int stageNumber = 0;


KeyInfo keyState = new KeyInfo();
void mapDraw(){
    image(map,800/2,481/2);
    image(player,stageNumber*130+75,240);
}

void stageKey(){
    if (keyState.h) {
        if(stageNumber!=0)stageNumber -= 1;
    }
    else if (keyState.l) {
        if(stageNumber!=5)stageNumber += 1;
    }
    else if(keyState.space){
        println("ステージ選択!");
        println(stageNumber);
        gameMode = 1;
    }
}

void keyPressed() {
    if (keyCode == 'H') keyState.h = true;
    if (keyCode == 'J') keyState.j = true;
    if (keyCode == 'K') keyState.k = true;
    if (keyCode == 'L') keyState.l = true;
    if (keyCode == ' ')keyState.space = true;
    if(gameMode == 0){
        stageKey();
    }
    else if(gameMode == 1){
        gameKey();
    }
}

void keyReleased() {
    if (keyCode == 'H') keyState.h = false;
    if (keyCode == 'J') keyState.j = false;
    if (keyCode == 'K') keyState.k = false;
    if (keyCode == 'L') keyState.l = false;
    if (keyCode == ' ')keyState.space = false;
}
