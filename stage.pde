PImage map,player,stage,pauseImg;
int gameMode = 0;//0:マップ 1:ゲーム画面
int stageNumber = 0;
int pause = 0;//0:なし 1:中断 2:ヘルプ 3:ゲームリザルト
void setup(){
    size(800,481);
    map = loadImage("image/map.png");
    player = loadImage("image/player.png");
    stage = loadImage("image/stage.png");
    pauseImg = loadImage("image/pause.png");
    imageMode(CENTER);
    gameSetup();
}

Boolean pauseCheck = false;

void draw(){
  if(pause == 0){
    pauseCheck = false;
    if(gameMode == 0){
      mapDraw();
    }
    if(gameMode == 1){
      gameDraw();
    }
  }
  else{
    if(!pauseCheck){
      pauseCheck = true;
      if(pause==1){
        image(pauseImg,800/2,481/2);
      }
      if(pause==2){
        
      }
      if(pause==3){
        image(pauseImg,800/2,481/2);
      }
    }
  }
}




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
    else if(keyState.enter){
        println("ステージ選択!");
        println(stageNumber);
        gameMode = 1;
        moveFlame = 120;
    }
}

void keyPressed() {
    if (keyCode == 'H') keyState.h = true;
    if (keyCode == 'J') keyState.j = true;
    if (keyCode == 'K') keyState.k = true;
    if (keyCode == 'L') keyState.l = true;
    if (keyCode == ENTER)keyState.enter = true;
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
    if (keyCode == ENTER)keyState.enter = false;
}
