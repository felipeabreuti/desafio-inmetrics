#language:pt
@web_usuario

Funcionalidade: Cadastro de Usuário
  Para que eu possa cadastrar e gerenciar os funcionários
  Sendo um usuário 
  Devo me cadastrar para conseguir acesso

    Contexto: Estar na tela de Cadastre-se 

    Esquema do Cenario: Cadastro de Usuario com sucesso
      Dado que eu acesso a página de Cadastre-se
      Quando eu faço cadastro com os dados corretos
      Então devo ver a página principal para acesso

    Esquema do Cenario: Cadastro de Usuario com senhas que não combinam
      Dado que eu acesso a página de Cadastre-se
      Quando eu faço cadastro com a senha e confirmação de senha diferentes
      Então devo ver visualizar uma mensagem de erro das senhas   

    Esquema do Cenario: Cadastro de Usuario já existente
      Dado que eu acesso a página de Cadastre-se
      Quando eu faço cadastro com dados já cadastrados
      Então devo ver visualizar uma mensagem de erro do usuário          