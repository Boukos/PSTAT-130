libname ia '.';
options nodate nonumber ls=64;
proc print data=ia.empdata split=' ';
   label LastName='Last Name' 
         FirstName='First Name'
         Salary='Annual Salary';         
   title1 'Salary Report';
run;