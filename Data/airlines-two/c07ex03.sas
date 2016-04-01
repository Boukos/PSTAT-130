data quarter(drop=Qtr);
   set prog2.donate;

   /* Two ARRAY statements are necessary. The
      first ARRAY statement creates a SAS array
      that contains the four quarterly
      contributions. The second ARRAY statement
      creates a SAS array that contains the
      four differences that will be calculated
      during the DATA step. */

   array Contrib{4} Qtr1-Qtr4;
   array Diff{4};

   Average=mean(of Qtr1-Qtr4);
   do Qtr=1 to 4;
      Diff{Qtr}=Contrib{Qtr}-Average;
   end;
run;

proc print data=quarter;
   var ID Average Diff1-Diff4;
run;
