class UsuarioPage < SitePrism::Page    
  set_url '/accounts/signup/' 

  element :input_nome, "input[name='username']"
  element :input_senha, "input[name='pass']"
  element :input_confimacao_senha, "input[name='confirmpass']"
  element :alerta, '#data-validate'

  def cadastrar(usuario, senha, confirma_senha)
    input_nome.send_keys(usuario)
    input_senha.send_keys(senha)
    input_confimacao_senha.send_keys(confirma_senha)
    click_button 'Cadastrar'
  end

end