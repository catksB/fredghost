# language: pt
@checkout
Funcionalidade: Validar Checkout

Cenário: Validar Endereço de Entrega
Dado que estou na tela inicial
Quando clicar no menu lateral
Então clico em "Entre ou cadastre-se, clique aqui!"
Então devo me logar
Quando clicar em pesquisar
E preencho a busca com "Tenis Bout Sense 6516C"
Então posso clicar no primeiro item
E escolho o tamanho "39"
E clico no botão circular para adicionar ao Carrinho
Então posso visualizar o item "Tênis" no carrinho
E clico no botão circular de pagamento
Então vejo que meu endereço está sendo exibido
E clico em "Toque para alterar"
E clico no endereço "2"
E vejo que o endereço mudou para meu endereço selecionado
