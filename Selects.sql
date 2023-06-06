SELECT c.nome AS nome_cliente, a.nome AS nome_app, p.pergunta, r.resposta
FROM cliente c
JOIN respostas r ON c.id_Cliente = r.id_Cliente
JOIN perguntas p ON r.id_Pergunta = p.id_Pergunta
JOIN app a ON p.id_App = a.id_App
WHERE a.nome = 'Free Fire'
AND c.nome = 'João Lucas Lourenço';


SELECT c.nome AS nome_cliente, a.nome AS nome_app, p.pergunta, r.resposta
FROM cliente c
JOIN respostas r ON c.id_Cliente = r.id_Cliente
JOIN perguntas p ON r.id_Pergunta = p.id_Pergunta
JOIN app a ON p.id_App = a.id_App
WHERE a.nome = 'YouTube'
AND c.nome = 'Felipe Leal';


SELECT c.nome AS nome_cliente, a.nome AS nome_app, p.pergunta, r.resposta
FROM cliente c
JOIN respostas r ON c.id_Cliente = r.id_Cliente
JOIN perguntas p ON r.id_Pergunta = p.id_Pergunta
JOIN app a ON p.id_App = a.id_App
WHERE a.nome = 'Minecraft'
AND c.nome = 'Alexandre Gomes Vieira';


SELECT c.nome AS nome_cliente, a.nome AS nome_app, p.pergunta, r.resposta
FROM cliente c
JOIN respostas r ON c.id_Cliente = r.id_Cliente
JOIN perguntas p ON r.id_Pergunta = p.id_Pergunta
JOIN app a ON p.id_App = a.id_App
WHERE a.nome = 'Stumble Guys'
AND c.nome = 'Pedro Henrique';


SELECT c.nome AS nome_cliente, a.nome AS nome_app, p.pergunta, r.resposta
FROM cliente c
JOIN respostas r ON c.id_Cliente = r.id_Cliente
JOIN perguntas p ON r.id_Pergunta = p.id_Pergunta
JOIN app a ON p.id_App = a.id_App
WHERE a.nome = 'TikTok'
AND c.nome = 'Lívia Fernanda';