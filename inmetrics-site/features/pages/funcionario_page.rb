class FuncionarioPage < SitePrism::Page   
  set_url '/empregados/new_empregado'                                               
  element :input_nome, "input[id='inputNome']"
  element :input_cpf, "input[id='cpf']"
  element :select_sexo, "select[id='slctSexo']"
  element :input_data_admissao, "input[id='inputAdmissao']"
  element :input_cargo, "input[id='inputCargo']"
  element :input_salario, "input[id='dinheiro']"
  element :input_tipo_clt, '#clt'
  element :button_alterar, '.btn-warning'
  element :button_deletar, '#delete-btn'
  element :button_clicar, '.cadastrar-form-btn'
  element :input_pesquisar, '#tabela_filter > label > input[type=search]'

  def cadastrar( nome, cpf, sexo, data_admissao, cargo, salario, tipo_contracao)
    input_nome.send_keys(nome)
    input_cpf.send_keys(cpf)
    select_sexo.send_keys(sexo)
    input_data_admissao.send_keys(data_admissao)
    input_cargo.send_keys(cargo)
    input_salario.send_keys(salario)
    input_tipo_clt.click
    button_clicar.click
  end

  def alterar(busca, nome, cpf, sexo, data_admissao, cargo, salario, tipo_contracao)
    input_pesquisar.set @busca
    sleep 3
    button_alterar.click
    
    input_nome.send_keys(nome)
    input_cpf.send_keys(cpf)
    select_sexo.send_keys(sexo)
    input_data_admissao.send_keys(data_admissao)
    input_cargo.send_keys(cargo)
    input_salario.send_keys(salario)
    input_tipo_clt.click
    button_clicar.click
  end

  def deletar (busca)
    input_pesquisar.set @busca
    sleep 3
    button_deletar.click
  end

  def logar 
    @login_page = LoginPage.new
    @login_page.load
    @usuario = "#{DATA['login_sucesso']['usuario']}"
    @senha = "#{DATA['login_sucesso']['senha']}"
    @login_page.logar(@usuario, @senha)
  end

end