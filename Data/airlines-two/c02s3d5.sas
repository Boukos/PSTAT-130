data army;
   set prog2.military(firstobs=11 obs=25);
   if Type eq 'Army' then output;
run;
