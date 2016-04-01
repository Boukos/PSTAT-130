data gas liquid solid synthetic;
   drop State;
   set prog2.elements;
   if State eq 'Gas' then
      output gas;
   else if State eq 'Liquid' then
      output liquid;
   else if State eq 'Solid' then
      output solid;
   else if State eq 'Synthetic' then
      output synthetic;
run;

proc print data=liquid;
run;
