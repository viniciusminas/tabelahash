Program Tabela_hash ;

const TableSize = 7;
		  A = 0.618;

type tipo_inf = string;
		 ptnodo = ^elemento;
		 elemento = record
		 		placa : tipo_inf;
		 		prox : ptnodo;
		end;
		
var tabela : array[0..(TableSize - 1)] of ptnodo;
		chave : string;
		i: integer;

procedure InicializarTabela();
var
  i: integer;
begin
  for i := 0 to TableSize - 1 do
    tabela[i] := nil;
end;


function Hash(chave : string):integer;
var soma, mult, index, float : real;
		i:integer;
begin 
	for i := 1 to TableSize do 
	begin
		soma := ord(chave[i]);      
	end;
	mult := soma * A;
	float := mult - trunc(mult);
	index := float * TableSize;
	Hash := trunc(index);	
end;

procedure BuscarPlaca();
var
  placa: string;
  posicao: integer;
  aux: ptnodo;
  encontrada: boolean;
begin
  writeln('Digite a placa que deseja buscar:');
  readln(placa);

  // Encontrar a posição na tabela hash
  posicao := Hash(placa);
  aux := tabela[posicao];
  encontrada := false;

  // Percorrer a lista nessa posição para buscar a placa
  while (aux <> nil) and not encontrada do
  begin
    if aux^.placa = placa then
      encontrada := true
    else
      aux := aux^.prox;
  end;

  if encontrada then
    writeln('Placa ', placa, ' encontrada na posição ', posicao, '.')
  else
    writeln('Placa ', placa, ' não encontrada.');
end;


procedure InserirLista (var lista:ptnodo; inf:string);
var aux, aux2,aux3:ptnodo;
		vfy : Boolean;
begin
	new (aux); 
	if aux = nil then
	begin
		writeln('Mem�ria Cheia');
		readkey;
	end
	else
	begin
		aux^.placa := inf;
		if lista = nil then  {Primeiro elemento adicionado}                       
		begin
			aux^.prox := lista;
			lista := aux;                    
		end
		else
		begin
			aux2 := lista;
			aux3 := lista;
			vfy := True; 
			writeln(aux^.placa, ' ', aux3^.placa);
			if aux^.placa <= lista^.placa then
			begin
				lista := aux;        
				lista^.prox := aux3     
			end
			else 
			begin
				while (aux^.placa > aux3^.placa) and (aux3^.prox <> nil)do
				begin
					aux2 := aux3;
					aux3 := aux3^.prox;
				end;
				if (aux3^.prox = nil) and (aux^.placa > aux3^.placa) then
				begin
					aux3^.prox := aux;
					aux^.prox := nil;
				end
				else
				begin
					aux2^.prox := aux;
					aux^.prox := aux3;
				end;
			end;	
		end;	
	end;
end;

Function Conta_Elementos (pilha:ptnodo):byte;
var aux:ptnodo;
    i:byte;
Begin
   if pilha=nil then
      i:=0
   else
      Begin
         i:=0;
         aux:=pilha;
         while aux <> nil do
         begin
            i:=i+1;
            writeln(i,' - ',aux^.placa);
            aux:=aux^.prox;
         end;
      End;
   Conta_elementos:=i
End;


procedure RemoverLista (var lista:ptnodo);
var aux,aux2:ptnodo;
		cid, i : word;
begin
	if lista = nil then begin
		writeln('Lista Vazia');
		readkey;
	end
	else
		begin
			writeln('Digite a posicao da placa que deseja remover');
			write('>>>');
			read(cid);
			cid := cid - 1;
			aux := lista;
			aux2 := lista;
			if cid = 0 then
			begin
				lista := aux^.prox;
				dispose (aux);
			end
			else
			begin				
				for i := 1 to cid do
				begin
					aux := aux2;      
					aux2 := aux2^.prox
				end;
				aux^.prox := aux2^.prox;
				dispose (aux2);
			end;			
		end
end;

procedure RemoverPlaca();
var
  placa: string;
  posicao: integer;
begin
  writeln('Digite a placa a ser removida:');
  readln(placa);

 
  posicao := Hash(placa);//tentar encontrar a posicao na hash

  if tabela[posicao] <> nil then //verificar se a lista existe nessa pos, e ai remove
  begin
    RemoverLista(tabela[posicao]);
    writeln('Placa ', placa, ' removida com sucesso!');
  end
  else
    writeln('Não há nenhuma placa nesta posição da tabela hash.');
end;


procedure InserirPlaca(chave: string);
var
  novaPlaca: ptnodo;
  index: integer;
begin
  index := Hash(chave);
	InserirLista(tabela[index], chave);
end;

procedure MostrarTabela();
var
  i: integer;
  aux: ptnodo;
begin
  writeln('Tabela Hash:');
  for i := 0 to TableSize - 1 do
  begin
    write('Posição ', i, ': ');
    aux := tabela[i];
    if aux = nil then
      writeln('Vazia')
    else
    begin
      while aux <> nil do
      begin
        write(aux^.placa, ' -> ');
        aux := aux^.prox;
      end;
      writeln('nil');
    end;
  end;
end;

procedure ExibirMenu;
begin
  writeln('0 - Sair');
  writeln('1 - Inserir Placa');
  writeln('2 - Remover Placa');
  writeln('3 - Buscar Placa');
  writeln('4 - Exibir Tabela Hash');
  writeln('5 - Contar elementos em cada posição da tabela');
end;

var
  opcao: integer;
  placa: string;

begin
  InicializarTabela();
  opcao := -1;

  while opcao <> 0 do
  begin
    clrscr;
    ExibirMenu;
    readln(opcao);
    clrscr;

    case opcao of
      1: begin
           writeln('Digite a placa a ser inserida:');
           readln(placa);
           InserirLista(tabela[Hash(placa)], placa);
           writeln('Placa ', placa, ' inserida com sucesso!');
         end;

      2: begin
           RemoverPlaca();
         end;

      3: begin
           BuscarPlaca();
         end;

      4: begin
           writeln('Exibindo Tabela Hash:');
           MostrarTabela();
         end;

      5: begin
           writeln('Contando elementos em cada posição da tabela hash:');
           for i := 0 to TableSize - 1 do
           begin
             write('Posição ', i, ': ');
             writeln(Conta_Elementos(tabela[i]), ' elementos.');
           end;
         end;

      0: writeln('Saindo do programa...');

      else
        writeln('Opção inválida! Tente novamente.');
    end;

    writeln('Pressione qualquer tecla para continuar...');
    readkey;
  end;

  writeln('Programa encerrado!');
end.
