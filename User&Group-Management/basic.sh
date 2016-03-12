clear
echo Hai! What do you wish to do?
echo 1.User Management
echo 2.Group Management
echo 3.Exit
echo
echo -n Enter your choice:
read choice
case $choice in
1)sh /root/userman.sh;;
2)sh /root/groupman.sh;;
3)clear
rm -f /root/ug*
exit;;
*)clear
echo Please enter valid input
echo Press ENTER to continue
read a
sh /root/basic.sh;;
esac
