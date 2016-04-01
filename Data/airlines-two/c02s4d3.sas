data _null_;
   set prog2.maysales;
   file 'export.dat'; * PC and Unix;
   *file '.prog2.rawdata(export)'; * z/OS;
   if _N_=1 then
      put 'Description ListDate SellDate SellPrice';
   put Description
       ListDate : date9.
       SellDate : date9.
       SellPrice;
run;

proc fslist fileref='export.dat'; * PC and Unix;
*proc fslist fileref='.prog2.rawdata(export)'; * z/OS;
run;
