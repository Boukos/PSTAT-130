proc gchart data=ia.crew;
   vbar JobCode / sumvar=Salary type=mean;
run;