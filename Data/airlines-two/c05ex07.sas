data mixedall(keep=Name CityState);
   length FMNames MName FName LName $ 30;
   set prog2.people;

   /* The entire value of NAME is transformed into
      lowercase letters because, in your final results,
      most of the letters in the value of NAME are
      lowercase. */

   Name=lowcase(Name);

   /* Extract the last name, and place its first
      character back into uppercase. */

   LName=scan(Name,1,',');
   substr(LName,1,1)=upcase(substr(LName,1,1));

   /* Use the INDEX function to search for a blank
      within the value of LNAME.  If a blank is found,
      upcase the character one position to its right.
      This is the first character of the second word
      of a multiple word last name. */

   BlankPos=index(LName,' ');
   if BlankPos gt 0 then
      substr(LName,BlankPos+1,1)=upcase(substr(LName,BlankPos+1,1));

   /* Extract the first and middle names, and place
      their first characters back into uppercase. */

   FMNames=left(scan(Name,2,','));
   FName=scan(FMNames,1,' ');
   MName=scan(FMNames,2,' ');
   substr(FName,1,1)=upcase(substr(FName,1,1));
   substr(MName,1,1)=upcase(substr(MName,1,1));

   /* Use the INDEX function to search for a hypen
      within the value of LNAME.  If a hyphen is found,
      upcase the character one position to its right.
      This is the first character of the second word
      of a multiple word last name. */

   DashPos=index(FName,'-');
   if DashPos gt 0 then
      substr(FName,DashPos+1,1)=upcase(substr(FName,DashPos+1,1));
   Name=trim(LName) !! ', ' !! trim(FName) !! ' ' !! MName;
run;

proc print data=mixedall;
run;


  /* Alternate SAS9 solution. */
data mixedall;
    set prog2.people;
   Name = propcase(Name);
run;

proc print data=mixedall;
run;

