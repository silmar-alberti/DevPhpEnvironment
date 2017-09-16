# DOCKER!!! 
- clone o repositorio
- dentro da pasta www adicione a pasta do sitema que você utiliza(blog, s3_miniature, ...)
- adicione o arquivo de configuração do apache na pasta www/<pasta_do_sistema>/dockerConfig/<nome_da_configuração>.apache.conf
- dentro da pasta dockerConfig pode-se incluir um arquivo chamado init.sh que será executado no boot da maquina

###  Comunicação com o Host
   Para comunicar a maquina com o docker pode ser criado um alias 
   ou então identificar qual o endereço da rede em que o docker está 
   conectado. Em distribuições Linux geralemnte esta interface de rede é 
   chamada de "docker0"
   
   ### Criando alias (*opcional)
   - crie um alias para um ip estatico (para linux)
    
    `ifconfig eth0:0 10.254.254.254 up`
    
   - crie um alias para um ip estatico (para mac):
    
    `sudo ifconfig lo0 alias 10.254.254.254`


## Criar Imagem
- com permissão root rode o seguinte script
        
     `./build_Environment.sh --interface docker0`    
<br>ou <br><br>
    `./build_Environment.sh --ip 10.254.254.254`
    
    estas opções são utilizadas para configurar o XDEBUG para o ip do host
    e só são nescessárias em sua primeira build
        
        
### iniciar o container
    
       `sudo docker-compose start`

### iniciar terminal no container em execução
        `sudo ./bash.sh`


### Passos Adicionais para Mac
- sincronize os arquivos do repositorio que quer executar
- reinicie o container


Usuario para ssh: sshUser
Senha para ssh: pass
Porta para ssh: 2200


#### oque irá acontercer? 

- pasta www/ deste projeto sera compartilhada com a /var/www
- pasta logs/ conterá os logs do apache
