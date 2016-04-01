data labels(keep=FullName Address1 Address2);
    length FMName LName $ 10;
	set prog2.freqflyers;
	if substr(right(ID),6) = '1' then
		Title = 'Ms.';                 
	else if substr(right(ID),6) = '2' then 
		Title = 'Mr.';
	FMName = scan(Name,2,',');            
	LName = scan(Name,1,',');
	FullName = catx(' ',Title,FMName,LName);
	Address2 = catx(' ',
	  scan(Address2,1,',') || ',',
	  scan(Address2,3,','),
	  scan(Address2,4,','));
run;

proc print data=labels noobs;
	var FullName Address1 Address2;
run;
