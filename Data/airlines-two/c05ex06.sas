data statelong(keep=Name StateName);
   length StateName State $20;
   set prog2.people;

   /* Second word of CITYSTATE is extracted.
      Resulting second word of CITYSTATE is left-
      aligned to eliminate leading blank.

      Once leading blank is removed, STNAMEL can
      be used to determine state name. */

   State=left(scan(CityState,2,','));
   StateName=stnamel(State);
run;

proc print data=statelong;
   var Name StateName;
run;
