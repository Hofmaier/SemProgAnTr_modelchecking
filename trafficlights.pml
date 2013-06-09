mtype={p,v,rot,gruen};
mtype zustand[2];
bool gestartet=false;
chan zentrale= [0] of {mtype,bit};
bit dran=0; /* who's next */
proctype ampel(bit name){
	 do
	 :: zustand[name]==rot ->
	    zentrale!p,name;
	    zustand[name]=gruen;
	    zustand[name]=rot;
	    zentrale!v,name;
	 od;
}
proctype Semaphor(){
	 do	 
	 :: zentrale?p,eval(dran) ->
	    zentrale?v,_;
	    dran=1-dran;	
	 od;
}
init{
	atomic{
		zustand[0]=rot;
		zustand[1]=rot;
		run ampel(0);
		run ampel(1);
		run Semaphor();
		gestartet=true;
	};		
}