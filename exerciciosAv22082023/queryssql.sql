-- Active: 1692744056625@@127.0.0.1@3306@aulinha
-- Active: 1692744056625@@127.0.0.1@3306@aulinha
#exercicio 1
UPDATE cardapio
SET nome = "frango com arroz"
WHERE nome = 'frango';

UPDATE cliente
set cpf = '123.123.123'
WHERE cpf = '111.222.333';

UPDATE endereco
set bairro = 'Rosário'
WHERE bairro = 'Milagres';

#Exercício 2
DELETE 
FROM cardapio
WHERE nome = 'frango com arroz';

DELETE FROM pedido WHERE `idCliente`=2;

DELETE FROM endereco WHERE bairro='Rosário';

#Exercício 3
#a
SELECT p.idpedido,p.`dataPedido`,p.`formaEntrega`,p.`valorTotal`,c.nome#,cc.nome,cc.descricao,t.descricao
from pedido p inner join cliente c on p.`idCliente` = c.idcliente# INNER JOIN item_pedido i 
#p.idpedido = i.`idPedido` INNER JOIN cardapio cc ON i.`idCardapio` = cc.idcardapio 
#INNER JOIN tamanho t on i.`idTam`=t.`codTamanho`
;
#c
SELECT c.nome,c.descricao
FROM cardapio c
WHERE c.idcardapio NOT IN
(SELECT c.idcardapio
FROM item_pedido i inner join pedido p on i.`idPedido` = p.idpedido 
INNER JOIN cardapio c on i.`idCardapio` = c.idcardapio
WHERE p.`dataPedido` = '2022-08-15');