Dado('que eu acesso a página de Cadastre-se') do
	@usuario_page = UsuarioPage.new
	@usuario_page.load
end

Quando('eu faço cadastro com os dados corretos') do
	@usuario = 				Faker::Name.first_name
	@senha = 					"#{DATA['cadastro_sucesso']['senha']}"
	@confirma_senha = "#{DATA['cadastro_sucesso']['confirma_senha']}"
	@usuario_page.cadastrar(@usuario,@senha,@confirma_senha)
end

Então('devo ver a página principal para acesso') do
	@mensagem = 			"#{DATA['cadastro_sucesso']['mensagem']}"
	expect(page).to have_content @mensagem
end

Quando('eu faço cadastro com a senha e confirmação de senha diferentes') do
	@usuario = 				"#{DATA['cadastro_falho_senhas']['usuario']}"
	@senha = 					"#{DATA['cadastro_falho_senhas']['senha']}"
	@confirma_senha = "#{DATA['cadastro_falho_senhas']['confirma_senha']}"
	@usuario_page.cadastrar(@usuario,@senha,@confirma_senha)  
end

Então('devo ver visualizar uma mensagem de erro das senhas') do
	@mensagem = 			"#{DATA['cadastro_falho_senhas']['mensagem']}"
	expect(page).to have_content @mensagem
end

Quando('eu faço cadastro com dados já cadastrados') do
  @usuario = 				"#{DATA['cadastro_falho_existente']['usuario']}"
	@senha = 					"#{DATA['cadastro_falho_existente']['senha']}"
	@confirma_senha = "#{DATA['cadastro_falho_existente']['confirma_senha']}"
	@usuario_page.cadastrar(@usuario,@senha,@confirma_senha)  
end

Então('devo ver visualizar uma mensagem de erro do usuário') do
	@mensagem = 			"#{DATA['cadastro_falho_existente']['mensagem']}"
	expect(page).to have_content @mensagem
end    