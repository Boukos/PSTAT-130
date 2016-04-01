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
   var CityCountry TrueLocation State;
   title 'Current Output from Program';
run;
