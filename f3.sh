#! /bin/bash

echo now setup the network group

x=/etc/ansible/hosts
ans="l"

while [ $ans != "q" ]
do
	read -p "< h for help > " ans
	echo
	if [ $ans = "a" ]; then
		read -p "enter the group name > " ansible_group
		echo
		check=$(sed -n "/\[$ansible_group\]/p" $x)
		echo $check
		if [ $check > /dev/null ]; then
			echo "group already exists"
		else
			sed -i "54a\[$ansible_group\]" $x
			echo "group add"
		fi

	fi		
	
	if [ $ans = "h" ]; then
		echo "a 	to add a ansible network group "
		echo "q 	to exit "
		echo "l 	list group"
		echo "t 	enter the new network in existing group"
		echo "d 	delete the network"
	fi

	if [ $ans = "l" ]; then
		l=$(sed -n "/\[.*\]/p" $x | grep -v "#")
		echo $l
	fi

	if [ $ans = "t" ]; then
		read -p "enter the group name > " ansible_group
                echo
                check=$(sed -n "/\[$ansible_group\]/p" $x)
                echo $check
                if [ $check > /dev/null ]; then
			read -p "< enter the new network >" net1
			sed -i "/\[$ansible_group\]/a/$net1" $x
                else
			echo "group doesn't exists "
                fi
	fi

	if [ $ans = "d" ]; then
		echo "enter the network to delete"
		read -p "< enter the network >" net2
		sed -i "/$net2/d" $x
	fi
done

