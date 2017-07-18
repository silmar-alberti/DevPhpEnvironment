# DOCKER!!! 
- clone o repositorio
- crie a pasta www
- dentro da pasta www adicione a pasta do sitema que você utiliza(blog, s3_miniature, ...)
- adicione o arquivo de configuração do apache na pasta www/<pasta_do_sistema>/<nome_da_configuração>.apache.conf
- crie um alias para um ip estatico (para alguns linux):

`ifconfig eth0:0 10.254.254.254 up`

- crie um alias para um ip estatico (para mac):

`sudo ifconfig lo0 alias 10.254.254.254`


- rode o comando: sudo docker-compose build
- rode o comando: sudo docker-compose up
agora o container já esta em execução

- ctrl-c para encerar a execução
- sudo docker-compose start .para executar o container


#### oque irá acontercer? 

- pasta www/ do projeto sera compartilhada com a /var/www
- pasta logs/ conterá os logs do apache
