     /*Data must be sorted or indexed for 
       BY-group processing*/
proc sort data=prog2.dupsals out=dupsort;
   by EmpID;
run;

data gooddata baddata; 
      /*Both new data sets must be listed 
            in the DATA statement*/
   set dupsort;
   by EmpID;
     /*BY statement creates First.EmpID and Last.EmpID*/

   if First.EmpID and Last.EmpID 
       /*first and last of this ID means it's unique*/
      then output gooddata;
   else output baddata;
run;

   /*Create list reports of the results to verify the 
        output*/
proc print data=gooddata;
   title 'Non-Duplicate Empids';
run;

proc print data=baddata;
   title 'Duplicate Empids';
run;