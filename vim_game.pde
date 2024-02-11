PImage[] barImage;


void gameSetup(){
  barImage = new PImage[4];
  barImage[0] = loadImage("image/bar-warn.png");
  barImage[1] = loadImage("image/bar.png");
  barImage[2] = loadImage("image/bar2^wanr.png");
  barImage[3] = loadImage("image/bar2.png");
}

void draw(){
  if(gameMode == 0){
    mapDraw();
  }
  if(gameMode == 1){
    gameDraw();
  }
}

BarInfo barState = new BarInfo(true);

void gameDraw(){
  int moveFlame=(int)(120/(Math.abs(barState.move)*0.75));
  println(moveFlame);
  image(stage,800/2,481/2);
  if(barState.direction){
    int num=0;
    barState.count -= 1;
    if(barState.count <= -60){
      barState.count = moveFlame;
      if(random(100)>50){
        barState.move *= -1;
      }
      barState.xy = (int)random(0+Math.abs(barState.move)* moveFlame,400-Math.abs(barState.move)* moveFlame);
      println(barState.xy);
    }
    if(barState.count > 0)barState.xy += barState.move;
    if(barState.count <= 0)num+=1;
    image(barImage[barState.img+num],800/2,barState.xy);
  }
  else{
    image(barImage[barState.img],barState.xy,481/2);
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
