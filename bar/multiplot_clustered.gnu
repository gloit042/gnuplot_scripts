lm = 0.12
rm = 0.59
bm = 0.55
tm = 0.86
set lmargin at screen lm
set rmargin at screen rm
set bmargin at screen bm
set tmargin at screen tm

set multiplot layout 2,2 rowsfirst
set key top outside horizontal at graph 1.65,screen 1.0 center center 
set key vertical height 1 maxrows 1
set key right top Left reverse width 0 font 'Times New Roman,16'

set style line 1 lc rgb 'white'
set style line 2 lc rgb 'gray'
set style line 3 lc rgb 'black'
set style line 4 lc rgb 'black'
set style line 5 lc rgb 'black'

set style data histogram
set style histogram cluster gap 2
set style fill pattern 1 border -1
set tics font 'Times New Roman,16'
set xtics nomirror


set title 'App1' font 'Times New Roman,14' offset 0,-1.0
set ylabel "scale" font 'Times New Roman,18' offset -1.2,0

set xtics ('data1' 0, 'data2' 1, 'data3' 2)

set yrange [0 : 30] noreverse nowriteback
set xrange [-0.4:2.5]

plot 'App1-1.dat' using 1 ls 1 title "config1", \
                        '' using 2 ls 2 title "config2" fs pattern 5, \
                        '' using 3 ls 3 title "config3" fs pattern 4

unset key

unset ylabel
unset rmargin
unset lmargin
set lmargin at screen 0.65
set xtics ('data4' 0, 'data5' 1)
set ytics ("0" 0, "15" 15, "30" 30, "45" 45, "60" 60, "75" 75, "90" 90)
set yrange [0:90] noreverse nowriteback
set xrange [-0.4:1.5]
plot 'App1-2.dat' using 1 ls 1 title "config1", \
                        '' using 2 ls 2 title "config2" fs pattern 5, \
                        '' using 3 ls 3 title "config3" fs pattern 4

unset bmargin
set tmargin at screen 0.40

# App2
set xtics ('data1' 0, 'data2' 1, 'data3' 2)
set lmargin at screen lm
set rmargin at screen rm
set title 'App2' font 'Times New Roman,14' offset 0,0.0
set ylabel "scale" font 'Times New Roman,18' offset -1.2,0
set ytics 5
set yrange [0:30] noreverse nowriteback
set xrange [-0.4:2.5]
set label 1 "40.4" at 1.78,32 font 'Times New Roman,12'
plot 'App2-1.dat' using 1 ls 1 title "config1", \
                    '' using 2 ls 2 title "config2" fs pattern 5, \
                    '' using 3 ls 3 title "config3" fs pattern 4
unset label

#--- App2 : data4 - data5
unset rmargin
unset lmargin
set lmargin at screen 0.65
unset ylabel
set ytics ("0" 0,"15" 15, "30" 30, "45" 45, "60" 60, "75" 75, "90" 90)
set yrange [0 : 90] noreverse nowriteback
set xrange [-0.4:1.5]
set xtics ('data4' 0, 'data5' 1)
plot 'App2-2.dat' using 1 ls 1 title "config1", \
                    '' using 2 ls 2 title "config2" fs pattern 5, \
                    '' using 3 ls 3 title "config3" fs pattern 4

pause -1
