class StageBack{
  int worldNum=0;
  
  //ステージ画像のインポート
  PImage stageImg[] = new PImage[1];
  StageBack(int w){
    worldNum = w;
    stageImg[0] = loadImage("data/image/stage0.png");
    
    for(int i=0;i<stageImg.length;i++){
      stageImg[i].resize(960,720);
    }
  }
  
  void worldSet(int w){
    worldNum = w;
  }

  void stageShow(){
    background(255, 0, 0);
    image(stageImg[worldNum], 0, 0);
  }
  
  void hide(){
    background(255, 0, 0);
  }
}

class Stage extends StageBack{
  int stageNum=0;
  int stageX[] = new int[4];
  PImage player = loadImage("data/image/stagePlayer.png");
  Stage(int w,int s){
    super(w);
    stageNum = s;
    for(int i=0;i<4;i++){
      stageX[i] = 145*(i+1);
    }
    player.resize(40,40);
  }
  
  void move(int s){
    super.stageShow();
    image(player, stageX[stageNum], 340);
    if(s > stageNum){
      for(int i=stageX[stageNum];i<=stageX[s];i+=10){
        delay(1000);
        println("hoge");
        //super.stageShow();
        image(player, i, 350);
        
      }
    }
    else if(s < stageNum){
      for(int i=stageX[stageNum];i>=stageX[s];i-=10){
        super.stageShow();
        image(player, i, 350);
      }
    }
    //stageNum = s;
  }
  
  void playerHide(){
    background(255, 0, 0);
  }
}




size(960,720);
Stage s = new Stage(0,0);
s.move(1);
