data students(drop=Number DOB);
   set prog2.students;

   /* The PUT function is used to convert NUMBER from
      numeric to character, and then the resulting
      character value is manipulated with the SUBSTR
      function to extract the first three characters,
      and the last four characters. */

   Telephone=substr(put(Number,7.),1,3) || '-' ||
      substr(put(Number,7.),4);

   /* The INPUT function is used to convert DOB from
      character to numeric. Because the character values
      are in the form, ddMMMyyyy, the DATE9. format is
      used in the conversion. */

   Birthday=input(DOB,date9.);
   format Birthday mmddyy10.;
run;

proc print data=students;
run;
