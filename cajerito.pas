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
	opci,oti: string;
	i,nuevo,new_usa,valor_ingresado,control,cedula_deposi,l: integer;
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
					writeln('');
					writeln('');
					writeln('Selecione 1 para Retiro');
					writeln('Selecione 2 para Deposito');
					writeln('Selecione 3 para Trasferencia');
					Readln(oti);
					case oti of
					'1':begin
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
										Clrscr;
										writeln('Los Valores estan delimitados por las siguientes sumas:');
										writeln('1.000');
										writeln('2.000');
										writeln('10.000');
										writeln('20.000');
										writeln('50.000');

										Repeat
											writeln('Dame tu Retiro');
											Readln(valor_ingresado);
											writeln('Tu Retiro es de: ',valor_ingresado);
											writeln('1 SI 0 NO ');
											Readln(control);
											if valor_ingresado > base_datos[i].saldo then
											begin
												control:= 0;
												writeln('La suma de Retiro se ha exedido');
												Readln();

											end;
											if valor_ingresado > 50000 then
											begin
												control:= 0;
												writeln('La suma de Retiro es mayor al limite');
												Readln();

											end;
											base_datos[i].saldo:= base_datos[i].saldo - valor_ingresado;
										until(control = 1);

									end;
								end;
							end;
							writeln('Si no pudo completar accion su usuario o contasena no coincide');
							Readln();
							
						end;

					'2':begin 
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
										Clrscr;

										Repeat
											
											writeln('Dame tu Deposito');
											Readln(valor_ingresado);
											writeln('Tu Deposito es de: ',valor_ingresado);
											writeln('(1) SI (0) NO ');
											Readln(control);
										until(control = 1);
										base_datos[i].saldo:= base_datos[i].saldo + valor_ingresado;

									end;
								end;
							end;

								writeln('Si no pudo completar accion su usuario o contasena no coincide');
								Readln();

						end;
					'3':begin 
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
										Clrscr;

										Repeat
											
											writeln('Dame tu Trasferencia');
											Readln(valor_ingresado);
											writeln('Tu Deposito es de: ',valor_ingresado);
											writeln('(1) SI (0) NO ');
											Readln(control);
										until(control = 1);
										base_datos[i].saldo:= base_datos[i].saldo - valor_ingresado;
										Clrscr;
										writeln('Dame el numero de la cedula del usuario a Trasferir');
										Readln(cedula_deposi);
										For l:= 1 to 10 do 
										begin 
											if base_datos[l].cedula = cedula_deposi then
											begin 

												base_datos[l].saldo:= base_datos[l].saldo + valor_ingresado;


											end;

										end;


									end;
								end;
							end;

							writeln('Si no pudo completar accion su usuario o contasena no coincide');
							Readln();

						end;

					else

					end;
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



