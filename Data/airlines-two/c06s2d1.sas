data work.agents2;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=scan(CityCountry,2,',');
   if Country='USA'
      then TrueLocation = scan(CityCountry,1,',')
            !! ', ' !! State;
   else /* not USA */
      TrueLocation = CityCountry;
run;

proc print data=work.agents2 noobs;
   var TrueLocation CityCountry State;
   title 'Locations of Ticket Agents';
run;

   /*Use DEBUG option to see if conditional logic is executing and  
   the value of country before IF-THEN statement*/

data work.agents2/debug;
   set prog2.agents;
   length Country $ 20 TrueLocation $ 40;
   Country=scan(CityCountry,2,',');
   if Country='USA'
      then TrueLocation = scan(CityCountry,1,',')
            !! ', ' !! State;
   else /* not USA */
      TrueLocation = CityCountry;
run;


    /*Remove the DEBUG option, use the LEFT function to remove leading spaces
        and drop CityCountry and Country*/
data work.agents2(drop=Country);
    set prog2.agents;
    length Country $ 20 TrueLocation $ 40;
    Country=left(scan(CityCountry,2,','));
    if Country='USA'
       then TrueLocation = scan(CityCountry,1,',')
            !! ', ' !! State;
    else /* not USA */
       TrueLocation = CityCountry;
run;

proc print data=work.agents2 noobs;
   var TrueLocation CityCountry State;
   title 'Locations of Ticket Agents';
run;

 