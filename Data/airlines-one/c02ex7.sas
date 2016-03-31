data work.airports;
   infile 'airports.dat';
   input @ 1 Code $3.
         @ 4 City $50.
         @54 Country $15.;
run;

proc prnt data=work.airports;
run;
