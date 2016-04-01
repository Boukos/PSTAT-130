data init(drop=FName MName LName FMNames);
   length Initials $ 3 LName FMNames FName MName $ 30;
   set prog2.People;
   LName=scan(Name,1,',');
   FMNames=scan(Name,2,',');
   FName=scan(FMNames,1,' ');
   MName=scan(FMNames,2,' ');
   /* Put together just the first letters. */
   Initials=substr(FName,1,1) !!
      substr(MName,1,1) !!
      substr(LName,1,1);
run;

proc print data=init;
   var Name CityState Initials;
run;


  /* Alternate SAS9 solution. */
data init(drop=First MI Last FMNames);
   length Initials $ 3
     Last First MI $ 1
     FMNames $ 30;
   set prog2.people;
   FMNames = scan(Name,2,',');
   /* By assigning entire names into 1-byte character
      variables, everything is truncated except the first
      letter. */
   First = left(FMNames);
   MI = scan(FMNames,2,' ');
   Last = Name;
   /* The CAT function concatenates without trimming or
      inserting separators. */
   Initials = cat(First,MI,Last);
run;

proc print data=init;
   var Name CityState initials;
run;
