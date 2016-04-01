data silver(drop=Location);
   length Year $ 4;
   set prog2.ffhistory;
   Status=propcase(Status,' ,');
   Location=find(Status,'Silver');
   if Location > 0;
   SeatPref = propcase(SeatPref);
   Year=substr(Status,Location+7,4);
run;

proc print data=silver noobs;
   var Id Status Year SeatPref;
run;
