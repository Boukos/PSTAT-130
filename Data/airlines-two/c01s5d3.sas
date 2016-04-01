data passed;
   set prog2.test;
   if Score>=.7;
run;

proc print data=passed noobs;
   title 'Students Who Passed the Final Exam';
run;