clear
touch /root/ug1.sh /root/ug2.sh /root/ug3.sh /root/ug4.sh /root/ug5.sh
echo What do you wish to do?
echo 1.Add Users
echo 2.Delete Users
echo 3.Enable User Account
echo 4.Disable User Account
echo 5.View User Account
echo 6.Exit
echo -n Enter your choice:
read choice
if [ $choice -eq 1 ];
then
echo How many users you wish to add?
read a
i=1
if [ $a -le 0 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read b
sh /root/userman.sh
elif [ $a -ge 1000 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read c
sh /root/userman.sh
fi
while [ $i -le $a ]
do
echo -n Enter the username:
read username
cut -f1 -d : /etc/passwd > /root/ug1.sh
count=`grep -c $username /root/ug1.sh`
if [ $count -ne 0 ];
then
clear
echo Sorry,Username already exists!
echo Press ENTER to continue
read d
clear
else
useradd $username
passwd $username
i=`expr $i + 1`
fi
done
clear
echo User addition has been successful
echo Press ENTER to continue
read e
sh /root/userman.sh
elif [ $choice -eq 2 ];
then
echo How many users you wish to delete?
read f
i=1
if [ $f -le 0 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read g
sh /root/userman.sh
elif [ $f -ge 1000 ];
then
clear
echo Invalid Input!
echo Press ENTER to continue
read h
sh /root/userman.sh
fi
while [ $i -le $f ]
do
echo -n Enter the username:
read username
cut -f1 -d : /etc/passwd > /root/ug2.sh
count=`grep -c $username /root/ug2.sh`
if [ $count -eq 0 ];
then
clear
echo Sorry,Username does not exist!
echo Press ENTER to continue
read i
clear
else
userdel -r $username
i=`expr $i + 1`
fi
done
clear
echo User deletion has been successful
echo Press ENTER to continue
read j
sh /root/userman.sh
elif [ $choice -eq 3 ]
then
echo -n Enter username you want to enable:
read username
cut -f1 -d : /etc/passwd > /root/ug3.sh
count=`grep -c $username /root/ug3.sh`
if [ $count -eq 0 ];
then
clear
echo Sorry,Username does not exist!
echo Press ENTER to continue
read k
sh /root/userman.sh
else
usermod -s /bin/bash $username
clear
echo The user has been enabled
echo Press ENTER to continue
read l
sh /root/userman.sh
fi
elif [ $choice -eq 4 ];
then
echo -n Enter username you want to disable:
read username
cut -f1 -d : /etc/passwd > /root/ug4.sh
count=`grep -c $username /root/ug4.sh`
if [ $count -eq 0 ];
then
clear
echo Sorry,Username does not exist!
echo Press ENTER to continue
read m
sh /root/userman.sh
else
usermod -s /sbin/nologin $username
clear
echo The user has been disabled
echo Press ENTER to continue
read n
sh /root/userman.sh
fi
elif [ $choice -eq 5 ];
then
clear
cut -f1 -d : /etc/passwd > /root/ug5.sh
cat /root/ug5.sh | more
echo Press ENTER to continue
read o
sh /root/userman.sh
elif [ $choice -eq 6 ];
then
sh /root/basic.sh
else
clear
echo Please enter a valid input
echo Press ENTER to continue
read p
sh /root/userman.sh
fi
