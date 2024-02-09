void draw(){
  if(gameMode == 0){
    mapDraw();
  }
  if(gameMode == 1){
    gameDraw();
  }
}

void gameDraw(){
  image(stage,800/2,481/2);
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
