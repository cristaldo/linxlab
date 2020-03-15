#!/bin/bash

# Script para instalar ou remover remover o ansible

# Conferindo se o SO é CentOS
if [ -f /etc/redhat-release ]; then

srcfile=src/hosts
dstfile=/etc/ansible/

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

print_line
echo  "               Ansible Instaldo"
echo  " Agora execute o comando abaixo:"
echo  " "
echo  " ansible-playbook init.yaml"
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
	      echo "escolha install ou remove"
;;              
esac 
