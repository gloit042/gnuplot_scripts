set terminal qt size 1000,600
set style data histogram
set style histogram cluster gap 1
set style fill solid 1.00 border -1
set grid ytics

set boxwidth 1

set key font 'Helvetica, 16'
set tics font 'Helvetica, 16'

set lmargin 15
set rmargin 19
set ytics nomirror
set y2tics
set ylabel 'IOPS' font 'Helvetica, 22' offset -1,0
set y2label 'latency(s)' font 'Helvetica, 22' offset 3,0 rotate by -90

set yrange [0: 2500]
set y2range [0: 0.004]
set xrange [*:*]
set xtics ("a" 0, "b" 1)

set format y2 "%6.1e"
plot 'clustered.dat' using 2 t "A" axis x1y1, \
     ''               using 3 t "B" axis x1y2
pause -1
