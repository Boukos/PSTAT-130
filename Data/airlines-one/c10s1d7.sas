proc gchart data=ia.crew;
   pie JobCode / sumvar=Salary type=sum;
   format Salary dollar8.;
run;
   pie JobCode / sumvar=Salary type=sum
                 fill=x;
   format Salary dollar8.;
run;
   pie JobCode / sumvar=Salary type=sum 
                 fill=x explode='PILOT3';
   format Salary dollar8.;
run;
quit;

