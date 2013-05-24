byte x=0;

active proctype A(){
       byte tempA = x + 2;
       x = tempA;
}

active proctype B(){
       byte tempB = x + 5;
       x = tempB;
}