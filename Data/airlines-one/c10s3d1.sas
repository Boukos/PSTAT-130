libname ia '.';
proc gplot data=ia.flight114;
   where date between '02mar2001'd and 
         '08mar2001'd;
   plot Boarded*Date;
   title 'Total Passengers for Flight 114';
   title2 'between 02Mar2001 and 08Mar2001';
run; 
   plot Boarded*Date;
   symbol value=square i=join;
run;
   plot Boarded*Date;
   symbol c=red w=2;
run;
   plot Boarded*Date / vaxis=100 to 200 by 25
                       ctext=blue;
run;
   plot Boarded*Date / vaxis=100 to 200 by 25
                       ctext=blue;
   label Boarded='Passengers Boarded'  
         Date='Departure Date';
run; 
quit;


