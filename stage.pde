PImage map,player,stage,pauseImg,gameOverImg,hideCommandModeImg,helpImg;
int gameMode = 0;//0:マップ 1:ゲーム画面
int stageNumber = 0;
int pause = 0;//0:なし 1:中断 2:ヘルプ 3:ゲームリザルト
int gameScore = 0;
void setup(){
    size(800,481);
    map = loadImage("image/map.png");
    player = loadImage("image/player.png");
    stage = loadImage("image/stage.png");
    pauseImg = loadImage("image/pause.png");
    gameOverImg = loadImage("image/gameover.png");
    hideCommandModeImg = loadImage("image/hideCommandMode.png");
    helpImg = loadImage("image/help.png");
    imageMode(CENTER);
    textAlign(CENTER);
    gameSetup();
}

Boolean pauseCheck = false;
Boolean changePauseHelp = true;
Boolean changeCommandMode = true;
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
        image(helpImg,800/2,481/2);
      }
      if(pause==3){
        image(gameOverImg,800/2,481/2);
        if(gameScore > bestScore[stageNumber])bestScore[stageNumber] = gameScore;
        Integer I = Integer.valueOf(gameScore);
        String num = I.toString();
        String txt = "SCORE:";
        Integer J = Integer.valueOf(bestScore[stageNumber]);
        String numnum = J.toString();
        String txttxt = "BESTSCORE:";
        textSize(16);
        text(txt+num,800/2,481/2+60);
        text(txttxt+numnum,800/2,481/2+90);
        String next = "Return to select menu with :q";
        textSize(12);
        text(next,800/2,481/2+120);
      }
    }
  }
  
  if(keyState.colon){
    if(changeCommandMode){
      keyState.commandMode = !keyState.commandMode;
      changeCommandMode = false;
    }
  }
  else{
    changeCommandMode = true;
  }
  if(keyState.commandMode){
    String next = "command mode";
    textSize(20);
    text(next,80,20);
    if(keyState.q){
      if(pause != 0){
        if(pause == 3){
          gameMode = 0;
        }
        pause = 0;
      }
      else if(gameMode == 1){
        gameMode = 0;
      }
      else{
        exit();
      }
      keyState.q = false;
      keyState.commandMode = false;
    }
  }
  if(keyState.f1){
      if(changePauseHelp){
        if(pause==0){
          pause = 2;
        }
        else if(pause==2){
          pause = 0;
        }
        changePauseHelp = false;
      }
  }
  else{
    changePauseHelp = true;
    if(pause!=0)image(hideCommandModeImg,800/2,481/2);
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
        gameScore = 0;
        for(int i=0;i<6;i++){
          barState[i].reset();
        }
        playerX = 800/2;
        playerY = 481/2;
    }
}

void keyPressed() {
    if (keyCode == 'H') keyState.h = true;
    if (keyCode == 'J') keyState.j = true;
    if (keyCode == 'K') keyState.k = true;
    if (keyCode == 'L') keyState.l = true;
    if (keyCode == 'Q') keyState.q = true;
    if (keyCode == 513)keyState.colon = true;
    if (keyCode == 112)keyState.f1 = true;
    if (keyCode == ENTER)keyState.enter = true;
    if (keyCode == ESC)keyState.esc = true;
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
    if (keyCode == 'Q') keyState.q = false;
    if (keyCode == 513) keyState.colon = false;
    if (keyCode == 112)keyState.f1 = false;
    if (keyCode == ENTER)keyState.enter = false;
    if (keyCode == ESC)keyState.esc = false;
}
