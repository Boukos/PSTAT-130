data silver(drop=Location);
   length Year $ 4;
   set prog2.ffhistory;
   Status=tranwrd(Status,'silver','Silver');
   Location=index(Status,'Silver');
   if Location > 0;
   Year=substr(Status,Location+7,4);
run;

proc print data=silver noobs;
   title 'Silver-level frequent flyers';
   var Id Status Year SeatPref;
run;
