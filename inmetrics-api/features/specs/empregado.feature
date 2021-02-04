#encoding:utf-8
#language:pt

Funcionalidade: Manter dados de Empregado através da API
  Como um usuário do sistema
  Quero realizar as requisições na API
  Para manipular as informações do cadastro de empregado

  @cadastrar_empregado
  Cenário: Cadastrar um Empregado 
    Dado as informações para manter o cadastro na API
    Quando realizar uma requisição para cadastrar um Empregado via Método POST
    Então validar o código da resposta para requisição do cadastro via API

  @consultar_empregado
  Cenário: Consultar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para consultar um Empregado via Método GET
    Então validar o código da resposta para requisição da consulta via API

  @consultar_todos_empregados
  Cenário: Consultar todos Empregados
    Quando realizar uma requisição para consultar todos os Empregados via Método GET
    Então validar o código da resposta para requisição da consulta de todos empregados via API

  @alterar_empregado
  Cenário: Alterar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para alterar um Empregado via Método PUT
    Então validar o código da resposta para requisição da alteração via API

  @verificar_dados_empregado
  Cenário: Verificação dados do Empregado 
    Quando realizar uma requisição para consultar o Empregado cadastrado
    Então validar se todos os dados estão gravados na API

  @deletar_empregado
  Cenário: Deletar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para deletar um Empregado via Método DELETE
    Então validar o código da resposta para requisição de exclusão via API
