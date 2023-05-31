#TESTE DO CAMILÃO
SELECT f.`NomeFunc`, sum(t.`NumHoras`)
FROM trabalha t INNER JOIN funcionario f ON f.`ID_Func` = t.`ID_Func`
GROUP BY (t.`ID_Func`);

SELECT COUNT(t.`ID_Proj`)
FROM trabalha t INNER JOIN funcionario f ON t.`ID_Func` = f.`ID_Func`
GROUP BY(t.`ID_Func`);