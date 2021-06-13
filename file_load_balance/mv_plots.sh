#!/bin/bash
#for plot in `ls /mnt/SSD | grep .plot$`
#do

function get_drive() {

        drive_count=$(ls /mnt/server/drive-1/BBC-farm/ | grep .plot$ | wc -l)
        drive_number=0

        for i in `seq 24`
        do
                count=$(ls /mnt/server/drive-$i/BBC-farm/ | grep .plot$ | wc -l)
                if [ $count -le $drive_count ]
                then
                        drive_number=$i
                fi
        done
}

for plot in `ls /mnt/SSD | grep .plot$`
do
        echo "`date`: found plot: $plot" >> /opt/load_balance/mv_log.txt
        get_drive
        echo "`date`: moving to: /mnt/server/drive-$drive_number/BBC-farm/" >> /opt/load_balance/mv_log.txt
        [ $(ps aux | grep 'mv ' | grep -v grep | wc -l) -eq 0 ] && mv /mnt/SSD/$plot /mnt/server/drive-$drive_number/BBC-farm/
        echo "`date`: finished moving plot: $plot" >> /opt/load_balance/mv_log.txt
done
