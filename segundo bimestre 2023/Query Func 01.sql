--1
/*create function subEspec(@nomeEsp varchar(50))
returns int
begin
	declare @contagem int
	set @contagem = (select count(e.codEspecializacao) from Especializacao e left join Especializacao eg
	on e.codEspecializacao = eg.codEspecializacaoGenerica where e.nome = @nomeEsp)
	return @contagem
end

select dbo.subEspec('Clinico Geral')*/


--2

/*create procedure subEspecProcedure(@nomeEsp varchar(50), @saida int output) as
begin
	set @saida = (select count(e.codEspecializacao) from Especializacao e left join Especializacao eg
	on e.codEspecializacao = eg.codEspecializacaoGenerica where e.nome = @nomeEsp)
end

	declare @result int
	execute subEspecProcedure 'Clinico Geral', @saida = @result output
	print @result*/



--3
/*create function medSalarioClinica(@nomeClinica varchar(50))
returns money
begin
	declare @media money
	set @media = (select avg(salario) from ClinicaMedico cm inner join Clinica c on cm.codClinica = c.codClinica
	where c.nomeClinica = @nomeClinica)
	return @media
end

select dbo.medSalarioClinica('Clinica A')*/



--4
/*create procedure medSalarioClinicaProc(@nomeClinica varchar(50),@saida money output)
as
begin
	set @saida = (select avg(salario) from ClinicaMedico cm inner join Clinica c on cm.codClinica = c.codClinica
	where c.nomeClinica = @nomeClinica)
end


declare @result money
execute medSalarioClinicaProc 'Clinica A', @saida = @result output
print @result*/



--5
/*create function menorSalarioFun(@nomeMedico varchar(50))
returns varchar(50)
begin
	declare @saida varchar(50)
	set @saida = (select top 1 c.nomeClinica from Medico m inner join ClinicaMedico cm on m.codMedico = cm.codMedico 
inner join Clinica c on cm.codClinica = c.codClinica where cm.salario = (select min(salario) 
from Medico m inner join ClinicaMedico cm on m.codMedico = cm.codMedico 
where m.nomeMedico = @nomeMedico))
	return @saida
end

print dbo.menorSalarioFun('Ana Maria Silva')*/



--6
/*create function classAreaEsp(@nomeEspecializacao varchar(50))
returns varchar(50)
begin
	declare @numeroMedicos int
	declare @classEsp varchar(50)
	set @numeroMedicos = (select count(codMedico) from Medico m inner join Especializacao e 
	on m.codEspecializacao = e.codEspecializacao
	where e.nome = @nomeEspecializacao)

	if (@numeroMedicos<4)
		set @classEsp = 'CARENTE'
	else if (@numeroMedicos <8)
		set @classEsp = 'NORMAL'
	else
		set @classEsp = 'SATURADA'
	return @classEsp
end

print dbo.classAreaEsp('Clinico Geral')*/


--desafio
create function idadeMedico(@nomeMedico varchar(50))
returns int
begin
	declare @idade int
	declare @mes int
	declare @dia int
	declare @dataNasc date
	set @dataNasc = (select dataNascimento from Medico where nomeMedico = @nomeMedico)
	set @idade = DATEDIFF(year, @dataNasc, CONVERT(date, getdate()))
	set @mes = DATEDIFF(month, @dataNasc, CONVERT(date, getdate()))
	set @dia =  DATEDIFF(year, @dataNasc, CONVERT(date, getdate()))
	
	if @mes>0
		return @idade-1
	else if @mes=0
			if @dia<=0
				return @idade

	return @idade
end
print dbo.idadeMedico('Ana Maria Silva')		


