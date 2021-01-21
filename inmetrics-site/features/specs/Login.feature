#language: pt

@web_login
Funcionalidade: Login

  Cenario: Login com sucesso
    Dado que estou na página de login
    Quando eu faço login com usuário correto
    Então devo visualizar a área logada

  Cenario: Login sem sucesso
    Dado que estou na página de login
    Quando eu faço login com usuário incorreto
    Então devo ver a mensagem de erro
