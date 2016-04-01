   /*Create an accumulating variable with the RETAIN statement*/ 
data mnthtot;
   set prog2.daysales;
   retain Mth2Dte 0;
   Mth2Dte=Mth2Dte+SaleAmt;
run;

proc print data=mnthtot noobs;
   format SaleDate date9.;
   title 'Calculate Sales to Date with the '
         'RETAIN Statement';
run;

   /*Create an accumulating variable with the sum statement*/
data mnthtot2;
   set prog2.daysales;
   Mth2Dte+SaleAmt;
run;

proc print data=mnthtot2 noobs;
   format SaleDate date9.;
   title 'Calculate Sales to Date with the '
         'Sum Statement';
run;