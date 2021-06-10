for i in `ls /mnt/farm4/mexicans/`
do
     echo "=====START====="
     mv /mnt/farm4/mexicans/$i /mnt/farm4/mexicans/$i.tmp
     rsync --progress /mnt/farm4/mexicans/$i.tmp /farm/pools/$i.tmp
     mv /farm/pools/$i.tmp /farm/pools/$i
     echo "=====END====="
done
