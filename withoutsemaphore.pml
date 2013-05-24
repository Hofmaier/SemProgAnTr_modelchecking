byte x = 0;
byte nrOfProcInCritSec=0;
proctype WithoutSynchronization (){
nrOfProcInCritSec++;
byte temp;
temp = x+2;
x = temp ;
nrOfProcInCritSec--;
}
init{
atomic{
	run WithoutSynchronization();
	run WithoutSynchronization();
}
(nrpr == 1) ->
assert ( x <4);
}