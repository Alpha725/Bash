function bad_dir () {
echo "Please ensure that you are in the same dir as this script"
exit 0
}

[ -f crontab_schedule ] || bad_dir

[ -f /snapshots/hourly ] && sudo btrfs subvolume snapshot / /snapshots/hourly
[ -f /snapshots/every_other_hourly ] && sudo btrfs subvolume snapshot / /snapshots/every_other_hourly
[ -f /snapshots/daily ] && sudo btrfs subvolume snapshot / /snapshots/daily
[ -f /snapshots/weekly ] && sudo btrfs subvolume snapshot / /snapshots/weekly
[ -f /snapshots/monthly ] && sudo btrfs subvolume snapshot / /snapshots/monthly
(cat crontab_schedule)| sudo crontab -
