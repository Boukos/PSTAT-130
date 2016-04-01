data army(keep=Code Airport)
     navy(keep=Code Airport City State Country)
     airforce(keep=Airport City State Country) 
     marines;  
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
