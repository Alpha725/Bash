#!/bin/bash
Directory=""
plot_count=0
for i in `seq 24`
do
	plots=$(ls $i/ | wc -l)
	if [ $plot_count -eq 0 ]
	then
		plot_count=$(ls $i/ | wc -l)
	fi
	if [ $plots -le $plot_count ]
	then
		Directory=$i
		numb_plots=$(ls $i/ | wc -l)
	fi
done

newfile=`expr $numb_plots + 1`

touch $Directory/$newfile.plot
