title1 'PSTAT 130 Lecture 6 Examples';

title2 'DATALINES statement';
data work.sample;
   input name $ gender $ age;
   datalines;
   John Male 22
   Elizabeth Female 19
;
run;
proc print data=work.sample;
run;

title2 'INFILE statement';
data work.sample;
   infile 'W:\TemporaryStorage\sample.txt';
   input name $ gender $ age;
run;
proc print data=work.sample;
run;

title2 'List Input';
data students; 
input Name $ Gender $ Age; 
datalines; 
David Male 19
Amelia Female 23
Ravi Male 17
Ashley Female .
Jim Male 26
;
run;
proc print data=students;
run;

title2 'Column Input';
data people; 
input Name $ 1-8 Gender $ 9-14 Age 17-18 ; 
datalines; 
David   Male     19
Amelia  Female   23
Ravi    Male     17
Ashley  Female   20
Jim     Male     26
;
run;
proc print data=people;
run;

title2 'Pointer Control - Absolute';
DATA temp;
  input @1  subj 4. 
        @6  f_name $11. 
		@18 l_name $6.
		+3 height 2. 
        +5 wt_date mmddyy8. 
        +1 calorie comma5.;
  format wt_date mmddyy8. calorie comma5.;
  DATALINES;
1024 Alice       Smith  1 65 125 12/1/95  2,036
1167 Maryann     White  1 68 140 12/01/95 1,800
1168 Thomas      Jones  2    190 12/2/95  2,302
1201 Benedictine Arnold 2 68 190 11/30/95 2,432
1302 Felicia     Ho     1 63 115 1/1/96   1,972
  ;
RUN;
PROC PRINT data = temp;
  title 'Output dataset: TEMP';
  id subj;
RUN;


title2 'Formatted Input';
data students; 
input Name $ Gender $ Age Enroll mmddyy8.; 
datalines; 
David Male 19 06/18/10
Amelia Female 23 08/02/10
Ravi Male 17 07/22/10
Ashley Female . 09/14/10
Jim Male 26 08/26/10
;
run;
proc print data=students;
run;

title2 'Pointer Control - Absolute';
data students; 
input @1 Name $6. @9 Gender $6. @18 Age 2. @22 Enroll mmddyy8.; 
datalines; 
David   Male     19  06/18/10
Amelia  Female   23  08/02/10
Ravi    Male     17  07/22/10
Ashley  Female   .   09/14/10
Jim     Male     26  08/26/10
;
run;
proc print data=students;
run;

title2 'Pointer Control - Relative';
data students; 
input Name $6. +2 Gender $6. +3 Age 2. +2 Enroll mmddyy8.; 
datalines; 
David   Male     19  06/18/10
Amelia  Female   23  08/02/10
Ravi    Male     17  07/22/10
Ashley  Female   .   09/14/10
Jim     Male     26  08/26/10
;
run;
