#encoding:utf-8
#language:pt

@empregado

Funcionalidade: Manter dados de Empregado através da API
Como um usuário do sistema
Eu quero realizar as requisições na API
A fim de manipular as informações do cadastro de empregado

Cenário: Cadastrar um Empregado 
    Dado as informações para manter o cadastro na API
    Quando realizar uma requisição para cadastrar um Empregado via Método POST
    Então validar o código da resposta para requisição do cadastro via API

Cenário: Consultar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para consultar um Empregado via Método GET
    Então validar o código da resposta para requisição da consulta via API

Cenário: Consultar todos Empregados
    Quando realizar uma requisição para consultar todos os Empregados via Método GET
    Então validar o código da resposta para requisição da consulta de todos empregados via API

Cenário: Alterar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para alterar um Empregado via Método PUT
    Então validar o código da resposta para requisição da alteração via API

Cenário: Verificação dados do Empregado 
    Quando realizar uma requisição para consultar o Empregado cadastrado
    Então validar se todos os dados estão gravados na API

Cenário: Deletar um Empregado
    Dado as informações do novo empregado cadastrado na API
    Quando realizar uma requisição para deletar um Empregado via Método DELETE
    Então validar o código da resposta para requisição de exclusão via API
