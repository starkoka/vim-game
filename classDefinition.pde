class KeyInfo{
    public Boolean h;
    public Boolean j;
    public Boolean k;
    public Boolean l;
    public Boolean enter;
    public KeyInfo(){
        h = false;
        j = false;
        k = false;
        l = false;
        enter = false;
    }
}

class BarInfo{
    public int xy;
    public Boolean direction;
    public int img;
    public float count;
    public int move;
    public Boolean visibility;
    public BarInfo(Boolean dir){
        direction = dir;
        move = -1;
        count = 60-(int)random(0,110);
        if(count > 0){
          visibility = true;
        }
        else{
          visibility = false;
        }
        if(direction){
            xy = 200;
            img = 0;
        }
        else{
            xy = 400;
            img = 2;
        }
        
    }
}
