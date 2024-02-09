PImage map,player;
int gameMode = 0;//0:マップ 1:ゲーム画面
void setup(){
  size(800,481);
  map = loadImage("image/map.png");
  player = loadImage("image/player.png");
  imageMode(CENTER);
}

int x = 0;

void draw(){
  image(map,800/2,481/2);
  image(player,x*130+75,240);
}

void keyPressed() {
  if(gameMode != 0){
    return ;
  }
  
  if (keyCode == 'H') {    // キーコードを判定
     if(x!=0)x -= 1;
  }
  else if (keyCode == 'L') {
     if(x!=5)x += 1;
  }
}
