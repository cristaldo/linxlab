The Linx Lab Repository
=========================

## 
Módulo de Deploy de nodejs application + Nginx com Ansible

## ** Script de inicialização **

O Script start.sh realiza a instalação do Ansible no servidor que for executado, assim como cria o arquivo host
com um apontamento a localhost.

* Compatibilidade: CentOS / RedHat *

# Instruções

1) Aplicar permissão de execução:
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
ansible-playbook init.yaml
```

