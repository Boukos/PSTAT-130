data mixedprairie(drop=First MI Last FMNames);
   length Last FMNames First MI $ 30;
   set prairie;
   Last=scan(Name,1,',');
   FMnames=scan(Name,2,',');
   First=scan(FMnames,1,' ');
   MI=scan(FMnames,2,' ');
   substr(First,2)=lowcase(substr(First,2));
   substr(Last,2)=lowcase(substr(Last,2));
   Name=trim(Last) !! ', ' !!
      trim(First) !! ' ' !! MI;
run;

proc print data=mixedprairie;
run;


  /* Alternate SAS9 solution. */
data mixedprairie;
   set prairie;
   Name = propcase(Name);
run;

proc print data=mixedprairie;
run;
