Program Tabela_hash ;

const TableSize = 7;
		  A = 0.618;

type Lista = record
			placa : string;
			prox : ^Lista;
		end;
		
		HashTable = array[0.. TableSize -1] of ^Lista;
		
var tabela : HashTable;
		chave : string;

procedure InicializarTabela();
begin
end;

function Hash(chave : string):integer;
var soma, mult, index, float : real;
		i:integer;
begin 
	for i := 1 to TableSize do 
	begin
		soma := ord(chave[i]) * i;      
	end;
	mult := soma * A;
	float := mult - trunc(mult);
	index := float * TableSize;
	Hash := trunc(index);	
end;

procedure InserirPlaca();
begin
end;

procedure RemoverPlaca();
begin
end;

procedure BuscarPlaca();
begin
end;

procedure InserirNaTabela(chave : string);
begin;
	index := Hash(chave);
	InserirLista(tabela[index]);
end;

procedure InserirLista();
begin
end;

procedure DestruirLista();
begin
end;

procedure MostrarTabela();
begin
end;

Begin
chave := 'TYE5A48';
writeln('Posição: ', Hash(chave));
End.
