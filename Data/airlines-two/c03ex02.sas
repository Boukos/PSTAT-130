  /*Data must be sorted or indexed for
       BY-group processing*/
proc sort data=prog2.flymiles out=milesort;
   by ID;
run;

data freqmiles(drop=miles);
   set milesort;
   by ID;
      /*BY statement create First.ID and Last.ID*/
   if First.ID then TotMiles=0;
      /*Set TotMiles to 0 when ID changes*/
   TotMiles+Miles;
      /*sum statement creates TotMiles, retains it, sets
       initial value to 0, and ignores missing values of
       Miles*/
   if Last.ID;  /*Output only the last of each BY group*/
run;

   /*Create a list report of the data set to verify the
        output*/

proc print data=freqmiles;
run;
