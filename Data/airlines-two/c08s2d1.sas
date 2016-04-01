proc sql;
   title 'Join -- No WHERE clause';
   select *
      from prog2.transact, prog2.branches
      ;

title 'Inner Join';
   select Transact.ActNum, Trans, Amnt, Branch
      from prog2.transact, prog2.branches
      where Transact.ActNum=Branches.ActNum
      ;

title 'Inner Join with a WHERE Using an Alias';
   select Trans.ActNum, Trans, Amnt, Branch
      from prog2.transact as Trans, prog2.branches as Banks
      where Trans.ActNum=Banks.ActNum
      ;
quit;