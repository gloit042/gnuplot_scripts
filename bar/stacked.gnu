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


num_of_ksptypes=1
set boxwidth 0.5/num_of_ksptypes
dx=0.5/num_of_ksptypes
offset=-0.12


set xtics ('config-1' 1, 'config-2' 2, 'config-3' 3, 'config-4' 4)
set xrange[0:5]
set yrange[0:1000] noreverse nowriteback
set ylabel "time cost(ms)" font 'Times New Roman,20' offset -1.8,0
set tics font 'Times New Roman,18'


# draw title manually to control order
plot 'stacked.dat' using ($1):($2+$3+$4+$5+$6+$7) notitle with boxes fs pattern 0 lc rgb 'black',  \
     ''            using ($1):($2+$3+$4+$5+$6) notitle with boxes fs pattern 5 lc rgb 'black', \
     ''            using ($1):($2+$3+$4+$5) notitle with boxes fs pattern 1 lc rgb 'black', \
     ''            using ($1):($2+$3+$4) notitle with boxes fill lc rgb 'gray', \
     ''            using ($1):($2+$3) notitle  with boxes fs pattern 2 lc rgb 'black', \
     ''            using ($1):($2) notitle with boxes fs pattern 3 lc rgb 'black', \
     ''            using (0):(0) title "part1" with boxes fs pattern 3 lc rgb 'black', \
     ''            using (0):(0) title "part2" with boxes fs pattern 2 lc rgb 'black', \
     ''            using (0):(0) title "part3" with boxes fill lc rgb 'gray', \
     ''            using (0):(0) title "part4" with boxes fs pattern 1 lc rgb 'black', \
     ''            using (0):(0) title "part5" with boxes fs pattern 5 lc rgb 'black', \
     ''            using (0):(0) title "part6" with boxes fs pattern 0 lc rgb 'black'

pause -1
