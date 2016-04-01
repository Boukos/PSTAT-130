data army navy airforce marines; 
   drop Type; 
   set prog2.military;
   if Type eq 'Army' then 
      output army;
   else if Type eq 'Naval' then 
      output navy;
   else if Type eq 'Air Force' then
      output airforce;
   else if Type eq 'Marine' then
      output marines;          
run;

proc print data=marines noobs;
   title 'Air Stations maintained by the US Marine Corps';
run;

