set terminal qt
set style fill solid 1.00 border -1
set grid ytics

#Sets multiplot
set yrange [0:*]

set key invert left

set style data histogram
set style histogram columnstacked
set boxwidth 1

set style line 1 lc rgb 'gray'
set style line 2 lc rgb '#7e20d1'
set style line 3 lc rgb '#5d9d74'
set style line 4 lc rgb '#80b5e8'
set style increment user

set title "TITLE"

set xtics out scale 0,0 format " "

plot newhistogram  'config-1' offset 0, 0.5 lt 1, 'stacked_clustered3.dat' every ::0::3 using ($2)/1e-6:key(1), \
                   '' every ::4::7 using ($2)/1e-6,\
     newhistogram  'config-2' offset 0, 0.5 lt 1, '' every ::0::3 using ($3)/1e-6, \
                   '' every ::4::7 using ($3)/1e-6, \
     newhistogram  'config-3' offset 0, 0.5 lt 1, '' every ::0::3 using ($4)/1e-6 lc 0, \
                   '' every ::4::7 using ($4)/1e-6 lc 0, \
     newhistogram  'config-4' offset 0, 0.5 lt 1, '' every ::0::3 using ($5)/1e-6 lc 0, \
                   '' every ::4::7 using ($5)/1e-6 lc 0,\
     newhistogram  'config-5' offset 0, 0.5 lt 1, '' every ::0::3 using ($6)/1e-6 lc 0, \
                   '' every ::4::7 using ($6)/1e-6 lc 0

pause -1
