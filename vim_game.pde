PImage[][] barImage;
BarInfo barState[];
int[] bestScore;

void gameSetup(){
  barImage = new PImage[6][];
  for(int i=0;i<6;i++){
    barImage[i] = new PImage[4];
    String image = "image/";
    String bar = "/bar";
    String warn = "-warn";
    String two = "2";
    String png = ".png";
    
    Integer I = Integer.valueOf(i);
    String num = I.toString();
    barImage[i][0] = loadImage(image+num+bar+warn+png);
    barImage[i][1] = loadImage(image+num+bar+png);
    barImage[i][2] = loadImage(image+num+bar+two+warn+png);
    barImage[i][3] = loadImage(image+num+bar+two+png);
  }
  barState = new BarInfo[6];
  for(int i=0;i<6;i++){
    barState[i] = new BarInfo(i%2==0);
  }
  
  bestScore = new int[6];
  for(int i=0;i<6;i++){
    bestScore[i] = 0;
  }
}

float moveFlame=120;
int timer = 0;

void gameDraw(){  
  gameScore += 1;
  image(stage,800/2,481/2);
  for(int i=0;i<stageNumber+1;i++){
    if(barState[i].direction){
      int num=0;
      barState[i].count -= 1;
      if(barState[i].count <= -120){
        barState[i].count = moveFlame-(int)random(0,moveFlame/3);
        barState[i].move *= 1.02;
        moveFlame /= 1.02;
        
        if(random(100)>50){
          barState[i].move *= -1;
        }
        barState[i].xy = (int)random(0+Math.abs(barState[i].move)* moveFlame/2,400-Math.abs(barState[i].move)* moveFlame/2);
        barState[i].visibility = true;
      }
      if(barState[i].count <= -30){
        barState[i].visibility = false;
        barState[i].count -= random(0,70);
      }
      if(barState[i].count > 0)barState[i].xy += barState[i].move;
      if(barState[i].count <= 0){
        num+=1;
        if(Math.abs(barState[i].xy - playerY) < 23+15 && barState[i].visibility){
          println("接触した！");
          pause = 3;
          println(gameScore);
        }
      }
      if(barState[i].visibility)image(barImage[i][barState[i].img+num],800/2,barState[i].xy);
    }
    else{
      int num=0;
      barState[i].count -= 1;
      if(barState[i].count <= -120){
        barState[i].count = moveFlame-(int)random(0,moveFlame/3);
        barState[i].move *= 1.02;
        moveFlame /= 1.02;
        
        if(random(100)>50){
          barState[i].move *= -1;
        }
        barState[i].xy = (int)random(0+Math.abs(barState[i].move)* moveFlame/2,720-Math.abs(barState[i].move)* moveFlame/2);
        barState[i].visibility = true;
      }
      if(barState[i].count <= -30){
        barState[i].visibility = false;
        barState[i].count -= random(0,70);
      }
      if(barState[i].count > 0)barState[i].xy += barState[i].move;
      if(barState[i].count <= 0){
        num+=1;
        if(Math.abs(barState[i].xy - playerX) < 23+15 && barState[i].visibility){
          println("接触した！");
          pause = 3;
          println(gameScore);
        }
      }
      if(barState[i].visibility)image(barImage[i][barState[i].img+num],barState[i].xy,400);
    }
    
  }
  image(player,playerX,playerY);
}

int playerX = 800/2, playerY = 481/2;

void gameKey(){
  if (keyState.h) {
    if(playerX>=0)playerX-=10;
  }
  if (keyState.l) {
    if(playerX<=800)playerX+=10;
  }
  if (keyState.k) {
    if(playerY>=0)playerY-=10;
  }
  if (keyState.j) {
    if(playerY<=481)playerY+=10;
  }
}
