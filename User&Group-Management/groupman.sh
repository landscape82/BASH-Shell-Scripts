clear
touch /root/ug6.sh /root/ug7.sh /root/ug8.sh
echo What do you wish to do?
echo 1.Create Groups.
echo 2.Delete Groups.
echo 3.User Management.
echo 4.Make a user participate in a group such that it is his primary group.
echo 5.Make a user participate in a group such that it is his secondary group.
echo 6.View group account.
echo 7.Exit.
echo
echo -n Enter your choice:
read choice
if [ $choice -eq 1 ];
then
echo How many groups do you want to create?
read a
i=1
if [ $a le 0 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read b
sh /root/groupman.sh
elif [ $a ge 1000 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read c
sh /root/groupman.sh
fi
while [ $i -le $a ]
do
echo -n Enter the groupname:
read groupname
cut -f1 -d : /etc/group > /root/ug6.sh
count=`grep -c $groupname /root/ug6.sh`
if [ $count -ne 0 ];
then
clear
echo Sorry,such a group already exists!
echo Press ENTER to continue
read d
clear
else
groupadd $groupname
i=`expr $i + 1`
fi
done
clear
echo Group creation was successful
echo Press ENTER to continue
read e
sh /root/groupman.sh
elif [ $choice -eq 2 ];
then
echo How many groups you wish to delete?
read f
i=1
if [ $f le 0 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read g
sh /root/groupman.sh
elif [ $f ge 1000 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read h
sh /root/groupman.sh
fi
while [ $i -le $f ]
do
echo -n Enter the groupname:
read groupname
cut -f1 -d : /etc/group > /root/ug7.sh
count=`grep -c $groupname /root/ug7.sh`
if [ $count -eq 0 ];
then
clear
echo Sorry,such a group does not exist!
echo Press ENTER to continue
read i
clear
else
groupdel $groupname
i=`expr $i + 1`
fi
done
clear
echo Group deletion has been successful
echo Press ENTER to continue
read j
sh /root/groupman.sh
elif [ $choice -eq 3 ];
then
sh /root/userman.sh
elif [ $choice -eq 4 ];
then
echo -n Enter the groupname:
read groupname
echo -n Enter the number of such users to be added to their primary group:
read k
i=1
while [ $i -le $k ]
do
echo -n Enter the username:
read $username
usermod -g $groupname $username
i=`expr $i + 1`
done
clear
echo User addition to their primary group was successful
echo Press ENTER to continue
read l
sh /root/groupman.sh
elif [ $choice -eq 5 ];
then
echo -n Enter the groupname:
read groupname
echo -n Enter the number of such users to be added to secondary groups:
read m
i=1
while [ $i -le $m ]
do
echo -n Enter the username:
read $username
usermod -G $groupname $username
i=`expr $i + 1`
done
clear
echo User addition to their secondary group was successful
echo Press ENTER to continue
read n
sh /root/groupman.sh
elif [ $choice -eq 6 ];
then
clear
cut -f1 -d : /etc/group > /root/ug8.sh
cat /root/ug8.sh | more
echo Press ENTER to continue
read o
sh /root/groupman.sh
elif [ $choice -eq 7 ];
then
sh /root/basic.sh
else
clear
echo Invalid Input!
echo Please enter a valid input
echo Press ENTER to continue
read p
sh /root/groupman.sh
fi
