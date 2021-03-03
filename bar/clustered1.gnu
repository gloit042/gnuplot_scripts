set terminal qt size 1000,600
set style fill solid 1.00 border -1
set grid ytics

set key font 'Helvetica, 16'
set tics font 'Helvetica, 16'


set xtics ("a" 1, "b" 2)
set ytics nomirror
set y2tics
set ylabel 'IOPS' font 'Helvetica, 22' offset -1,0
set y2label 'latency(s)' font 'Helvetica, 22' offset 3,0 rotate by -90

set yrange [0: 2500]
set y2range [0: 0.004]
set xrange [0.5:2.5]

num_of_types=2
set boxwidth 0.5/num_of_types
dx=0.5/num_of_types
offset=-0.12

set format y2 "%6.1e"
plot 'clustered.dat' using ($1+offset):2 t "A" axis x1y1, \
     ''         using ($1+offset+dx):3 t "B" axis x1y2
pause -1
