data flname(keep=NewName CityState);
   length FMname First MI Last $ 30;
   set prog2.people;
   Last = scan(Name,1,',');
   FMname = left(scan(Name,2,','));
   First = scan(FMname,1,' ');
   MI = scan(FMname,2,' ');
   NewName = trim(First) !! ' ' !! Last;
run;

proc print data=flname;
   var NewName CityState;
run;


  /* Alternate SAS9 solution */
data flname(keep=NewName CityState);
   length FMnames First MI Last $ 30;
   set prog2.people;
   FMnames=left(scan(Name,2,','));
   First=scan(FMnames,1,' ');
   MI=left(scan(FMnames,2,' '));
   Last=left(scan(Name,1,','));
   NewName=catx(' ',First,Last);
run;

proc print data=flname;
   var NewName CityState;
run;

