fs ()
{
echo What filesystem do you want?
echo 1.ext3
echo 2.DOS
echo –n Enter your option:
read a
case $a in
1)clear
mkfs –t ext3 /dev/fd0
echo The floppy disk has been formatted with ext3 filesystem.
echo Press ENTER to continue.
read b
sh /root/removmedia.sh ;;
2)clear
mkfs –t vfat /dev/fd0
echo The floppy disk has been formatted with DOS filesystem.
echo Press ENTER to continue.
read c
sh /root/removmedia.sh ;;
*)clear
echo Invalid input!
echo Press ENTER to continue.
read d
fs ;;
esac
}
floppyformat ()
{
echo Formatting will erase all data on the floppy disk.
echo Are you sure you wish to proceed?
echo 1.Continue
echo 2.Cancel
echo –n Enter your option:
read e
case $e in
1)clear
echo Insert floppy disk and press ENTER when ready.
read f
fdformat /dev/fd0H1440
fs ;;
2)clear
echo Formatting the floppy disk was cancelled.
echo Press ENTER to continue.
read g
sh /root/removmedia.sh ;;
*)clear
echo Invalid input!
echo Press ENTER to continue.
read h
floppyformat ;;
esac
}
floppy ()
{
clear
echo What do you wish to do?
echo 1.View contents of the floppy disk.
echo 2.Exit.
echo –n Enter your option:
read i
case $i in
1)clear
echo Files and Directories in the floppy disk:
ls|more
echo Press ENTER to continue.
read j
clear
floppy ;;
2)umount /media/floppy
clear
echo You can now safely remove the floppy disk from the drive.
echo Press ENTER to continue.
read k
sh /root/removmedia.sh ;;
*)clear
echo Invalid input!
echo Press ENTER to continue.
read l
floppy ;;
esac
}
cdrom ()
{
clear
echo What do you wish to do?
echo 1.View contents of cd-rom.
echo 2.View the rpm packages available in your cd-rom.
echo 3.Install a rpm package from the cd-rom.
echo 4.Upgrade a rpm package from the cd-rom.
echo 5.Query whether a rpm package exists on your harddisk.
echo 6.Exit.
echo –n Enter your option:
read m
case $m in
1)clear
echo Files and Directories in the cd-rom:
ls|more
echo Press ENTER to continue.
read n
cdrom ;;
2)clear
echo rpm packages available in the cd-rom:
find /media/cdrom –name *.rpm
echo Press ENTER to continue.
read o
cdrom ;;
3)clear
echo –n Enter the precise name of the rpm package you wish to
install from your cd-rom:
read $package1
rpm –ivh $package1
echo Press ENTER to continue.
read p
cdrom ;;
4)clear
echo –n Enter the name of the rpm package you wish to
upgrade:
read $package2
rpm –Uvh $package2
echo Press ENTER to continue.
read q
cdrom ;;
5)clear
echo –n Enter the precise name of the rpm package you wish to
query:
read $package3
rpm –qa $package3
echo Press ENTER to continue.
read r
cdrom ;;
6)clear
umount /media/cdrom
eject
echo You can now remove your cd-rom from the tray.
echo Press ENTER when done.
read s
eject –t
sh /root/removmedia.sh ;;
*)clear
echo Invalid input!
echo Press ENTER to continue.
read t
cdrom ;;
esac
}
clear
echo Hai! What do you wish to do?
echo 1.Format floppy disk.
echo 2.Open floppy disk.
echo 3.Open cd-rom.
echo 4.Exit.
echo –n Enter your choice:
read choice
case $choice in
1)clear
floppyformat ;;
2)clear
echo Insert floppy disk and press ENTER when ready.
read u
mount /media/floppy
cd /media/floppy
floppy ;;
3)clear
eject
echo Place the cd-rom on tray and press ENTER when ready.
read v
eject –t
mount /media/cdrom
cd /media/cdrom
cdrom ;;
4)clear
exit ;;
*)clear
echo Invalid input!
echo Press ENTER to continue.
read w
sh /root/removmedia.sh ;;
esac