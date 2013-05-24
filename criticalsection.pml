bool critA = false;
bool critB = false;
acrive proctype A(){
	 critA = True;
	 //inside critical section
	 critA = False
}
active proctype B(){
	 critB = True;
	 //inside critical section
	 critB = False
}