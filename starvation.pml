bool mutexA = 1;
bool mutexB = 1;
bool critA = false;
active proctype A(){
       do
       ::mutexA--;
	 do
	 ::(mutexB == 0) ->
	  mutexA++;
	  mutexA--
	  ::else -> break
	  od;
	  critA = true;
	 //inside critical section
	 critA = true;
	 mutexA++;
	 critA = false
	od
}
active proctype B(){
       do
       ::mutexB--;
	 do
	 ::(mutexA == 0) ->
	  mutexB++;
	  mutexB--
	  ::else -> break
	  od;
       //inside critical section
       mutexB++
       od
}