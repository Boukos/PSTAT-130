data address;
   length  LName FName $ 20 City $ 25 State $ 2 Phone $ 8;
   infile 'addresses.dat' dlm=',';
   input LName $ FName $ /
         City $ State $ /
         Phone $;
run;

proc print data=address noobs;
   title 'Employee Addresses';
run;