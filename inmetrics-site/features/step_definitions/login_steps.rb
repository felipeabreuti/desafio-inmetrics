Dado('que estou na página de login') do
  @login_page = LoginPage.new
  @login_page.load
end

Quando('eu faço login com usuário correto') do
	@usuario = "#{DATA['login_sucesso']['usuario']}"
	@senha = "#{DATA['login_sucesso']['senha']}"
	@login_page.logar(@usuario, @senha)
end

Então('devo visualizar a área logada') do
	@mensagem = "#{DATA['login_sucesso']['mensagem']}"
	expect(page).to have_content @mensagem
end

#############################################################################

Quando('eu faço login com usuário incorreto') do
  @usuario = "#{DATA['login_falha']['usuario']}"
	@senha = "#{DATA['login_falha']['senha']}"
	@login_page.logar(@usuario, @senha)
end

Então('devo ver a mensagem de erro') do
	@mensagem = "#{DATA['login_falha']['mensagem']}"
	expect(page).to have_content @mensagem
end
