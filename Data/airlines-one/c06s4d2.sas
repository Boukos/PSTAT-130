libname ia '.';
data ia.dfwlax;
   infile 'dfwlax.dat';
   input @1 Flight $3. @4 Date mmddyy8.
         @12 Dest $3. @15 FirstClass 3.
         @18 Economy 3.;
   format Date mmddyy10.;
   label Dest='Destination'
         FirstClass='First Class Passengers'
         Economy='Economy Passengers';
run;
proc contents data=ia.dfwlax;
run;
proc print data=ia.dfwlax label;
run;
