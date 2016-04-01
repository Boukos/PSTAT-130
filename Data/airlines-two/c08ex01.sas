  /*Each data set must be sorted by ProdCode before merging*/

proc sort data=prog2.prices out=pricesort;
   by ProdCode;
run;

proc sort data=prog2.todaysales out=salesort;
   by ProdCode;
run;

data revenue
   NotSold(keep=Price ProdCode)
   InValidCode(Keep=ProdCode Qty);
   merge PriceSort(in=InPrice) SaleSort(in=InSales);
   by ProdCode;
   if InPrice and InSales then do; /*Matching Prodcodes*/
      Revenue = Qty * Price; /*Only necessary to 
                             calculate revenue for matches*/
      output revenue;
   end;
   else if InPrice and not InSales then 
		output notsold;
       /*Product not in TodaySales Data set. */
       /*It has not sold this week*/
   else  
		output invalidcode;
          /*Product in TodaySales that is not 
            in the master price list.*/
run;

proc print data=revenue;
run;

proc print data=notsold;
run;

proc print data=invalidcode;
run;
