data separate(drop=FMnames);
   length 	FMnames 
			First 	$ 30
			MI 		$  2
			Last 	$ 30;
   set prog2.people;
   FMnames = left(scan(Name,2,','));
   First = scan(FMnames,1,' ');
   MI = left(scan(FMnames,2,' '));
   Last = scan(Name,1,',');
run;

proc print data=separate;
   var Name CityState First MI Last;
run;
