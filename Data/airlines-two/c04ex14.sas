  /* z/OS: proc fslist fileref='.prog2.rawdata(bstones)'; */
proc fslist fileref='bstones.dat';
run;

data birthstones;
   drop Space Stone;
   retain Month Modern Traditional Mystical 
          Ayurvedic Other1-Other3;
  /* z/OS: infile '.prog2.rawdata(bstones)' 
		      end=LastMonth dlm=','; */
   infile 'bstones.dat' end=LastMonth dlm=','; 
  /* You can also read the birthstones with formatted input if 
     you use the TRUNCOVER or PAD option. */
   length 	Month $ 9 
			Modern Traditional $ 12 
			Mystical $ 11
          	Ayurvedic $ 10 
			Other1-Other3 $ 15;
   input @1 Space $1. @;  

  /* The leading space must be read with formatted input, or the 
     space will be ignored.*/
   if Space ne ' ' then do;
      if _n_ ne 1 then 
		output; 
      input @1 Month $;
	  Stone = 1;
	  other2 = '';
	  other3 = '';
   end;

/* You need to know how many detail records have been read in 
   order to know which variable is being read. */
   else do;
      if Stone = 1 then input Modern $;
	  else if Stone = 2 then input Traditional;
	  else if Stone = 3 then input Mystical ;
	  else if Stone = 4 then input Ayurvedic;
	  else if Stone = 5 then input Other1;
	  else if Stone = 6 then input Other2;
	  else if Stone = 7 then input Other3;
      Stone + 1;
   end;
   if LastMonth then output;
run;

title1 'Various Birthstones for Each Month';
proc print data=birthstones;
run;
