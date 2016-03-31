data work.dfwlax;
   infile 'dfwlax.dat';
   input @1 Flight $3. @4 Date mmddyy8.
         @12 Dest $3. @15 FirstClass 3.
         @18 Economy 3.;
run;
proc print data=work.dfwlax;
run;