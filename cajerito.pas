program cajero_automata;

uses crt;

type

	registro = record
		cedula: integer;
		usuario: string;
		apellido: string;
		saldo: integer;
		contasena: integer;
		movimientos: integer;
	end;




var

	base_datos: array[1..10] of registro;
	interfaz,nuevo_usa,new_usa: boolean;
	opci: string;
begin
	interfaz:= false;
	Clrscr;
	writeln('Selecione 1 para Registrar');
	writeln('Selecione 2 para Consultar saldo');
	writeln('Selecione 3 para Retiro/Deposito/Trasferencia');
	writeln('Selecione 4 para Hitorial Bancario');
	writeln('Selecione 5 para Salir');


	Repeat 


	Readln(opci);

	case opci of

		'1': begin
			Clrscr;
			writeln('Has selecionado la Registrar');
			end;

		'2':begin

			Clrscr;
			writeln('Has selecionado la Consultar saldo');
			end;

		'3':begin
			Clrscr;
			writeln('Has selecionado la Retiro/Deposito/Trasferencia');
			end;

		'4':begin
			Clrscr;
			writeln('Has selecionado la Hitorial');
			end;

		'5':begin
			Clrscr;
			writeln('Has selecionado la Salir');
			interfaz:= true;
			end;

		else

			writeln ('Opcion no valida');

	end;

	until (interfaz);

	Readln()




	End.



