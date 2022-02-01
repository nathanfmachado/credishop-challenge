# README

## Getting started:

* Clone repo:

  ```git clone https://github.com/nathanfmachado/credishop-challenge.git``` 

* (Optional) Config asdf to manage ruby, nodejs and yarn versions:

  ```https://github.com/asdf-vm/asdf```

  Ruby v2.7.4 - ```https://github.com/asdf-vm/asdf-ruby```</br>
  NodeJS v16.13.0 - ```https://github.com/asdf-vm/asdf-nodejs```</br>
  Yarn v1.22.17 - ```https://github.com/twuni/asdf-yarn```</br>

* In the projects root path, run:

  ```bundle```</br>
  ```yarn```</br>
  ```sudo apt install redis-server```</br>

* With the .env.sample file as guide, create a .env file and put your datebase credentials, example:

  <code>
  DATABASE_HOST=localhost</br>
  DATABASE_NAME=credishop-challenge</br>
  DATABASE_USERNAME=postgres</br>
  DATABASE_PASSWORD=postgres</br></br>
  RAILS_MAX_THREADS=5</br>
  SECRET_KEY_BASE=</br>
  </code>

* To create, migrate and seed DB, run the development task: 

  ```rails dev:setup```

* Finally, start redis and rails:

  ```redis-server```</br>
  ```rails s```

## Observações:

* Foi utilizado 'scaffold' para criar os models/controllers/views/migrates/tests com maior agilidade
* Foi utilizado um layout externo (que utiliza bootstrap) para melhor visualização, por isso é necessário rodar o projeto com acesso a internet, já que o layout está hospedado no S3 da AWS.
* Foi utilizado sistema de autenticação básica com Devise (signin, signup, logout). Usuário padrão: admin@admin.com | 123456
* Caso o calculo do desconto de INSS não esteja funcionando no formulário do Proponente, verifique se o redis está de pé (redis-server). O calculo do INSS é feito assim que o blur do input de Salário acontece.

#### - Falhas (Requisitos ou melhorias que não foram desenvolvidas)

* Devido a falta de tempo, algumas features não foram desenvolvidas ou ficaram com problemas, como:
  - Testes
  - Listagem do relatório (foi feito apenas o gráfico)
  - Refinamento das views e formulários, além de validações mais elaboradas nos models

#### - Extras (Não requisitados no desafio)

  - Rake tasks para setup do ambiente de desenvolvimento e seeding
  - Informações segmentadas em várias tabelas, para que um Proponente possa ter vários contatos e/ou endereços
  - Adição dinâmica de contatos no formulário do Proponente, caso ele possua muitos contatos (não esta refinado)
  - Utilização de .env para centralizar variáveis de ambiente em um único arquivo e facilitar setup de ambientes de test, homologação e produção

#### - Dúvidas? Sinta-se a vontade para me contactar: nathanfabiano@hotmail.com