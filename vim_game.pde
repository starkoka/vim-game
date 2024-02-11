PImage[][] barImage;
BarInfo barState[];


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
    barState[i] = new BarInfo(true);
  }
}


void gameDraw(){  
  image(stage,800/2,481/2);
  for(int i=0;i<stageNumber+1;i++){
    //if(i==0)continue;
    int moveFlame=(int)(120/(Math.abs(barState[i].move)*0.75));
    if(barState[i].direction){
      int num=0;
      barState[i].count -= 1;
      if(barState[i].count <= -60){
        barState[i].count = moveFlame;
        if(random(100)>50){
          barState[i].move *= -1;
        }
        barState[i].xy = (int)random(0+Math.abs(barState[i].move)* moveFlame,400-Math.abs(barState[i].move)* moveFlame);
      }
      if(barState[i].count > 0)barState[i].xy += barState[i].move;
      if(barState[i].count <= 0){
        num+=1;
        if(Math.abs(barState[i].xy - playerY) < 23+15){
          println("接触した！");
        }
      }image(barImage[i][barState[i].img+num],800/2,barState[i].xy);
      
    }
    else{
      image(barImage[i][barState[i].img],barState[i].xy,481/2);
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
