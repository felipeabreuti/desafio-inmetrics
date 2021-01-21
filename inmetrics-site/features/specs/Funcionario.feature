#language:pt
@web_funcionario

Funcionalidade: Funcionário
  Para que eu possa incluir, alterar e excluir os funcionários
  Sendo um usuário 
  Devo me logar ao sistema para conseguir acesso a tela de funcionários

    Contexto: Estar na tela de Empregados

    Esquema do Cenario: Inclusão de Funcionário
      Dado que eu acesso a página de Novo Funcionário
      Quando eu faço o cadastro com os dados corretos
      Então devo ver a seguinte mensagem de sucesso
      
      Esquema do Cenario: Alteração de Funcionário
      Dado que eu acesso a página de Alterar Funcionário
      Quando eu faço a alteração com os dados corretos
      Então devo visualizar mensagem de atualização efetuada com sucesso

      Esquema do Cenario: Exclusão de Funcionário
      Dado que eu acesso a página da área logada
      Quando eu clico no botão excluir
      Então devo visualizar mensagem de deletado efetuada com sucesso

