The Linx Lab Repository
=========================

## 
Módulo de Deploy de nodejs application + Nginx com Ansible

Utilizado módulo PM2 para cluster da aplicação, assim como para balanceamento de carga entre
os processos nodejs e assim como também para autostart do serviço node caso seja interrompido

Utilizado monit para monitoramento do serviço nginx e autostart em caso de falhas

## ** Script de inicialização **

O Script start.sh realiza a instalação do Ansible no servidor que for executado, além de outras dependências.

* OS: CentOS / RedHat 
* Utilizar o usuario: root

# Instruções de Instalação

1) Aplicar permissão de execução, se necessário:
``` 
chmod +x start.sh
```

2) Executar o script para instalar os pacotes
```
 sh start.sh install
```

### ** Para remover os pacotes **
```
sh start.sh remove
```

Após a execução do script start.sh, o playbook poderá ser executado:

```
ansible-playbook site.yaml
```
Após realizar o Deploy:

Acesse a aplicação nodeJS através da URL: http(s)://ip_do_servidor

Ex: Hello World Linx !!! Sou o worker 8 de 12 CPUs

Cada acesso web ao servidor, mostrará qual worker process está atendendo esta requisição, assim como o número total de CPUs.


###  Para realizar o Rollback do Deploy

Para remover toda aplicação do servidor, basta utilizar a tag "rollback" na execução do playbook

```
ansible-playbook site.yaml --tag rollback

