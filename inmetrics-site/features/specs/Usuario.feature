#encoding:utf-8
#language:pt

@cadastro_usuario
Funcionalidade: Realizar o cadastro do usuário no sistema da Inmetrics
  Como um usuário do sistema
  Quero realizar um cadastro do usuário
  Para obter acesso ao sistema

  @cadastrar_usuario_sucesso
  Cenario: Cadastro de Usuario com sucesso
    Dado que eu acesso a página de Cadastre-se
    Quando eu faço cadastro com os dados corretos
    Então devo ver a página principal para acesso

  @cadastrar_usuario_falha
  Cenario: Cadastro de Usuario com senhas que não combinam
    Dado que eu acesso a página de Cadastre-se
    Quando eu faço cadastro com a senha e confirmação de senha diferentes
    Então devo ver visualizar uma mensagem de erro das senhas   

  @cadastrar_usuario_existente
  Cenario: Cadastro de Usuario já existente
    Dado que eu acesso a página de Cadastre-se
    Quando eu faço cadastro com dados já cadastrados
    Então devo ver visualizar uma mensagem de erro do usuário          