mtype={p,v,red,green};
mtype tlstate[2];
chan center = [0] of {mtype,byte};
bit next_tl=0; /* who's next */
proctype trafficlight(bit name){
	 do
	 :: tlstate[name]==red ->
	    center!p,name;
	    tlstate[name]=green;
	    tlstate[name]=red;
	    center!v,name;
	 od;
}
proctype Semaphore(){
	 do	 
	 ::  center?p,eval(next_tl) ->
	    center?v,_;
	    next_tl=1-next_tl;	
	 od;
}
init{
	atomic{
		tlstate[0]=red;
		tlstate[1]=red;
		run trafficlight(0);
		run trafficlight(1);
		run Semaphore();
	};		
}