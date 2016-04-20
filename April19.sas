libname data1 'W:\TemporaryStorage\PSTAT 130\data1';

proc print data=data1.insure;
run;

data work.insure1;
	set data1.insure(drop=id total);
run;

proc print data=insure1;
run;

data work.insure2;
set data1.insure;
drop policy balancedue;
run;

proc print data=insure2;
run;


data insure3;
set data1.insure;
keep name balancedue;
run;

proc print data=insure3;
run;

data insure4;
set data1.insure (keep = name balancedue);
run;

proc print data=insure4;
run;
