data statepop;
input state $12. pop comma12.;
label 	state = 'State Name'
		pop = 'Population (in millions)';
format pop comma12.;
datalines;
California  36,961,664
Texas       24,782,302
New York    19,541,453
Florida     18,537,969
Illinois    12,910,409
;
run;

proc print label;
run;

proc datasets library = work;
modify statepop; 					*Tells SAS which dataset to modify;
label pop = 'State Population'; 	*Changes the POP variable label;
format pop Comma16.2; 				*Changes the POP variable format;
rename pop = population; 			*Renames the POP variable name;
run;

proc print;
run;

proc print label;
run;

/*This is an example of using label and format statements within a DATA step
to permanently modify the data set.  By default, Proc Print will display the 
variable names, not the labels.  You must use the label option to print the 
assigned labels.
*/

libname ia 'X:\PSTAT 130\airlines one';
data work.temployees;
   	set ia.employees;
	where city = 'NASHVILLE';
   	label 	firstname = 'First Name'
   			lastname = 'Last Name'
			hiredate = 'Date of Hire';
	format hiredate mmddyy10.;
run;

proc print data=work.temployees;
   var firstname lastname;
   title 'Default Column Headings - Variable Names';
run;

proc print data=work.temployees label;  *adding labelin proc print applies the label created above;
   var firstname lastname;				*only print the firstname and lastname column;
   title 'Variable Labels as Column Headings';
run;

/*This example compares WHERE, IF and IF-THEN DELECT methods of selecting rows.  
In the first DATA step, jobcode exists in the ia.empdata table, so we can 
evaluate it in a WHERE statement.  In the second DATA step, Bonus is a 
calculated variable, so we have to use an IF statement to evaluate it.
*/

libname ia 'X:\PSTAT 130\airlines one';
data work.tempdata;
   set ia.empdata;
   where jobcode = 'PILOT';
run;

proc print data=work.tempdata;
run;

data work.tempdata;
   	set ia.empdata; 			* set the dataset youre working with;
	Bonus = Salary * 0.1;
    If Bonus > 5000;
run;

proc print data=work.tempdata;
run;

/*This is an example of using the date constant to evaluate hiredate.
Employees hired prior to 1990 are in the pension program.
*/
libname ia 'X:\PSTAT 130\airlines one';
data work.temployees;
   	set ia.employees;
	where city = 'NASHVILLE';
	if hiredate < '01jan90'd then status = 'pension'; else status = '401k'; * 'd' after date is for a date and not a character;
run;
proc print;
   var lastname hiredate status;
   title 'Use of date constant - Pension status based on hire date';
run;

/*This is an example of using the DatePart function
*/
data datestuff;
  input name $ birthdatetime datetime.;
  birthdate = datepart(birthdatetime); *datepart tells you SAS birthdate from the amount of time you have been alive;
datalines;
John 16mar97:11:23:07.4
Liz 23jun94:16:14:02.1
;
	format birthdatetime mmddyy10.;
run;

proc print data=datestuff;
   title 'Use of DATEPART function to return Birth Date from Birth Date and Time';
run;

/*
More on if then statements:  
*/

libname data1 'X:\Pstat 130\data1';

data work.tempadmit;
	set data1.admit;
	length gender ht_status $25;

	if sex = 'F' then do;
		gender = 'Female';
		if height > 65 then ht_status = 'Tall'; else ht_status = 'Short';
	end;
	if sex = 'M' then do; 
		gender = 'Male'; 
		if height > 70 then ht_status = 'Tall'; else ht_status = 'Short';
	end;

	if ht_status = 'Short'; 
run;

proc print data=data1.tempadmit; 
run;

proc contents data=work.tempadmit;
run;
