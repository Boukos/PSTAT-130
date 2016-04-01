data army(keep=Code Airport);
   set prog2.military(drop=City State Country);
   if Type eq 'Army' then output;
run;