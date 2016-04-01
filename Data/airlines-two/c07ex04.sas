data passed(drop=i) failed(drop=i);
   set prog2.testans;

   /* Two ARRAY statements are necessary. The
      first ARRAY statement creates a SAS array
      that contains the ten responses each
      test-taker selected. The second ARRAY
      statement creates a SAS array that contains
      the ten correct answers for each of the
      ten questions. */

   array Response{10} Q1-Q10;
   array Answer{10} $ 1 _temporary_ ('A','C','C','B','E','E','D','B','B','A');
   Score=0;
   do i=1 to 10;
      if Answer{i}=Response{i} then
      Score+1;
   end;
   if Score ge 7 then
      output passed;
   else output failed;
run;

proc print data=passed;
run;

proc print data=failed;
run;
