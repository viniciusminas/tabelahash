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

procedure RemoverPlaca();
begin
end;

procedure BuscarPlaca();
begin
end;

procedure InserirLista (var lista:ptnodo; inf:string);
var aux, aux2,aux3:ptnodo;
		vfy : Boolean;
begin
	new (aux); 
	if aux = nil then
	begin
		writeln('Memória Cheia');
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
		writeln('Lista Fazia');
		readkey;
	end
	else
		begin
			writeln('Digitite a posição da placa que desejás remover');
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


procedure InserirPlaca(chave: string);
var
  novaPlaca: ptnodo;
  index: integer;
begin
  index := Hash(chave);
	InserirLista(tabela[index], chave);
end;

procedure MostrarTabela();
begin
end;

procedure CasoDeTesteEx();
begin

InserirPlaca('BTR6H21');
InserirPlaca('SXY4D23');
InserirPlaca('FRP7G33');
InserirPlaca('MKT8J11');
InserirPlaca('WEX3R19');
InserirPlaca('LSA9P99');
InserirPlaca('CVY2Z34');
InserirPlaca('QLA7K89');
InserirPlaca('TJU5L02');
InserirPlaca('RXI3H87');
InserirPlaca('GEO8Q66');
InserirPlaca('KMP9A22');
InserirPlaca('ZON1W44');
InserirPlaca('DVL6F50');
InserirPlaca('NPJ2R21');
InserirPlaca('HSU7T81');
InserirPlaca('EYA4N33');
InserirPlaca('OIE6C67');
InserirPlaca('VBA2J88');
InserirPlaca('FIM8M54');
InserirPlaca('YWR5L12');
InserirPlaca('UQL3Z79');
InserirPlaca('SKD7X20');
InserirPlaca('AFH9D45');
InserirPlaca('MPW1G68');
InserirPlaca('ZYL2V31');
InserirPlaca('LNK8T77');
InserirPlaca('QJF3P46');
InserirPlaca('BOV6K13');
InserirPlaca('XTP5C82');
InserirPlaca('DRZ7W23');
InserirPlaca('EVU9H99');
InserirPlaca('MYC1N65');
InserirPlaca('PWE3L34');
InserirPlaca('RCX8Q10');
InserirPlaca('ZWG6F44');
InserirPlaca('TAY2J97');
InserirPlaca('IGN9A55');
InserirPlaca('VSO4T29');
InserirPlaca('XBC7R88');
InserirPlaca('ELM5Z11');
InserirPlaca('OYI3H56');
InserirPlaca('KRD8X22');
InserirPlaca('BMQ6V31');
InserirPlaca('SLA1C45');
InserirPlaca('FVY7D78');
InserirPlaca('NHE9G64');
InserirPlaca('JWL4M12');
InserirPlaca('CTP3Q99');
InserirPlaca('USX8P33');
InserirPlaca('ZFE2L45');
InserirPlaca('WKD9W66');
InserirPlaca('VRN7R21');
InserirPlaca('LOJ5K87');
InserirPlaca('PEI1X54');
InserirPlaca('XGA6H33');
InserirPlaca('MVR3A67');
InserirPlaca('QZS9T20');
InserirPlaca('ABY4D23');
InserirPlaca('EJK2M77');
InserirPlaca('GNF8L46');
InserirPlaca('HOP7C11');
InserirPlaca('RXL5P99');
InserirPlaca('WTU3G66');
InserirPlaca('VIB9Z34');
InserirPlaca('CSN1Q12');
InserirPlaca('ZKY4W23');
InserirPlaca('FLR6J87');
InserirPlaca('PXO2N79');
InserirPlaca('MHT9A55');
InserirPlaca('SUY3T33');
InserirPlaca('OCL5D44');
InserirPlaca('KVE8X12');
InserirPlaca('DWA1L66');
InserirPlaca('GJR7P11');
InserirPlaca('LQY9H21');
InserirPlaca('ZVB2K88');
InserirPlaca('WMI6F29');
InserirPlaca('UXE4Q22');
InserirPlaca('SNP8G99');
InserirPlaca('AJZ1R79');
InserirPlaca('EUI5Z11');
InserirPlaca('FLH3M54');
InserirPlaca('QOB7V33');
InserirPlaca('YRK2J97');
InserirPlaca('VDS9X64');
InserirPlaca('NTG6D12');
InserirPlaca('OWI4H45');
InserirPlaca('JMF3C10');
InserirPlaca('PLB7W88');
InserirPlaca('SKO9R31');
InserirPlaca('BHE5P23');
InserirPlaca('DRC8L65');
InserirPlaca('FWY2K22');
InserirPlaca('MPZ1N46');
InserirPlaca('TKU4G33');
InserirPlaca('ZIX9T99');
InserirPlaca('UVE7D55');
InserirPlaca('RLO3M22');
InserirPlaca('YSK6Q11');
InserirPlaca('CDJ5A44');
InserirPlaca('HXN8V31');
InserirPlaca('JWR9X78');
InserirPlaca('VLB2R12');
InserirPlaca('OPY7L65');
InserirPlaca('QFU1Z33');
InserirPlaca('AXL3V22');
InserirPlaca('EPN5R88');
InserirPlaca('WFD7C11');
InserirPlaca('UQY9G66');
InserirPlaca('ZKI1H45');
InserirPlaca('SYL4D78');
InserirPlaca('GTR8J99');
InserirPlaca('MZO6T34');
InserirPlaca('LVX2P54');
InserirPlaca('JAY9L87');
InserirPlaca('QFB3N65');
InserirPlaca('WCU8K23');
InserirPlaca('RYO1X99');
InserirPlaca('KZP7M11');
InserirPlaca('DLH5F44');
InserirPlaca('TEV2Q12');
InserirPlaca('OXA6R21');
InserirPlaca('CMJ9W88');
InserirPlaca('BNL3T56');
InserirPlaca('HVS1D31');
InserirPlaca('IVY4Z20');
InserirPlaca('PUN7C77');
InserirPlaca('EQF2J45');
InserirPlaca('WBR8G12');
InserirPlaca('YZA5H79');
InserirPlaca('SLM6K66');
InserirPlaca('PVE9A33');
InserirPlaca('ZWT3X88');
InserirPlaca('TGO4L11');
InserirPlaca('FRY2P23');
InserirPlaca('JNE1Q67');
InserirPlaca('MXA9R54');
InserirPlaca('OGD6W99');
InserirPlaca('CUB5M45');
InserirPlaca('VPZ7V22');
InserirPlaca('RIF8D10');
InserirPlaca('LHY3N78');
InserirPlaca('ADX9C66');
InserirPlaca('ZEP1T12');
InserirPlaca('KWY4G33');
InserirPlaca('JUR6H20');
InserirPlaca('XBM7K55');
InserirPlaca('NFV2J88');
InserirPlaca('SHL5Z34');
InserirPlaca('PIW3P11');
InserirPlaca('VXY8F23');
InserirPlaca('GKD9W56');
InserirPlaca('QZA1A99');
InserirPlaca('MUL4L21');
InserirPlaca('EPX7X77');
InserirPlaca('YCG2Q65');
InserirPlaca('OKJ6R45');
InserirPlaca('BWD8D12');
InserirPlaca('TSH1G44');
InserirPlaca('ZLK5K99');
InserirPlaca('VYE3C31');
InserirPlaca('FWR9M20');
InserirPlaca('PTO6H78');
InserirPlaca('XYJ2A88');
InserirPlaca('DRN5L45');
InserirPlaca('UQV8P66');
InserirPlaca('AFK1Z10');
InserirPlaca('JMO7X23');
InserirPlaca('NRG9J12');
InserirPlaca('LBS4F11');
InserirPlaca('EQA2V44');
InserirPlaca('OTW8Q31');
InserirPlaca('IKP5R22');
InserirPlaca('ZUN7T55');
InserirPlaca('WMI3C99');
InserirPlaca('FPX9G45');
InserirPlaca('AQD2K88');
InserirPlaca('MBL6A20');
InserirPlaca('HZO4H11');
InserirPlaca('JKY1P33');
InserirPlaca('VTD8N99');
InserirPlaca('LEX3L12');
InserirPlaca('SYR7D34');
InserirPlaca('CWM2M66');
InserirPlaca('QHF9W21');
InserirPlaca('EPY5T77');
InserirPlaca('XOA6Z54');
InserirPlaca('BTR3J88');
InserirPlaca('IVK7Q65');
InserirPlaca('RNS9G99');
InserirPlaca('DLP1R12');
InserirPlaca('WEO5K66');
InserirPlaca('TYZ4A33');
InserirPlaca('FUC2P21');
InserirPlaca('JIM8L45');
InserirPlaca('KYE7X78');
InserirPlaca('LVQ9N88');
InserirPlaca('SRZ3M99');
InserirPlaca('HXT1D20');
InserirPlaca('PGV4H34');
InserirPlaca('YJL5K77');
InserirPlaca('ZWF2C56');
InserirPlaca('QXA9J99');
InserirPlaca('MYS3V66');
InserirPlaca('URN8F12');
InserirPlaca('EDL1T11');
InserirPlaca('WZH7P23');
InserirPlaca('BFI5G88');
InserirPlaca('OXP2R31');
InserirPlaca('CSV9W20');
InserirPlaca('ABN6K45');
InserirPlaca('JPL4X54');
InserirPlaca('ZEQ7Z34');
InserirPlaca('KWL1L99');
InserirPlaca('YCO8D12');
InserirPlaca('FSX3M66');
InserirPlaca('PIO2T88');
InserirPlaca('LZV4A22');
InserirPlaca('CMN9H45');
InserirPlaca('TWJ6R11');
InserirPlaca('EXY5P99');
InserirPlaca('QKH3G56');
InserirPlaca('VMZ7C21');
InserirPlaca('DGB2Q34');
InserirPlaca('UYP9N66');
InserirPlaca('SWF8X88');
InserirPlaca('RVK1J10');
InserirPlaca('LOA6V77');
InserirPlaca('MJI4L45');
InserirPlaca('KPT7D31');
InserirPlaca('WQO9K12');
InserirPlaca('BRF2G33');
InserirPlaca('XYZ5C20');
InserirPlaca('EVN8Q54');
InserirPlaca('PHM3R88');
InserirPlaca('ZAJ6H23');
InserirPlaca('YKU7M99');
InserirPlaca('OLF4A66');
InserirPlaca('IWN1X11');
InserirPlaca('CVT9P77');
InserirPlaca('FRD5Z22');
InserirPlaca('SYN3J45');
InserirPlaca('BGX7G20');
InserirPlaca('TLA2W33');
InserirPlaca('JOF1N54');
InserirPlaca('WMB6R12');
InserirPlaca('EDU8X88');
InserirPlaca('QKL9L66');
InserirPlaca('VRY3K99');
InserirPlaca('SZJ5A11');
InserirPlaca('HNQ2P23');
InserirPlaca('FIG6C78');
InserirPlaca('JVT8D54');
InserirPlaca('MZW1H44');
InserirPlaca('OSX4T33');
InserirPlaca('YPE9G12');
InserirPlaca('URK5F77');
InserirPlaca('DLB2Z56');
InserirPlaca('XQM3V99');
InserirPlaca('PKY6L21');
InserirPlaca('ACN7P88');
InserirPlaca('FWU1J45');
InserirPlaca('TEZ8M20');
InserirPlaca('BHA5X66');
InserirPlaca('ZUR4Q99');
InserirPlaca('GOP2A33');
InserirPlaca('LXI3C10');
InserirPlaca('YNE9W54');
InserirPlaca('QTL7K12');
InserirPlaca('EVY6D99');
InserirPlaca('MFC1H34');
InserirPlaca('JVG5G66');
InserirPlaca('SXT8N88');
InserirPlaca('UOB9L21');
InserirPlaca('HWR7T45');
InserirPlaca('PEK4V77');
InserirPlaca('KXM6F22');
InserirPlaca('ZIQ5Z54');
InserirPlaca('VAW3P99');
InserirPlaca('DRC2M66');
InserirPlaca('XLN9A12');
InserirPlaca('SBY7X34');
InserirPlaca('WFO6K88');
InserirPlaca('PJT1J10');
InserirPlaca('BQU4G45');
InserirPlaca('NWE8H20');
InserirPlaca('YVI3C99');
InserirPlaca('GVX9L22');
InserirPlaca('QRO2D12');
InserirPlaca('TMW7T66');
InserirPlaca('EDY5Q21');
InserirPlaca('BHN3R88');
InserirPlaca('JSI1W44');
InserirPlaca('LRD9G23');
InserirPlaca('PKT6F77');
InserirPlaca('XUV4N99');
InserirPlaca('HME7P33');
InserirPlaca('DBL5A10');
InserirPlaca('UJQ3K56');
InserirPlaca('QAW2V88');
InserirPlaca('OFY9C21');
InserirPlaca('SRM8J66');
InserirPlaca('YEK1D99');
InserirPlaca('LTN4Q34');
InserirPlaca('ZPR7L88');
InserirPlaca('WHF3X20');
InserirPlaca('EUO6H22');
InserirPlaca('NGV9M45');
InserirPlaca('BPL1G88');
InserirPlaca('IXT7T77');
InserirPlaca('JDN5W54');
InserirPlaca('VEK2N66');
InserirPlaca('QMX8C12');
InserirPlaca('HYJ4P33');
InserirPlaca('TCF9R99');
InserirPlaca('ZIB6D45');
InserirPlaca('PKU3F88');
InserirPlaca('RJY7L10');
InserirPlaca('XHQ5Z23');
InserirPlaca('AUO1H66');
InserirPlaca('EWK8K11');
InserirPlaca('VYZ4A44');
InserirPlaca('NLS3T99');
InserirPlaca('OGR6J20');
InserirPlaca('MCQ9X12');
InserirPlaca('WFA7G56');
InserirPlaca('DLJ5R45');
InserirPlaca('HXU2W99');
InserirPlaca('JKY8C22');
InserirPlaca('PNB1L88');
InserirPlaca('TXE9Q31');
InserirPlaca('SUH4K54');
InserirPlaca('VLF6P77');
InserirPlaca('EZJ3N21');
InserirPlaca('CYW8D99');
InserirPlaca('RAQ5X66');
InserirPlaca('OBK2T34');
InserirPlaca('WMV7H10');
InserirPlaca('ZUL9A88');
InserirPlaca('XFS4J22');
InserirPlaca('BVT3Z21');
InserirPlaca('GWN5G66');
InserirPlaca('PNX8K33');
InserirPlaca('TRJ6L45');
InserirPlaca('MSY2C99');
InserirPlaca('ELQ1W12');
InserirPlaca('XYN7M54');
InserirPlaca('QOF9D22');
InserirPlaca('SLK4T99');
InserirPlaca('HIZ3A88');
InserirPlaca('OKY5R44');
InserirPlaca('JBV8X12');
InserirPlaca('ZGL9P66');
InserirPlaca('FRD1J33');
InserirPlaca('MCW6V20');
InserirPlaca('EUL3F21');
InserirPlaca('PZN7H77');
InserirPlaca('JKX2K11');
InserirPlaca('UTM8D54');
InserirPlaca('NLP1Q88');
InserirPlaca('GWK4R66');
InserirPlaca('CYO9L31');
InserirPlaca('XUH5N23');
InserirPlaca('OBM7Z12');
InserirPlaca('FLJ6G99');
InserirPlaca('SVT3P11');
end;

Begin

CasoDeTesteEx();

for i := 0 to TableSize - 1 do
begin;
	WRITELN;
	write(Conta_Elementos(tabela[i]));
end;
writeln;
End.