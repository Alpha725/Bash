#!/bin/bash
Directory=""
plot_count=0
temp_plots=$(ls /mnt/SSD | grep '.plots$'| wc -l)
if [ $temp_plots -gt 0 ]
	then
		for plots in `ls /mnt/SSD`
		do
			for i in `seq 24`
			do
				plots=$(ls /mnt/server/drive-$i/BBC-farm/ | wc -l)
				if [ $plot_count -eq 0 ]
				then
					plot_count=$(ls /mnt/server/drive-$i/BBC-farm/ | wc -l)
				fi
				if [ $plots -le $plot_count ]
				then
					Directory=$i
					numb_plots=$(ls /mnt/server/drive-$i/BBC-farm/ | wc -l)
				fi
			done
			[ $(ps aux | grep 'mv ' | grep -v grep | wc -l) -eq 0 ] && mv /mnt/SSD/*.plot /mnt/server/drive-$Directory/BBC-farm/
			echo "`date`: plot moved to drive-$Directory plot: $plots"
		done
	else
		echo "`date`: No plots" >> /opt/load_balance/mv_log.txt
fi
