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
	interfaz,nuevo_usa: boolean;
	opci: string;
	i,nuevo,new_usa,valor_ingresado: integer;
begin
	nuevo:= 1;
	interfaz:= false;


	Repeat


	Clrscr;
	writeln('Selecione 1 para Registrar');
	writeln('Selecione 2 para Consultar saldo');
	writeln('Selecione 3 para Retiro/Deposito/Trasferencia');
	writeln('Selecione 4 para Hitorial Bancario');
	writeln('Selecione 5 para Salir');

	Readln(opci);

	case opci of

		'1': begin
				Clrscr;
				writeln('Has selecionado la Registrar');
				Readln();
				Clrscr;
				For i:= 1 to nuevo do
				begin

					if base_datos[i].cedula = 0 then
					begin

						writeln('Dame nombre de usuario');
						Readln(base_datos[i].usuario);
						writeln('Dame nombre de apellido');
						Readln(base_datos[i].apellido);
						writeln('Dame nombre de cedula');
						Readln(base_datos[i].cedula);
						writeln('Dame nombre de contasena');
						Readln(base_datos[i].contasena);
						Clrscr;
						writeln('Bienvenido al sistema ',base_datos[i].usuario)
					end;
				end;
				writeln('');
				writeln('Deses ingresar un nuevo usuario 1 si 0 no');
				writeln('');
				writeln('El limite es 10 usuario en este momento hay registrados ',nuevo);
				writeln('');
				Readln(new_usa);
				writeln('');
				writeln('Vuelve a usar la Opcion Registrar si tu Opcion es 1');
				Readln();
				if new_usa = 1  then
				begin
					nuevo:= nuevo + 1;
					if nuevo = 10 then
					begin
						nuevo:= nuevo - 1
					end;
				end;
			end;
		'2':begin

				Clrscr;
				writeln('Has selecionado la Consultar saldo');

				writeln('Dame tu cedula');
				Readln(valor_ingresado);
				For i:= 1 to 10 do
				begin
					if base_datos[i].cedula = valor_ingresado  then
					begin
						writeln('Dame contrasena');
						Readln(valor_ingresado);
						if base_datos[i].contasena = valor_ingresado  then
						begin
							writeln('Su monto de saldo es de: ',base_datos[i].saldo);
							Readln();
						end;
					end;
				end;
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

	Readln();




	End.



