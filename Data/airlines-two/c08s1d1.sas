data newtrans
     noactiv (drop=Trans Amnt)
     noacct  (drop=Branch);
   merge prog2.transact(in=InTrans)
         prog2.branches(in=InBanks);
   by ActNum;
   if intrans and inbanks then output NewTrans;
   else if inbanks and not intrans then output noactiv;
   else if intrans and not inbanks then output noacct;
run;

proc print data=newtrans noobs;
   title 'Account Transactions for Current Week';
run;

proc print data=noactiv noobs;
   title 'No Activity on These Accounts';
run;

proc print data=noAcct noobs;
   title 'Bad Account Number';
run;
