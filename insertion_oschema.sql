	INSERT INTO Clients (Fname, Minit, Lname, CPF, Addresss)
						VALUES ('Pedro', 'C', 'Oliveira', 21546794621, 'Praça da Liberdade, 789'),
						('Ana', 'D', 'Ferreira', 21524637211, 'Rua do Comércio, 987'),
						('José', 'E', 'Pereira', 54679461523, 'Rua das Palmeiras, 456'),
						('Mariana', 'F', 'Gomes', 56333255478, 'Avenida Central, 852'),
						('Carlos', 'G', 'Ribeiro', 12544122368, 'Praça da República, 159'),
						('Paula', 'H', 'Sousa', 12354789654, 'Rua dos Pinheiros, 753'),
						('Ricardo', 'I', 'Martins', 32233321522, 'Avenida dos Girassóis, 357'),
						('Fernanda', 'J', 'Almeida', 12547741225, 'Rua da Praia, 852'),
						('Roberto', 'K', 'Fernandes', 32145685214, 'Avenida das Flores, 456'),
						 ('Isabela', 'L', 'Dias', 12552255254, 'Praça Central, 852'),
						('Lucas', 'M', 'Campos', 12332123125, 'Rua do Sol, 753'),
						('Amanda', 'N', 'Moraes', 14587458965 , 'Avenida das Palmeiras, 357');

use os_schema;
show tables;
desc clients;
select * from Vehicles;

-- acredito que vou ter que mudar o plate para varchar e nao int, já que ele possui letras e não só numeros
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Fiat Uno', 'ABC1234', 1);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Volkswagen Gol', 'DEF5678', 2);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Ford Ka', 'GHI9012', 3);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Chevrolet Onix', 'JKL3456', 4);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Renault Sandero', 'MNO7890', 5);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Hyundai HB20', 'PQR1234', 6);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Toyota Corolla', 'STU5678', 7);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Honda Civic', 'VWX9012', 8);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Nissan Versa', 'YZA3456', 9);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Mitsubishi Lancer', 'BCD7890', 10);

	insert into Mechanic(Fname, Address, Especialidade) VALUES ('João', 'Rua A, 123', 'Mecânica Geral'),
												('Israel', 'Avenida B, 157', 'Mecânica Geral'),
												 ('Maria', 'Avenida B, 456', 'Elétrica Automotiva'),
												('Carlos', 'Rua C, 789', 'Suspensão e Freios'),
												('Ana', 'Avenida D, 321', 'Ar Condicionado'),
												('Pedro', 'Rua E, 654', 'Injeção Eletrônica'),
												('Luiz', 'Rua C, 144', 'Injeção Eletrônica'),
												('Mariana', 'Avenida F, 987', 'Câmbio Automático'),
												('José', 'Rua G, 654', 'Alinhamento e Balanceamento'),
												('Fernanda', 'Avenida H, 321', 'Reparação de Motores'),
												('Lucas', 'Rua I, 987', 'Sistema de Ignição'),
                                                ('Lorena', 'Rua A, 744', 'Alinhamento e Balanceamento'),
												 ('Camila', 'Avenida J, 654', 'Vidros e Travas Elétricas');