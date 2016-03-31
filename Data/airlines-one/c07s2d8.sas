options nodate nonumber ls=64;
libname ia '.';
data over175;
   infile 'dfwlax.dat';
   input @1 Flight $3. @4 Date mmddyy8.
         @12 Dest $3. @15 FirstClass 3.
         @18 Economy 3.; 
   length City $ 11;
   Total=sum(FirstClass,Economy);
   if Total gt 175 and Date lt '14dec2000'd;
   if upcase(Dest)='DFW' then do;
      Revenue=sum(1500*FirstClass,900*Economy);
      City='Dallas';
   end;
   else if upcase(Dest)='LAX' then do; 
      Revenue=sum(2000*FirstClass,1200*Economy);
      City='Los Angeles';
   end;
run;
proc print data=over175;
   var Dest City Flight Date Total Revenue; 
   format Date date9.;
run; 