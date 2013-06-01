#define request_semaphore(x) atomic{x>0;x--;}
#define release_semaphore(x) x++;

byte x = 0;
byte mutex = 1;
byte nrOfProcInCritSec = 0;

proctype WithSynchronization(){

	 request_semaphore(mutex)
	 
	 nrOfProcInCritSec++;
	 byte temp;
	 temp = x+2;
	 x = temp;
	 nrOfProcInCritSec--;

	 release_semaphore(mutex)
}

init{
atomic{
	run WithSynchronization();
	run WithSynchronization();
}
(_nr_pr == 1)->
	assert(x>3);
}
