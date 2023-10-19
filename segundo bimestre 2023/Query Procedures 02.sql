--1
/*CREATE VIEW EspecializacaoView 
AS
SELECT
    E1.codEspecializacao AS codEspecializacao,
    E1.nome AS Especializacao,
    E2.nome AS EspecializacaoGenerica
FROM
    Especializacao AS E1
LEFT JOIN
    Especializacao AS E2
ON
    E1.codEspecializacaoGenerica = E2.codEspecializacao;

select codEspecializacao, Especializacao, EspecializacaoGenerica from EspecializacaoView */


/*CREATE VIEW EspecializacaoMedicosView AS
SELECT
    E.nome AS Especializacao,
    COUNT(M.codMedico) AS NumeroDeMedicos
FROM
    Especializacao AS E
LEFT JOIN
    Medico AS M
ON
    E.codEspecializacao = M.codEspecializacao
GROUP BY
    E.nome;

SELECT TOP 1
    Especializacao
FROM
    EspecializacaoMedicosView
ORDER BY
    NumeroDeMedicos DESC;*/

/*create procedure maiorSalario (@nomeMedico varchar(100), @nomeClinica varchar(100) output) as
begin
set @nomeClinica = (select top 1 c.nomeClinica from Medico m inner join ClinicaMedico cm on m.codMedico = cm.codMedico 
inner join Clinica c on cm.codClinica = c.codClinica where cm.salario = (select max(salario) 
from Medico m inner join ClinicaMedico cm on m.codMedico = cm.codMedico 
where m.nomeMedico like '%'+@nomeMedico+'%'))
end

DECLARE @OutputClinicaName varchar(100)
EXEC maiorSalario'Ana Maria Silva', @OutputClinicaName OUTPUT
PRINT @OutputClinicaName */

create procedure classificacaoAreaDeEspecializacao @nomeEsp varchar(100), @classEsp varchar(10) output
as
begin
declare @numeroMedicos int
set @numeroMedicos = (select count(codMedico) from Medico m inner join Especializacao e 
on m.codEspecializacao = e.codEspecializacao
where e.nome like '%'+@nomeEsp+'%')
if (@numeroMedicos<4)
	set @classEsp = 'CARENTE'
else if (@numeroMedicos <8)
	set @classEsp = 'NORMAL'
else
	set @classEsp = 'SATURADA'
end

declare @classEspe varchar(10)
exec classificacaoAreaDeEspecializacao 'Cardiologia', @classEspe output
print @classEspe







