/*create procedure somaSalario(@nomeDep varchar(30),@somaSalario money output)
as
begin
set @somaSalario = (select sum(f.salario) 
from Funcionario f inner join Departamento d on f.idDepartamento = d.idDepartamento
where d.nomeDepartamento = @nomeDep);
end;
declare @saida money
execute somaSalario 'Pesquisa', @somaSalario = @saida output
print @saida*/


/*create procedure aumentaSalarioPorDependente (@nomeFunc varchar(50))
as
begin
declare @qtdDependentes int
set @qtdDependentes = (select count(d.idDependente) from Dependente d inner join Funcionario f on d.idFuncionario=f.idFuncionario
where nomeFuncionario like '%'+@nomeFunc+'%')

while @qtdDependentes > 0
	begin
		update Funcionario set salario = salario + 50 where nomeFuncionario like '%'+@nomeFunc+'%';
		set @qtdDependentes = @qtdDependentes - 1;
	end	
end;
execute aumentaSalarioPorDependente 'João B. Silva';
select salario from Funcionario
where nomeFuncionario like '%João B. Silva%'*/


/*create procedure maiorQtdGenero (@nomeDep varchar(50)) 
as
begin
declare @qtdF int, @qtdM int
set @qtdF = (select count(f.idFuncionario) from Funcionario f inner join Departamento d on f.idDepartamento = d.idDepartamento 
where d.nomeDepartamento like '%'+@nomeDep+'%' and f.sexo = 'F')

set @qtdM = (select count(f.idFuncionario) from Funcionario f inner join Departamento d on f.idDepartamento = d.idDepartamento 
where d.nomeDepartamento like '%'+@nomeDep+'%' and f.sexo = 'M')

if @qtdF > @qtdM
	begin
		print 'Mais funcionários do sexo F'
	end
else if @qtdF < @qtdM
	begin
		print 'Mais funcionários do sexo M'
	end
else
	print 'Mesma quantidade de todos os sexos'

end;
execute maiorQtdGenero 'Pesquisa'*/


create procedure reduzCargaHoraria(@nomeFunc varchar(50))
as
begin

declare @idFunc int
set @idFunc = (select idFuncionario from Funcionario where nomeFuncionario like '%'+@nomeFunc+'%')
update Trabalha set numHoras = numHoras * 0.95 where idFuncionario = @idFunc

end

execute reduzCargaHoraria 'Frank. T. Santos'

select * from Trabalha where idFuncionario = 12
