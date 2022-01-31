# README

Getting started:

* Clone repo:

  ```git clone https://github.com/nathanfmachado/credishop-challenge.git``` 

* (Optional) Config asdf to manage ruby, nodejs and yarn versions:

  ```https://github.com/asdf-vm/asdf```

  Ruby v2.7.4
  NodeJS v16.13.0
  Yarn v1.22.17

* In the projects root path, run:

  ```bundle```
  ```yarn```
  ```sudo apt install redis-server```

* With the .env.sample file as guide, create a .env file and put your datebase credentials, example:

  DATABASE_HOST=localhost
  DATABASE_NAME=credishop-challenge
  DATABASE_USERNAME=postgres
  DATABASE_PASSWORD=postgres

  RAILS_MAX_THREADS=5
  SECRET_KEY_BASE=

* To create, migrate and seed DB, run the development task: 

  ```rails dev:setup```

* Finally, start redis and rails:

  ```redis-server```
  ```rails s```


Observações:

* Devido a falta de tempo, algumas features não foram desenvolvidas ou ficaram com problemas, como:
  - Edição do Proponente
  - Autenticação com Devise: foi configurada, mas as views e paths não foram refinados e os controllers não necessitam autenticação do usuário
  - Testes
  - Listagem do relatório (foi feita apenas o gráfico)
  - Refinamentos das views, formulários e validações mais elaboradas

* Foi utilizado 'scaffold' para criar os models/controllers/views com maior agilidade
* Não tenho certeza se a atualização do salário do funcionário, citada na ultima pagina do desafio, era realmente o que eu desenvolvi
* Foi utilizado um layout externo (que utiliza bootstrap) para melhor visualização, por isso é necessário rodar o projeto com acesso a internet, já que o layout está hospedado no S3 da AWS. 

