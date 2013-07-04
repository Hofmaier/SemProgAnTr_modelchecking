bool critA = false;
bool critB = false;
active proctype A(){
	 critA = true;
	 //inside critical section
	 critA = false
}
active proctype B(){
	 critB = true;
	 //inside critical section
	 critB = false
}