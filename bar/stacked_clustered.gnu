set terminal qt
set style fill solid 1.00 border -1
set grid ytics

set xtics ("config-1" 1, "config-2" 2, "config-3" 3, "config-4" 4, "config-5" 5)

#Sets multiplot
set yrange [0:*]

set key invert left
num_of_types=2
set boxwidth 0.5/num_of_types
dx=0.5/num_of_types
offset=-0.12


set title "TITLE"

plot 'stacked_clustered.dat' using ($1+offset):($2+$3+$4+$5)/1e-6 lc 0 t 'client' with boxes,\
     ''         using ($1+offset):($3+$4+$5)/1e-6 lc 1 t 'mds' with boxes,\
     ''         using ($1+offset):($4+$5)/1e-6 lc 2 t 'osd' with boxes,\
     ''         using ($1+offset):($5)/1e-6 lc 3 t 'net' with boxes,\
     ''         using ($1+offset+dx):($6+$7+$8+$9)/1e-6 lc 0 notitle with boxes,\
     ''         using ($1+offset+dx):($7+$8+$9)/1e-6 lc 1 notitle with boxes,\
     ''         using ($1+offset+dx):($8+$9)/1e-6 lc 2 notitle with boxes,\
     ''         using ($1+offset+dx):($9)/1e-6 lc 3 notitle with boxes

pause -1
