create trigger trg_brisanje
on pomNPVeroispovest
after insert
as
begin
declare @broj int
declare @idNP int
declare @idV int
declare @idR int
select @broj=broj,@idNP=idNacionalnePripadnosti,@idV=idVeroispovesti,@idR=idRegiona
from inserted
if @broj is null
	set @broj=0
update pomNPVeroispovest
set broj=@broj
where idNacionalnePripadnosti=@idNP and idVeroispovesti=@idV and idRegiona=@idR
end
go
create trigger trg_nule
on pomNPJezik
after insert
as
begin
declare @broj int
declare @idNP int
declare @idJ int
declare @idR int
select @broj=broj,@idNP=idNacionalnaPripadnost,@idJ=idJezika,@idR=idRegiona
from inserted
if @broj is null
	set @broj=0
update pomNPJezik
set broj=@broj
where idNacionalnaPripadnost=@idNP and idJezika=@idJ and idRegiona=@idR
end
go
create trigger trg_nule2
on pomZanimanjeDelatnosti
after insert
as
begin
declare @broj int
declare @idZ int
declare @idD int
declare @idR int
select @broj=broj,@idZ=idZanimanja,@idD=idDelatnosti,@idR=idRegiona
from inserted
if @broj is null
	set @broj=0
update pomZanimanjeDelatnosti
set broj=@broj
where idZanimanja=@idZ and idDelatnosti=@idD and idRegiona=@idR
end
