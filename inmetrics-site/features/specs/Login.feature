#encoding:utf-8
#language: pt

@login_sistema
Funcionalidade: Realizar o login no sistema da Inmetrics para administrar funcionário
  Como um usuário do sistema
  Quero realizar o login no sistema
  Para visualizar a tela logada

  @login_sucesso
  Cenario: Login com sucesso
    Dado que estou na página de login
    Quando eu faço login com usuário correto
    Então devo visualizar a área logada

  @login_falha
  Cenario: Login sem sucesso
    Dado que estou na página de login
    Quando eu faço login com usuário incorreto
    Então devo ver a mensagem de erro
