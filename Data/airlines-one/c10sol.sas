*Chapter 10, Exercise 1 Solution;

*Part a;
 
proc gchart data=ia.personl;
   where JobCode in ('TA1', 'TA2', 'TA3');
   vbar Gender;
run;

*Part b;

proc gchart data=ia.personl;
   where JobCode in ('TA1', 'TA2', 'TA3');
   vbar Gender;
   title c=blue f=duplex 'Number of Male and Female '    
                         'Ticket Agents';
run;

*Part c;

proc gchart data=ia.personl;
   where JobCode in ('TA1', 'TA2', 'TA3');
   pie JobCode / sumvar=Salary type=mean;
   title c=red 'Average Salaries of Ticket Agents';
run;

*Part d;

proc gchart data=ia.personl;
   where JobCode in ('TA1', 'TA2', 'TA3');
   pie JobCode / sumvar=Salary type=mean fill=x
                 explode='TA3';
   title c=red 'Average Salaries of Ticket Agents';
run;

*Chapter 10, Exercise 2 Solution;

data chicago;
   set ia.chicago;
   Day=weekday(Date);
run;
proc gchart data=chicago;
   hbar Day / sumvar=Boarded type=sum discrete;
   label Boarded='Passengers';
   title c=blue 'Passengers by Day of the Week';
run;

 
*Chapter 10, Exercise 3 Solution;

proc gplot data=ia.delay;
   where Dest='CPH';
   plot Delay*Date / vaxis = -15 to 30 by 15;
   title c=red 'Flights to Copenhagen';
   symbol i=needle c=red v=square;
run; 
