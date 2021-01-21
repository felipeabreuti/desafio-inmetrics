
Dado('que eu acesso a página de Novo Funcionário') do
  @funcionario_page = FuncionarioPage.new
  @funcionario_page.logar
  @funcionario_page.load
end

Quando('eu faço o cadastro com os dados corretos') do
	@nome = Faker::Name.first_name
	@cpf = "148.588.900-66"#DocumentosBr.cpf_formatado
	@sexo = "#{DATA['funcionario_inclusao_sucesso']['sexo']}"
	@data_admissao = "#{DATA['funcionario_inclusao_sucesso']['data_admissao']}"
	@cargo = "#{DATA['funcionario_inclusao_sucesso']['cargo']}"
	@salario = "#{DATA['funcionario_inclusao_sucesso']['salario']}"
	@tipo_contracao = "#{DATA['funcionario_inclusao_sucesso']['tipo_contracao']}"

  @funcionario_page.cadastrar(@nome,@cpf,@sexo,@data_admissao, @cargo, @salario, @tipo_contracao)
	DATA['inclusoes']['nome_alt_del'] = @nome
end

Então('devo ver a seguinte mensagem de sucesso') do
	@mensagem = "#{DATA['funcionario_inclusao_sucesso']['mensagem']}"
	expect(page).to have_content @mensagem
end

#######################################################

Dado('que eu acesso a página de Alterar Funcionário') do
  @funcionario_page = FuncionarioPage.new
  @funcionario_page.logar
end

Quando('eu faço a alteração com os dados corretos') do
  @nome = DATA['inclusoes']['nome_alt_del']
	@cpf = "222.222.333-99"#DocumentosBr.cpf_formatado
	@sexo = "#{DATA['funcionario_alteracao_sucesso']['sexo']}"
	@data_admissao = "#{DATA['funcionario_alteracao_sucesso']['data_admissao']}"
	@cargo = "#{DATA['funcionario_alteracao_sucesso']['cargo']}"
	@salario = "#{DATA['funcionario_alteracao_sucesso']['salario']}"
	@tipo_contracao = "#{DATA['funcionario_alteracao_sucesso']['tipo_contracao']}"
  @funcionario_page = FuncionarioPage.new

  @busca = DATA['inclusoes']['nome_alt_del']
  @funcionario_page.alterar(@busca, @nome,@cpf,@sexo,@data_admissao, @cargo, @salario, @tipo_contracao)
end

Então('devo visualizar mensagem de atualização efetuada com sucesso') do
	@mensagem = "#{DATA['funcionario_alteracao_sucesso']['mensagem']}"
	expect(page).to have_content @mensagem
end

#######################################################

Dado('que eu acesso a página da área logada') do
  @funcionario_page = FuncionarioPage.new
  @funcionario_page.logar
end

Quando('eu clico no botão excluir') do
  @funcionario_page = FuncionarioPage.new
	@busca = DATA['inclusoes']['nome_alt_del']
  @funcionario_page.deletar(@busca)
end

Então('devo visualizar mensagem de deletado efetuada com sucesso') do
	@mensagem = "#{DATA['funcionario_delete_sucesso']['mensagem']}"
	expect(page).to have_content @mensagem
end

