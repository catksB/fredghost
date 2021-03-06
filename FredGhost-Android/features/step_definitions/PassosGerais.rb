# encoding: utf-8
require 'calabash-android/calabash_steps'


Dado(/^que estou na tela inicial$/) do
  #check_element_exists("imagebutton index:0")
  check_element_exists("* marked:'Pesquisar'")
end

Quando(/^clicar no menu lateral$/) do
  touch("imagebutton index:0")
  sleep(4)
end

Quando(/^clicar em pesquisar$/) do
  tap_mark "Pesquisar"
end


Quando(/^preencho a busca com "([^"]*)"$/) do |texto|
  keyboard_enter_text(texto)
  #perform_action('send_key_enter')
  press_enter_button
end


Então(/^posso clicar no primeiro item$/) do
  wait_for(timeout: 10) { element_exists '* id:"product_item"' }
  #check_element_exists("framelayout index:0")
  #touch "imageview index:1"
  touch(query('* id:"product_item"')[0])

end

Então(/^volto a tela$/) do
  sleep 3
  press_back_button
  #wait_for(timeout: 10) { element_exists "imagebutton index:0" }
  #touch "imagebutton index:0"
end

Então /^deslizo para baixo até que eu veja o "([^\"]*)"/ do |elemento|

  q = query("* marked:'#{elemento}'")
    while q.empty?
      scroll_down
      q = query("* marked:'#{elemento}'")
    end
end

Então(/^clico em "([^"]*)"$/) do |elemento|
  tap_mark elemento
end

Então(/^clico no botão circular.*$/) do
  wait_for(timeout: 5) { element_exists "FloatingActionButton'" }
  touch 'FloatingActionButton'
  #screenshot({:name=>"my.png"}) # tira screenshot
end

Então(/^preencho o campo "([^"]*)" com "([^"]*)"$/) do |campo, texto|
  tap_mark campo
  keyboard_enter_text(texto)
  hide_soft_keyboard #Retira o teclado da tela se estiver visivel
  esperar_teclado_sumir

end

Então(/^edito o campo "([^"]*)" com "([^"]*)"$/) do |campo, texto|
  tap_mark campo
  clear_text
  keyboard_enter_text(texto)
  hide_soft_keyboard #Retira o teclado da tela se estiver visivel
  esperar_teclado_sumir
end

Então(/^seleciono o campo "([^"]*)" como "([^"]*)"$/) do |campo, opcao|
  tap_mark campo
  tap_mark opcao
end

Então(/^aguardo "([^"]*)" segundos$/) do |segundos|
  sleep(segundos.to_i)
end

Então(/^o cucumber deve dar erro$/) do
  expect(true).to be false
  # TODO: Melhorar o codigo para falhar
end

Então(/^não devo ver uma mensagem de erro$/) do
  expect(element_does_not_exist("* id:'snackbar_text'")).to be true
end

Então(/^espero carregar$/) do
  wait_for_element_does_not_exist("ProgressBar", :timeout => 5)
end

Então(/^visualizo o botão de "([^"]*)"$/) do |botao|
  wait_for_element_exists("* marked:'#{botao}'", :timeout => 5)
end

Então(/^vejo que estou na tela "([^"]*)"$/) do |titulo_esperado|
  sleep 3
  titulo_obtido = (query "TextView" , :text).first
  expect(titulo_obtido).to eq(titulo_esperado)
end
