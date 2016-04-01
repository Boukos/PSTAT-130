data sales;
   length SalesID $ 4 Location $ 3;
   infile 'sales.dat'; *PC and Unix;
   *infile '.prog2.rawdata(sales)'; * z/OS;
   input SalesID $ Location $ @;
   if Location='USA' then
      input SaleDate : mmddyy10. Amount;
   else if Location='EUR' then
      input SaleDate : date9. Amount : commax8.;
run;

proc print data=sales noobs;
   title 'Sales for US and Europe';
run;
