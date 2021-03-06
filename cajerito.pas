program cajero_automatico;


uses crt;

type

	registro = record
		cedula: integer;
		usuario: string;
		apellido: string;
		saldo: integer;
		contrasena: integer;
		movimientos: integer;
		movimientos_Dato: array[1..50] of string;
		movimientos_valor: array[1..50] of integer;
	end;




var

	base_datos: array[1..10] of registro;
	interfaz,nuevo_usa,lala,lili: boolean;
	opci,oti: string;
	i,nuevo,new_usa,valor_ingresado,control,cedula_deposi,l,R: integer;
	numer: integer;
	archivo: text;
	linea, imprimir: string; 


function FileExists(nombre: String): boolean;
var
    f: text;
begin
    assign(f,nombre);
    {$I-}
    reset(f);
    {$I+}
    if (IOResult = 0) then
    begin
        close(f);
        FileExists:=true;
    end
    else
        FileExists:=false;
end;

begin
	nuevo:= 1;
	interfaz:= false;

	Repeat

		Clrscr;
		writeln('Seleccione 1 para Registrar');
		writeln('Seleccione 2 para Consultar saldo');
		writeln('Seleccione 3 para Retiro/Deposito/Trasferencia');
		writeln('Seleccione 4 para Historial Bancario');
		writeln('Seleccione 5 para Salir');

		Readln(opci);

		case opci of

			'1': begin
					Clrscr;
					writeln('Has seleccionado Registrar');
					Readln();
					Clrscr;
					For i:= 1 to nuevo do
					begin

						if base_datos[i].cedula = 0 then
						begin

							writeln('Ingrese nombre de usuario');
							Readln(base_datos[i].usuario);
							writeln('Ingrese apellido');
							Readln(base_datos[i].apellido);
							writeln('Ingrese numero de cedula');
							Readln(base_datos[i].cedula);
							writeln('Ingrese contrasena');
							Readln(base_datos[i].contrasena);
							Clrscr;
							writeln('Bienvenido al sistema ',base_datos[i].usuario)
						end;
					end;
					writeln('');
					writeln('Deseas ingresar un nuevo usuario 1 si 0 no');
					writeln('');
					writeln('El limite es de 10 usuarios. En este momento hay registrados ',nuevo);
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
					writeln('Has seleccionado Consultar Saldo');

					writeln('Dame tu cedula');
					Readln(valor_ingresado);
					For i:= 1 to 10 do
					begin
						if base_datos[i].cedula = valor_ingresado  then
						begin
							writeln('Dame contrasena');
							Readln(valor_ingresado);
							if base_datos[i].contrasena = valor_ingresado  then
							begin
								writeln('Su monto de saldo es de: ',base_datos[i].saldo);
								Readln();
							end;
						end;
					end;
				end;

			'3':begin
					Clrscr;
					writeln('Has seleccionado la Retiro/Deposito/Transferencia');
					writeln('');
					writeln('');
					writeln('Seleccione 1 para Retiro');
					writeln('Seleccione 2 para Deposito');
					writeln('Seleccione 3 para Transferencia');
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
									if base_datos[i].contrasena = valor_ingresado  then
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
												writeln('La suma de Retiro se ha excedido');
												Readln();

											end;
											if valor_ingresado > 50000 then
											begin
												control:= 0;
												writeln('La suma de Retiro es mayor al limite');
												Readln();

											end;
											base_datos[i].saldo:= base_datos[i].saldo - valor_ingresado;
											base_datos[i].movimientos:= base_datos[i].movimientos + 1;
											
											l:= 1; 
											lala:= false;		
											Repeat
												if base_datos[i].movimientos_valor[l] = 0 then
												begin 
													base_datos[i].movimientos_Dato[l]:= ' Se ha Retirado ';
													base_datos[i].movimientos_valor[l]:= base_datos[i].movimientos_valor[l] + valor_ingresado;
													lala:= true;
												end;
												l:= l + 1 ;
											until(lala);
										until(control = 1);

									end;
								end;
							end;
							writeln('Si no pudo completar accion su usuario o contrasena no coincide');
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
									if base_datos[i].contrasena = valor_ingresado  then
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
										base_datos[i].movimientos:= base_datos[i].movimientos + 1;
										
										l:= 1; 
										lala:= false;		
										Repeat
											if base_datos[i].movimientos_valor[l] = 0 then
											begin 
												base_datos[i].movimientos_Dato[l]:= ' Se ha Depositado ';
												base_datos[i].movimientos_valor[l]:= base_datos[i].movimientos_valor[l] + valor_ingresado;
												lala:= true;
											end;
											l:= l + 1 ;
										until(lala);


									end;
								end;
							end;

								writeln('Si no pudo completar accion, su usuario o contrasena no coincide');
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
									if base_datos[i].contrasena = valor_ingresado  then
									begin
										Clrscr;

										Repeat
											
											writeln('Dame tu Transferencia');
											Readln(valor_ingresado);
											writeln('Tu Deposito es de: ',valor_ingresado);
											writeln('(1) SI (0) NO ');
											Readln(control);
										until(control = 1);
										base_datos[i].saldo:= base_datos[i].saldo - valor_ingresado;
										base_datos[i].movimientos:= base_datos[i].movimientos + 1;

										l:= 1; 
										lala:= false;		
										Repeat
											if base_datos[i].movimientos_valor[l] = 0 then
											begin 
												
												base_datos[i].movimientos_Dato[l]:= ' Se ha Transferido ';
												base_datos[i].movimientos_valor[l]:= base_datos[l].movimientos_valor[l] + valor_ingresado;
												lala:= true;
											end;
											l:= l + 1 ;
										until(lala);

										Clrscr;
										writeln('Dame el numero de la cedula del usuario a Transferir');
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

							writeln('Si no pudo completar la acci??n, su usuario o contrasena no coincide');
							Readln();

						end;

					else

					end;
				end;

			'4':begin
					Clrscr;
					writeln('Has seleccionado Historial');
					writeln('Dame tu cedula');
					Readln(valor_ingresado);
					For i:= 1 to 10 do
					begin
						if base_datos[i].cedula = valor_ingresado  then
						begin
							writeln('Dame contrasena');
							Readln(valor_ingresado);
							if base_datos[i].contrasena = valor_ingresado  then
							begin
								Clrscr;
								writeln('Tus movimientos Bancarios son: ',base_datos[i].movimientos);
								writeln('');
									l:= 1; 
									lala:= false;		
									Repeat
										if base_datos[i].movimientos_valor[l] <> 0 then
										begin 
											

											writeln(base_datos[i].movimientos_Dato[l], base_datos[i].movimientos_valor[l] );

										end else
										begin 

											lala:= true;
											Repeat
												writeln('??Desea imprimir una factura de los movimientos Bancarios y Generarlos en un archivo TXT?');
												writeln('(1) SI (0) NO ');
												Readln(control);
												if control = 1 then
												begin 

													assign(archivo, 'Factura_usuario.txt');

													if FileExists( 'Factura_usuario.txt' ) then
													begin
														writeLn('El fichero Factura_usuario.txt existe.');
														writeLn('Ya puedes Retirarla');
														Append(archivo);
													end else
													begin
														writeLn('El fichero Factura_usuario.txt no existe! creando...');

														writeLn('Ya puedes Retirarla');

														rewrite(archivo); 
													end;
														

													writeln(archivo,'Tus movimientos de datos son: ');
													writeln(archivo,' ');
													writeln(archivo,base_datos[i].movimientos);
													writeln(archivo,' ');
													R:=1;
													Repeat

														writeln(archivo,base_datos[i].movimientos_Dato[R]);
														writeLn(archivo, ' ');
														writeLn(archivo,base_datos[i].movimientos_valor[R]);
														R:= R + 1;
													until (base_datos[i].movimientos_valor[R] = 0);
													close(archivo);

													lili:= true;


												end else
												begin 


													lili:= true;

												end;
											until(lili);
										

										end;

										l:= l + 1 ;
									until(lala);
									Readln();
							end;
						end;
					end;

				end;

			'5':begin
				Clrscr;
				writeln('Has seleccionado la Salir');
				interfaz:= true;
				end;

			else

				writeln ('Opcion no valida');

			end;

	until (interfaz);

	Readln();




	End.



