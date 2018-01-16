# -*-mode:gnuplot-*-

set term epslatex color colortext ',10'
set output 'supply.tex'

set ylabel 'Supply (millions)'

set xdata time
set timefmt "%Y-%m-d"
set xrange ["2009-01-03":"2050-01-03"]

set yrange [0:25]

set format x "%Y"

set style line 1 lc rgb "red" lw 3
set style line 2 lt 3 lc rgb "blue" lw 3
set style line 3 lc rgb "#008000" lw 3 pt 7 ps 2

plot 'supply.dat' using 1:($2/1e6) ls 1 with lines title "Mined Coins", 21 ls 2 dashtype 2 notitle, "<echo '2018-01-16 16.55'" using 1:2 ls 3 with points notitle
