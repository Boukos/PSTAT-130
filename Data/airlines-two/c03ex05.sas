
data widebooks(drop=MerchType Sales);
   set prog2.salesbyday;   
   by date;
   retain Books Cards Periodicals;
   if MerchType='Books' then Books=Sales;
   else if MerchType='Cards' then Cards=Sales;
   else if MerchType='Periodicals' then Periodicals=Sales;
   if last.date then output;
run;

proc print data=widebooks;
   title 'Rotating a Data Set';
run;