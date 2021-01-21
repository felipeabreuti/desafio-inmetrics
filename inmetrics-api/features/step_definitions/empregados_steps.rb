####################################################################################### POST

Dado('as informações para manter o cadastro na API') do
  @body_post = {
    "nome": "Teste",
    "sexo": "m",
    "cpf": "444.444.444-99",#DocumentosBr.cpf_formatado,
    "cargo": "QA",
    "admissao": "10/10/2021",
    "salario": "8.500,00",
    "comissao": "2.000,00",
    "departamentoId": "1",
    "tipoContratacao": "clt"
  }
end

Quando('realizar uma requisição para cadastrar um Empregado via Método POST') do
  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['post']}"
  @retorno = post(endpoint, @body_post)
  @empregado_id = @retorno['empregadoId']
  DATA['test_data']['id'] = @empregado_id
end

Então('validar o código da resposta para requisição do cadastro via API') do
  expect(@retorno.response.code).to eql DATA['test_data']['status_code_post']
  expect(@retorno['nome']).to eql @body_post[:nome]
  expect(@retorno['sexo']).to eql @body_post[:sexo]
  expect(@retorno['cpf']).to eql @body_post[:cpf]
  expect(@retorno['cargo']).to eql @body_post[:cargo]
  expect(@retorno['admissao']).to eql @body_post[:admissao]
  expect(@retorno['salario']).to eql @body_post[:salario]
  expect(@retorno['comissao']).to eql @body_post[:comissao]
  expect(@retorno['departamentoId']).to eql @body_post[:departamentoId]
  expect(@retorno['tipoContratacao']).to eql @body_post[:tipoContratacao]
end

####################################################################################### GET 

Dado('as informações do novo empregado cadastrado na API') do
  @empregado_id = DATA['test_data']['id']

  @body = {
  "nome": "Teste",
  "sexo": "m",
  "cpf": "444.444.444-99",#DocumentosBr.cpf_formatado,
  "cargo": "QA",
  "admissao": "10/10/2021",
  "salario": "8.500,00",
  "comissao": "2.000,00",
  "departamentoId": "1",
  "tipoContratacao": "clt"
}
end

Quando('realizar uma requisição para consultar um Empregado via Método GET') do
  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['get']}#{@empregado_id}"
  @retorno = get(endpoint)
  @empregado_id = @retorno['empregadoId']
end

Então('validar o código da resposta para requisição da consulta via API') do
  expect(@retorno.response.code).to eql DATA['test_data']['status_code_get']
  expect(@retorno['nome']).to eql @body[:nome]
  expect(@retorno['sexo']).to eql @body[:sexo]
  expect(@retorno['cpf']).to eql @body[:cpf]
  expect(@retorno['cargo']).to eql @body[:cargo]
  expect(@retorno['admissao']).to eql @body[:admissao]
  expect(@retorno['salario']).to eql @body[:salario]
  expect(@retorno['comissao']).to eql @body[:comissao]
  expect(@retorno['departamentoId']).to eql @body[:departamentoId]
  expect(@retorno['tipoContratacao']).to eql @body[:tipoContratacao]
end

######################################################################################## GETALL

Quando('realizar uma requisição para consultar todos os Empregados via Método GET') do
  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['get_all']}#{@empregado_id}"
  @retorno = get(endpoint) 
end

Então('validar o código da resposta para requisição da consulta de todos empregados via API') do
  expect(@retorno.response.code).to eql DATA['test_data']['status_code_getall']
end

######################################################################################## PUT

Quando('realizar uma requisição para alterar um Empregado via Método PUT') do
  @empregado_id = DATA['test_data']['id']

  @body = {
    "nome": "TesteAlterado",
    "sexo": "m",
    "cpf": "444.444.444-99",#DocumentosBr.cpf_formatado,
    "cargo": "QA Alterado",
    "admissao": "10/10/2022",
    "salario": "8.500,30",
    "comissao": "2.000,30",
    "departamentoId": "247",
    "tipoContratacao": "pj"
  }  

  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['put']}#{@empregado_id}"
  @retorno = put(endpoint, @body)
end

Então('validar o código da resposta para requisição da alteração via API') do
  expect(@retorno.response.code).to eql DATA['test_data']['status_code_put']
  expect(@retorno['empregadoId']).to eql @empregado_id
  expect(@retorno['nome']).to eql @body[:nome]
  expect(@retorno['sexo']).to eql @body[:sexo]
  expect(@retorno['cpf']).to eql @body[:cpf]
  expect(@retorno['cargo']).to eql @body[:cargo]
  expect(@retorno['admissao']).to eql @body[:admissao]
  expect(@retorno['salario']).to eql @body[:salario]
  expect(@retorno['comissao']).to eql @body[:comissao]
  expect(@retorno['departamentoId']).to eql @body[:departamentoId]
  expect(@retorno['tipoContratacao']).to eql @body[:tipoContratacao]

end

######################################################################################## GET DADOS

Quando('realizar uma requisição para consultar o Empregado cadastrado') do
  @empregado_id = DATA['test_data']['id']

  @body = {
    "nome": "TesteAlterado",
    "sexo": "m",
    "cpf": "444.444.444-99",#DocumentosBr.cpf_formatado,
    "cargo": "QA Alterado",
    "admissao": "10/10/2022",
    "salario": "8.500,30",
    "comissao": "2.000,30",
    "departamentoId": "247",
    "tipoContratacao": "pj"
  }  

  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['get']}#{@empregado_id}"
  @retorno = get(endpoint)
  @empregado_id = @retorno['empregadoId']
end

Então('validar se todos os dados estão gravados na API') do
  expect(@retorno['nome']).to eql @body[:nome]
  expect(@retorno['sexo']).to eql @body[:sexo]
  expect(@retorno['cpf']).to eql @body[:cpf]
  expect(@retorno['cargo']).to eql @body[:cargo]
  expect(@retorno['admissao']).to eql @body[:admissao]
  expect(@retorno['salario']).to eql @body[:salario]
  expect(@retorno['comissao']).to eql @body[:comissao]
  expect(@retorno['departamentoId']).to eql @body[:departamentoId]
  expect(@retorno['tipoContratacao']).to eql @body[:tipoContratacao]
end

######################################################################################## DELETE

Quando('realizar uma requisição para deletar um Empregado via Método DELETE') do
  @empregado_id = DATA['test_data']['id']

  endpoint = "#{CONFIG['config_inmetrics']['uri']}#{CONFIG['config_inmetrics']['delete']}#{@empregado_id}"
  @retorno = delete(endpoint)
end

Então('validar o código da resposta para requisição de exclusão via API') do
  expect(@retorno.response.body).to eql "Deletado"
  expect(@retorno.response.code).to eql DATA['test_data']['status_code_delete']
end

