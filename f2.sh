#! /bin/bash
x=$(which ansible)
echo $x
#= sed -n "3p" /etc/os-release
#echo $y
function install1(){
	yum update -y
	yum install wget -y
        wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
        yum install epel-release -y
        yum install ansible -y
}

function install2(){
	apt update -y
	apt install software-properties-common -y
	add-apt-repository --yes --update ppa:ansible/ansible
	apt install ansible -y


}


function user(){
	useradd -p "123" rj
	var1="ansible	ALL=(ALL)	NOPASSWD:ALL"
	sed -i "100a$var1" /etc/sudoers
}



if [ -z "$x" ] && [ $(sed -n "3p" /etc/os-release) = 'ID="rhel"' ]; then
	install1
elif [ -z "$x" ] && [ $(sed -n "3p" /etc/os-release) = 'NAME="Ubuntu"' ]; then
	install2
else
	echo "not ok"
fi



