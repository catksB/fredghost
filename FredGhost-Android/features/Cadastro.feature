# language: pt
@cadastro
Funcionalidade: Validar Cadastros

#pf
@PF
Cenário: Posso Realizar um cadastro como Pessoa Física
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
E clico em "Cadastrar"
E preencho o campo CPF
E preencho o campo "Nome" com "Fred Teste"
E preencho o campo "Sobrenome" com "Fred Sobrenome"
E preencho o campo "R.G." com "44444444444"
E escolho a data do campo "Data de Nascimento" com o dia "28", mês "07" e ano "1992"
E seleciono o Sexo "Masculino"
E preencho o campo "Telefone" com "1155555551"
E aguardo "2" segundos
E preencho o campo "Telefone Celular" com "1199999991"
E aguardo "2" segundos
Então clico em "Próximo"
E preencho o campo "CEP" com "05038-090"
E espero a rua ser preenchida
E preencho o campo "Número" com "200"
Então clico em "Próximo"
E preencho o campo Email com o gerado e o dominio "@teste.com"
E preencho o campo "Senha" com "123"
E preencho o campo "Confirme a senha" com "123"
Então clico em "Concluir"
E aguardo "10" segundos
Dado que estou na tela inicial
Quando clicar no menu lateral
Então verifico se estou logado com meu novo email
