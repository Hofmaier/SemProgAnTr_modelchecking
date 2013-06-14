#define request_semaphore(x) atomic{x>0;x--;}
#define release_semaphore(x) x++;

byte resourceA = 0;
byte resourceB = 1;
byte mutexA = 1;
byte mutexB = 1;

proctype TakeAFirst(){
	 request_semaphore(mutexA);
	 request_semaphore(mutexB);
	 byte temp1;
	 temp1 = resourceA+2;
	 resourceA = temp1;
	 byte temp2;
	 temp2 = resourceB * resourceA;
	 resourceB = temp2;
	 release_semaphore(mutexA);
	 release_semaphore(mutexB);
}

proctype TakeBFirst(){
	 request_semaphore(mutexB);
	 request_semaphore(mutexA);
	 byte temp1;
	 temp1 = resourceA+2;
	 resourceA = temp1;
	 byte temp2;
	 temp2 = resourceB * resourceA;
	 resourceB = temp2;
	 release_semaphore(mutexA);
	 release_semaphore(mutexB);	 
}
init{
atomic{
	run TakeAFirst();
	run TakeBFirst();
}
}