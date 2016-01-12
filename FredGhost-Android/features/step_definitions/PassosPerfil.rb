# encoding: utf-8
require 'calabash-android/calabash_steps'

Então(/^devo ver que estou logado$/) do
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  expect(email).to eq @email
end

Então(/^posso visualizar que meu nome é "([^"]*)"$/) do |nome_esperado|
  sleep 2
  nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  expect(nome).to eq nome_esperado
end

Então(/^que meu email é "([^"]*)"$/) do |email_esperado|
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  expect(email).to eq email_esperado
end

Então(/^que meu RG é "([^"]*)"$/) do |rg_esperado|
  rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  expect(rg).to eq rg_esperado
end

Então(/^que meu CPF é "([^"]*)"$/) do |cpf_esperado|
  cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  expect(cpf).to eq cpf_esperado
end

Então(/^que minha Data de Nascimento é "([^"]*)"$/) do |data_nascimento_esperada|
  data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  expect(data_nascimento).to eq data_nascimento_esperada
end

Então(/^que meu Sexo é "([^"]*)"$/) do |sexo_esperado|
  sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  expect(sexo).to eq sexo_esperado
end

Então(/^que meu Telefone é "([^"]*)"$/) do |telefone_esperado|
  telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  expect(telefone).to eq telefone_esperado
end

Então(/^que meu Telefone Celular é "([^"]*)"$/) do |celular_esperado|
  celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first
  expect(celular).to eq celular_esperado
end

Então(/^devo deslizar até a aba "([^"]*)"$/) do |nome_aba|

  while (element_does_not_exist "* marked:'#{nome_aba}'")
    pan "LinearLayout" , :left
    sleep 1
  end

  tap_mark nome_aba

end

Então(/^visualizo meus dados$/) do
  nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first
  #Cria uma variavel de instancia com os dados do cliente
  @pessoa = Modelos::PessoaFisica.new(nome,email,rg,cpf,data_nascimento,sexo,telefone,celular)
  puts @pessoa.to_s

end

Então(/^visualizo meus dados alterados$/) do
  #Vamos salvar os dados antigos
  @pessoa_antiga = @pessoa
  #Vamos carregar os novos dados do perfil com o step de visualização
  steps %{
    Então visualizo meus dados
  }

  # nome = (query Elementos::MinhaConta::MeusDados::Nome, :text)[1]
  # email = (query Elementos::MinhaConta::MeusDados::Email, :text).first
  # rg = (query Elementos::MinhaConta::MeusDados::RG, :text).first
  # cpf = (query Elementos::MinhaConta::MeusDados::Cpf, :text).first
  # data_nascimento = (query Elementos::MinhaConta::MeusDados::Data_De_Nascimento, :text).first
  # sexo = (query Elementos::MinhaConta::MeusDados::Sexo, :text).first
  # telefone = (query Elementos::MinhaConta::MeusDados::Telefone, :text).first
  # celular = (query Elementos::MinhaConta::MeusDados::Telefone_Celular, :text).first

  #Vamos verificar se os dados são diferentes
  expect(@pessoa.nome).not_to eq @pessoa_antiga.nome
  #expect(@pessoa.email).not_to eq @pessoa_antiga.email
  expect(@pessoa.rg).not_to eq @pessoa_antiga.rg
  #expect(@pessoa.cpf).not_to eq @pessoa_antiga.cpf
  #expect(@pessoa.data_nascimento).not_to eq @pessoa_antiga.data_nascimento
  expect(@pessoa.sexo).not_to eq @pessoa_antiga.sexo
  expect(@pessoa.telefone).not_to eq @pessoa_antiga.telefone
  expect(@pessoa.celular).not_to eq @pessoa_antiga.celular

end

Então(/^clico em sair$/) do
  touch Elementos::MinhaConta::Sair
  tap_mark "Sim"
end

Então(/^coloco minha senha atual "([^"]*)"$/) do |senha|
  touch Elementos::MinhaConta::MeusDados::Senha_Atual
  keyboard_enter_text(senha)
  hide_soft_keyboard #Retira o teclado da tela se estiver visivel
  esperar_teclado_sumir
end

Então(/^mudo a minha senha para "([^"]*)" novamente$/) do |nova_senha|
steps %{
  E clico em "Minha conta"
  E espero carregar
  E clico em "Alterar e-mail e/ou senha"
  E preencho o campo "Nova senha" com "#{nova_senha}"
  E preencho o campo "Repita a nova senha" com "#{nova_senha}"
  Então coloco minha senha atual "#{@senha}"
  E clico em "OK"
  Então espero carregar
  E não devo ver uma mensagem de erro
}
end

Então(/^mudo o meu email para "([^"]*)"$/) do |email|
steps %{
  E clico em "Minha conta"
  E espero carregar
  E clico em "Alterar e-mail e/ou senha"
  E preencho o campo "Novo e-mail" com "#{email}"
  Então coloco minha senha atual "#{@senha}"
  E clico em "OK"
  Então espero carregar
  E não devo ver uma mensagem de erro
}
end

Então(/^visualizo meus endereços$/) do

  enderecos = (query Elementos::MinhaConta::MeusEnderecos::Endereco_Container)
  for i in (0...enderecos.size) # 0 <
    nome_endereco = (query Elementos::MinhaConta::MeusEnderecos::Nome_Endereco , :text)[i]
    rua_numero = (query Elementos::MinhaConta::MeusEnderecos::Rua_Numero , :text)[i]
    bairro_cep = (query Elementos::MinhaConta::MeusEnderecos::Bairro_Cep , :text)[i]
    cidade_estado = (query Elementos::MinhaConta::MeusEnderecos::Cidade_Estado , :text)[i]
    telefone = (query Elementos::MinhaConta::MeusEnderecos::Telefone , :text)[i]
    puts %{
      Endereço #{i+1}:
      #{nome_endereco}
      #{rua_numero}
      #{bairro_cep}
      #{cidade_estado}
      #{telefone}
    }
    expect(nome_endereco).not_to be_empty
    expect(rua_numero).not_to be_empty
    expect(bairro_cep).not_to be_empty
    expect(cidade_estado).not_to be_empty
    expect(telefone).not_to be_empty
  end
end

Então(/^visualizo meus pedidos$/) do
  wait_for_element_exists(Elementos::MinhaConta::MeusPedidos::Preco , :timeout => 10)
  qtd_pedidos = (query Elementos::MinhaConta::MeusPedidos::Preco).size
  @pedidos = []
  for i in (0...qtd_pedidos)
    num_pedido = (query Elementos::MinhaConta::MeusPedidos::Numero_Do_Pedido , :text)[i]
    num_pedido.slice! "Pedido Nº: "
    forma_pagamento = (query Elementos::MinhaConta::MeusPedidos::Metodo_De_Pagamento , :text)[i]
    valor = (query Elementos::MinhaConta::MeusPedidos::Preco , :text)[i]
    data = (query Elementos::MinhaConta::MeusPedidos::Data , :text)[i]
    status = (query Elementos::MinhaConta::MeusPedidos::Status , :text)[i]

    pedido = Modelos::Pedido.new(num_pedido,forma_pagamento,valor,data,status)
    @pedidos << pedido
  end
  @pedidos.each do |pedido|
    puts pedido.to_s #Exibe o valor do pedido
    expect(pedido.id_pedido).not_to be_empty
    expect(pedido.forma_pagamento).not_to be_empty
    expect(pedido.valor_total).not_to be_empty
    expect(pedido.data).not_to be_empty
    expect(pedido.status).not_to be_empty
  end
end
