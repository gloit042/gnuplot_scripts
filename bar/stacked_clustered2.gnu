set terminal qt
set style fill solid 1.00 border -1
set grid ytics

#Sets multiplot
set yrange [0:*]

set key invert left

set style data histogram
set style histogram rowstack
set boxwidth 1


set title "TITLE"

set xtics out scale 0,0 format " "

plot newhistogram  'config-1' offset 0, 0.5, 'stacked_clustered2.dat' every 4::3::7 using ($1)/1e-6 lc 3 t 'net', \
                   ''                      every 4::2::6 using ($1)/1e-6 lc 2 t 'osd', \
                   ''                      every 4::1::5 using ($1)/1e-6 lc 1 t 'mds', \
                   ''                      every 4::0::4 using ($1)/1e-6 lc 0 t 'client', \
     newhistogram  'config-2' offset 0, 0.5, '' every 4::3::7 using ($2)/1e-6 lc 3 notitle, \
                   ''                      every 4::2::6 using ($2)/1e-6 lc 2 notitle, \
                   ''                      every 4::1::5 using ($2)/1e-6 lc 1 notitle, \
                   ''                      every 4::0::4 using ($2)/1e-6 lc 0 notitle, \
     newhistogram  'config-3' offset 0, 0.5, '' every 4::3::7 using ($3)/1e-6 lc 3 notitle, \
                   ''                      every 4::2::6 using ($3)/1e-6 lc 2 notitle, \
                   ''                      every 4::1::5 using ($3)/1e-6 lc 1 notitle, \
                   ''                      every 4::0::4 using ($3)/1e-6 lc 0 notitle, \
     newhistogram  'config-4' offset 0, 0.5, '' every 4::3::7 using ($4)/1e-6 lc 3 notitle, \
                   ''                      every 4::2::6 using ($4)/1e-6 lc 2 notitle, \
                   ''                      every 4::1::5 using ($4)/1e-6 lc 1 notitle, \
                   ''                      every 4::0::4 using ($4)/1e-6 lc 0 notitle, \
     newhistogram  'config-5' offset 0, 0.5, '' every 4::3::7 using ($5)/1e-6 lc 3 notitle, \
                   ''                      every 4::2::6 using ($5)/1e-6 lc 2 notitle, \
                   ''                      every 4::1::5 using ($5)/1e-6 lc 1 notitle, \
                   ''                      every 4::0::4 using ($5)/1e-6 lc 0 notitle

pause -1
