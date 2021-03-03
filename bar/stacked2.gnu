set terminal qt size 1200,600

lm = 0.14
rm = 0.90
bm = 0.08
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm

set key horizontal center top Left reverse samplen 3.5 width 2 font 'Times New Roman,18'

set style fill solid 1 border -1
set style line 1 lc rgb 'black'
set style line 2 lc rgb 'black'
set style line 3 lc rgb 'black'
set style line 4 lc rgb 'black'
set style line 5 lc rgb 'black'

set style data histogram
set style histogram rowstacked
set boxwidth 0.5


set xtics ('config-1' 0, 'config-2' 1, 'config-3' 2, 'config-4' 3)
set yrange[0:1000] noreverse nowriteback
set ylabel "time cost(ms)" font 'Times New Roman,20' offset -1.8,0
set tics font 'Times New Roman,18'


plot 'stacked.dat' using 2 t "part1" fs pattern 3 lc rgb 'black', \
     ''            using 3 t "part2" fs pattern 2 lc rgb 'black', \
     ''            using 4 t "part3" fill lc rgb 'gray', \
     ''            using 5 t "part4" fs pattern 1 lc rgb 'black', \
     ''            using 6 t "part5" fs pattern 5 lc rgb 'black', \
     ''            using 7 t "part6" fs pattern 0 lc rgb 'black'

pause -1
