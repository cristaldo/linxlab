#!/bin/bash

# Script para instalar ou remover o ansible
# Conferindo se o SO é CentOS
# @2020 rafael@rafaelcristaldo.com.br

if [ -f /etc/redhat-release ]; then

# Variaveis
srcfile=src/hosts
dstfile=/etc/ansible/
privkey="/root/.ssh/id_rsa"
pubkey="/root/.ssh/id_rsa.pub"
authkey="/root/.ssh/authorized_keys"
knownkey="/root/.ssh/known_hosts"

function print_line () {
echo "----------------------------------------------------------"
}

function install () {
print_line
echo "Inicio da instalação do EPEL e Ansible"
print_line

  yum -y update && yum -y install epel-release && yum -y install ansible
  cp -r $srcfile $dstfile
  echo "   Ansible Instalado"

if [ -f $pubkey ]; then

    grep -xFf $authkey $pubkey  > /dev/null 2>&1
    result=$?

    	if  [ "$result" -ne 0 ]; then
	print_line
   	   echo "Já existe uma chave SSH..."
           cat $pubkey >> $authkey
   	   echo "Copiando Chave SSH no arquivo $authkey..."
	   ssh-keyscan -t ecdsa localhost  >> $knownkey
	print_line

        else

	print_line
   	   echo "A chave publica já está autorizada"
	   ssh-keyscan -t ecdsa localhost  >> $knownkey
	print_line
        fi
else
	print_line
   	echo "Ainda não há uma chave SSH..."
   	echo "Criando nova chave SSH..."
           ssh-keygen -f $privkey -P ""
        echo "Copiando chave SSH no arquivo $authkey..."
           cat $pubkey >> $authkey
	   ssh-keyscan -t ecdsa localhost  >> $knownkey
	print_line
fi

print_line
echo  " "
echo  " Agora execute o comando abaixo para aplicar o playbook"
echo  " "
echo  " ansible-playbook site.yaml"
print_line

}

function remove () {

print_line
echo "Inicio da remocao do EPEL e Ansible"
print_line

  yum -y remove epel-release && yum -y remove ansible
  rm -rf $dstfile
  echo "   Ansible Removido"

print_line
echo  " Pacotes EPEL e Ansible removidos"
print_line

}

else
   echo "Script compatível apenas com CentOS"
exit 0
fi

case  $1 in
         install)       
     		install
                    ;;
                remove)
                    remove;;            
                *)
	      echo "Escolha install ou remove"
	;;              
esac 
