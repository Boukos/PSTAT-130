   /*Insert a PUT statement to see if the code is executing*/

data work.agents2;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=scan(CityCountry,2,',');
   if Country='USA' then do;
      TrueLocation = scan(CityCountry,1,',')
          !! ', ' !! State;
      put 'Country is USA';
   end;
   else /* not USA */
      TrueLocation = CityCountry;
run;

     /*Check the value for Country just before the IF-THEN statement*/
data work.agents2;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=scan(CityCountry,2,',');
   put Country=;
   if Country='USA' then do;
      TrueLocation = scan(CityCountry,1,',')
         !! ', ' !! State;
      put 'Country is USA';
   end;
   else /* not USA */
      TrueLocation = CityCountry;
run;

    /*Use $quote. format to check for leading blanks*/

data work.agents2;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=scan(CityCountry,2,',');
   put Country $quote20.;
   if Country='USA' then do;
      TrueLocation = scan(CityCountry,1,',')
         !! ', ' !! State;
      put 'Country is USA';
   end;
   else /* not USA */
      TrueLocation = CityCountry;
run;

   /*Use LEFT function to remove leading blanks and check code again*/

data work.agents2;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=left(scan(CityCountry,2,','));
   put Country $quote20.;
   if Country='USA' then do; /*Note space before USA*/
         TrueLocation = scan(CityCountry,1,',')
            !! ', ' !! State;
      put 'Country is USA';
   end;
   else /* not USA */
      TrueLocation = CityCountry;
run;

proc print data=work.agents2 noobs;
   var TrueLocation CityCountry State;
   title 'Output with Leading Spaces Removed';
run;

       /*Delete PUT statements*/

data work.agents2 (drop=country);
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=left(scan(CityCountry,2,','));
   if Country='USA' then /*Note the space before USA*/
      TrueLocation = scan(CityCountry,1,',')
         !! ', ' !! State;
   else /* not USA */
      TrueLocation = CityCountry;
run;

proc print data=work.agents2 noobs;
   var TrueLocation CityCountry State;
   title 'Corrected Output';
run;
