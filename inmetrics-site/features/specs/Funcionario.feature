#encoding:utf-8
#language:pt

Funcionalidade: Administrar funcionário no sistema da Inmetrics
  Como um usuário do sistema
  Quando realizar uma ação no funcionários
  Para administrar o funcionário realizando inclusão, alteração e exclusão 

    @incluir_funcionario
    Cenario: Inclusão de Funcionário
      Dado que eu acesso a página de Novo Funcionário
      Quando eu faço o cadastro com os dados corretos
      Então devo ver a seguinte mensagem de sucesso
      
    @alterar_funcionario
    Cenario: Alteração de Funcionário
      Dado que eu acesso a página de Alterar Funcionário
      Quando eu faço a alteração com os dados corretos
      Então devo visualizar mensagem de atualização efetuada com sucesso

    @excluir_funcionario
    Cenario: Exclusão de Funcionário
      Dado que eu acesso a página da área logada
      Quando eu clico no botão excluir
      Então devo visualizar mensagem de deletado efetuada com sucesso

