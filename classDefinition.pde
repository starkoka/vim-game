class KeyInfo{
    public Boolean h;
    public Boolean j;
    public Boolean k;
    public Boolean l;
    public Boolean space;
    public KeyInfo(){
        h = false;
        j = false;
        k = false;
        l = false;
        space = false;
    }
}

class BarInfo{
    public int xy;
    public Boolean direction;
    public int img;
    public int count;
    public int move;
    public BarInfo(Boolean dir){
        direction = dir;
        move = -1;
        count = 60;
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
