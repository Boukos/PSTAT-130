libname ia '.';
          
proc gchart data=ia.crew;
   vbar JobCode;
run;