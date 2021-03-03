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


# plot
plot 'heatmap.dat' matrix using 1:2:3 with image, \
     '' matrix using 1:2:(sprintf("%.1f",$3)) with labels
#'' using 1:ymin:(0):(ymax - ymin) with vectors nohead lc 'white'
# print grids
set print '/tmp/grids'
i = xmin
while (i < xmax) {
  print i, ymin, 0, ymax - ymin
  i = i + gridwidth
}
i = ymin
while (i < ymax) {
  print xmin, i, xmax - xmin, 0
  i = i + gridwidth
}

# add gridlines and contour
replot '/tmp/grids' using 1:2:3:4 with vectors nohead lc 'white' lw 1.5
replot 'heatmap-contour.dat' using 1:2 with lines lc 'black' lw 1.5

pause -1
