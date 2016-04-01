data invest;
   do Year=2001 to 2003;
      Capital+5000;
      Capital+(Capital*.075);
      output;
   end;
run;

proc print data=invest noobs;
   title1 'Results of investing 5000 dollars for';
   title2 'three years at 7.5 percent interest.';
run;
