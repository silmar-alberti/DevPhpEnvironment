# DOCKER!!! 
- clone o repositorio
- crie a pasta www
- dentro da pasta www adicione a pasta do sitema que voc� utiliza(blog, s3_miniature, ...)
- adicione o arquivo de configura��o do apache na pasta www/<pasta do sistema>/<nome da configura��o>.apache.conf
- crie um alias para um ip estatico (para alguns linux):

`ifconfig eth0:0 10.254.254.254 up`

- crie um alias para um ip estatico (para mac):

`sudo ifconfig lo0 alias 10.254.254.254`


- rode o comando: sudo docker-compose build
- rode o comando: sudo docker-compose up
agora o container j� esta em execu��o

- ctrl-c para encerar a execu��o
- sudo docker-compose start .para executar o container


#### oque ir� acontercer? 

- pasta www/ do projeto sera compartilhada com a /var/www
- pasta logs/ conter� os logs do apache
