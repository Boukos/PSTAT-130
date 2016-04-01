data labels(keep=FullName Address1 Address2);
   length FMName LName $ 10;
   set prog2.freqflyers;
   if substr(right(Id),6)='1' then
      Title='Ms.';
   else if substr(right(Id),6)='2' then 
      Title='Mr.';
   FMName=scan(Name,2,',');
   LName=scan(Name,1,',');
   FullName=Title !! ' ' !! trim(FMName) !! ' ' !! LName;
   Address2=scan(Address2,1,',') !! ', ' !!
            scan(Address2,3,',') !! ' ' !!
            scan(Address2,4,',');
run;

proc print data=labels noobs;
   var FullName Address1 Address2;
run;
