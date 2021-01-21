class LoginPage < SitePrism::Page    
  set_url '/accounts/login/'                                               
  element :input_nome, "input[name='username']"
  element :input_senha, "input[name='pass']"

  def logar(usuario, senha)
    input_nome.send_keys(usuario)
    input_senha.send_keys(senha)
    click_button 'Entre'
  end

end
