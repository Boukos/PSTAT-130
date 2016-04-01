  /*Data must be sorted or indexed for
       BY-group processing*/
proc sort data=prog2.flydays out=daysort;
  by ID Code;
run;

data daymiles(drop=miles);
   set DaySort;
   by ID Code;
      /*BY statement creates First.ID, Last.ID
                          First.Code, and Last.Code*/
   if First.Code then TotMiles=0;
      /*Set TotMiles to 0 when subgroup changes*/
   TotMiles+Miles;
        /*sum statement creates TotMiles, retains it, sets
       initial value to 0, and ignores missing values of
       Miles*/
   if Last.Code then output;/*Output only the last of each BY group*/
run;

   /*Create a list report of the data set to verify the
        output*/

proc print data=daymiles;
run;
