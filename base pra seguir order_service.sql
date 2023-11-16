use os_schema;
show tables;
select * from clients;
create database teste_os_oschema;
use teste_os_oschema;
-- Tabela "OS":
CREATE TABLE OS (
  idOS int auto_increment primary key,
  id_vehicle int,
  sendDate date,
  ServiceValue float,
  orderStatus enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
  EndDate date,
  constraint fk_vehicle_id foreign key (id_vehicle) references Vehicles(idVehicle)
);

-- Tabela "Clients":
CREATE TABLE Clients(
  idClient int auto_increment primary key,
  Fname varchar(15),
  Minit varchar(2),
  Lname varchar(15),
  CPF BIGINT,
  Addresss varchar(50),
  constraint unique_cpf_client unique (CPF)
);

ALTER TABLE Clients MODIFY CPF BIGINT;

-- Tabela "Vehicles":
CREATE TABLE Vehicles(
  idVehicle int auto_increment primary key,
  model varchar(15),
  plate_number int,
  idClient int,
  constraint fk_vehicleClient_id foreign key (idClient) references Clients(idClient)
);
desc Vehicles;
ALTER TABLE Vehicles MODIFY idClient int auto_increment;
-- Tabela "Mechanic"
CREATE TABLE Mechanic(
  idMechanic int auto_increment primary key,
  Fname varchar(15),
  Address varchar(30),
  Especialidade varchar(50)
);



-- Adicionar relacionamento entre "OS" e "Mechanic":
ALTER TABLE OS
ADD CONSTRAINT fk_respo_mechanic_id FOREIGN KEY (idOS) REFERENCES Mechanic(idMechanic);


SELECT v.modelo, v.placa, c.nome AS proprietario
FROM veiculo v
JOIN cliente c ON v.id_cliente = c.id_cliente
WHERE v.placa = 'XYZ123';




show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'os_schema';





