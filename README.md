The Linx Lab Repository
=========================

## 
M�dulo de Deploy de nodejs application + Nginx com Ansible

## ** Script de inicializa��o **

O Script start.sh realiza a instala��o do Ansible no servidor que for executado, al�m de outras depend�ncias.

* OS: CentOS / RedHat 
* Utilizar o usuario: root

# Instru��es de Instala��o

1) Aplicar permiss�o de execu��o, se necess�rio:
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

Ap�s a execu��o do script start.sh, o playbook poder� ser executado:

```
ansible-playbook site.yaml
```
Ap�s realizar o Deploy:

Acesse a aplica��o nodeJS atrav�s da URL: http(s)://ip_do_servidor


###  Para realizar o Rollback do Deploy

Para remover toda aplica��o do servidor, basta utilizar a tag "rollback" na execu��o do playbook

```
ansible-playbook site.yaml --tag rollback

