set terminal qt size 400,600
unset key
set style increment default
set view map scale 1
set style data lines

set bmargin 3
set lmargin 6
# remove border
set border 0
set tics font 'Helvetica,10'
set xtics border out scale 1,1 nomirror norotate  autojustify
set xtics ("1" 0, "2" 1, "4" 2, "8" 3, "16" 4, "32" 5) offset 0,0.5
set ytics border out scale 1,1 nomirror rotate  autojustify
set ytics ("64" 0, "128" 1, "256" 2, "512" 3, "1K" 4, "2K" 5, \
    "4K" 6, "8K" 7, "16K" 8, "32K" 9, "64K" 10, "128K" 11, \
    "256K" 12, "512K" 13, "1M" 14) offset 1.5,0
xmin=-0.5
xmax=5.5
ymin=-0.5
ymax=14.5
gridwidth=1
gridoff=gridwidth/2
unset cbtics
set xlabel 'Queue Depth' font 'Helvetica, 10' offset 0, 0.8
set xrange [xmin : xmax] noreverse nowriteback
set ylabel 'Requests Size(B)' font 'Helvetica, 10' offset 3.5, 0
set yrange [ymin : ymax] noreverse nowriteback

# set colorbox
set cbtics ("0" 0, "5" 5, "10" 10) out nomirror
set cbrange [ -0.50000 : 10.50000 ] noreverse nowriteback

# load palette
# can be found on https://github.com/Gnuplotting/gnuplot-palettes
load 'orrd.pal'

# add grid lines(optional, only if you need contour)

# gridlines need offset, use x2 and y2 tics
set x2range [xmin : xmax] noreverse nowriteback
set y2range [ymin : ymax] noreverse nowriteback
set x2tics 0.5,1 out scale 0,0 nomirror format " "
set y2tics 0.5,1 out scale 0,0 nomirror format " "


## draw lines
set grid x2tics front lw 1.5 lt -1 lc 'white'
set grid y2tics front lw 1.5 lt -1 lc 'white'

## draw contour
set arrow from 0.5,14.5 to 0.5,13.5 nohead front lw 1.5
set arrow from 0.5,13.5 to 1.5,13.5 nohead front lw 1.5
set arrow from 1.5,13.5 to 1.5,12.5 nohead front lw 1.5
set arrow from 1.5,12.5 to 2.5,12.5 nohead front lw 1.5
set arrow from 2.5,12.5 to 2.5,11.5 nohead front lw 1.5
set arrow from 2.5,11.5 to 3.5,11.5 nohead front lw 1.5
set arrow from 3.5,11.5 to 3.5,10.5 nohead front lw 1.5
set arrow from 3.5,10.5 to 4.5,10.5 nohead front lw 1.5
set arrow from 4.5,10.5 to 4.5,9.5 nohead front lw 1.5
set arrow from 4.5,9.5 to 5.5,9.5 nohead front lw 1.5

# plot
plot 'heatmap.dat' matrix using 1:2:3 with image, \
     '' matrix using 1:2:(sprintf("%.1f",$3)) with labels

pause -1
