# Projeto OS_Schema

Este é um esquema de banco de dados para uma oficina mecânica, projetado para armazenar informações sobre ordens de serviço (OS), veículos, clientes e mecânicos.

# Pré-requisitos
MySQL (ou qualquer outro sistema de gerenciamento de banco de dados compatível)
Instalação
Faça o download do arquivo SQL contendo o esquema do banco de dados.
Importe o arquivo SQL no seu sistema de gerenciamento de banco de dados para criar o banco de dados e as tabelas necessárias.
# Estrutura do Banco de Dados
O banco de dados consiste nas seguintes tabelas:

- Clients
Esta tabela armazena informações sobre os clientes:

idClient: identificador único do cliente (chave primária)
Fname: primeiro nome do cliente
Minit: inicial do nome do meio do cliente
Lname: sobrenome do cliente
CPF: CPF do cliente (deve ser único)
Addresss: endereço do cliente
- Vehicles
Esta tabela armazena informações sobre os veículos:

idVehicle: identificador único do veículo (chave primária)
model: modelo do veículo
plate_number: número da placa do veículo
idClient: identificador do cliente associado (chave estrangeira para a tabela Clients)
- Mechanic
Esta tabela armazena informações sobre os mecânicos:

idMechanic: identificador único do mecânico (chave primária)
Fname: primeiro nome do mecânico
Address: endereço do mecânico
Especialidade: especialidade do mecânico
- OS
Esta tabela armazena informações sobre as ordens de serviço:

idOS: identificador único da ordem de serviço (chave primária)
id_vehicle: identificador do veículo associado (chave estrangeira para a tabela Vehicles)
sendDate: data de envio da ordem de serviço
ServiceValue: valor do serviço realizado
orderStatus: status da ordem de serviço (Cancelado, Confirmado ou Em processamento)
EndDate: data de conclusão da ordem de serviço
idMechanic: identificador do mecânico responsável pela ordem de serviço (chave estrangeira para a tabela Mechanic)
# Exemplos de Uso
Aqui estão alguns exemplos de como inserir dados nas tabelas:

INSERT INTO Clients (Fname, Minit, Lname, CPF, Addresss) VALUES ('João', 'A', 'Silva', 12345678900, 'Rua A, 123');
INSERT INTO Clients (Fname, Minit, Lname, CPF, Addresss) VALUES ('Maria', 'B', 'Santos', 98765432100, 'Rua B, 456');

INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Fiesta', 'ABC1234', 1);
INSERT INTO Vehicles (model, plate_number, idClient) VALUES ('Cruze', 'DEF5678', 2);

INSERT INTO Mechanic (Fname, Address, Especialidade) VALUES ('José', 'Rua C, 789', 'Motor');
INSERT INTO Mechanic (Fname, Address, Especialidade) VALUES ('Ana', 'Rua D, 456', 'Freios');

INSERT INTO OS (id_vehicle, sendDate, ServiceValue, orderStatus, EndDate, idMechanic) VALUES (1, '2022-01-01', 100.00, 'Em processamento', '2022-01-05', 1);
INSERT INTO OS (id_vehicle, sendDate, ServiceValue, orderStatus, EndDate, idMechanic) VALUES (2, '2022-01-02', 150.00, 'Confirmado', '2022-01-07', 2);

# Contribuição
Contribuições são bem-vindas! Se você tiver sugestões de melhorias ou encontrar algum problema, sinta-se à vontade para abrir uma issue ou enviar um pull request.
