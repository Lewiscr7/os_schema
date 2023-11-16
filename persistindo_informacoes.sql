-- persistindo informações OS_schema

-- Selecionar todos os veículos ordenados pelo modelo em ordem alfabética:
SELECT * FROM Vehicles ORDER BY model;

-- Selecionar todos os clientes que possuem mais de 2 veículos:
SELECT c.* FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
GROUP BY c.idClient
HAVING COUNT(v.idVehicle) > 0;


Selecionar a quantidade de ordens de serviço finalizadas por cliente:
SELECT c.idClient, COUNT(os.idOS) AS total_os_finalizadas
FROM Clients c
LEFT JOIN Vehicles v ON c.idClient = v.idClient
LEFT JOIN OS os ON v.idVehicle = os.id_vehicle
WHERE os.orderStatus = 'Finalizado'
GROUP BY c.idClient;

Selecionar a quantidade de ordens de serviço por status de ordem:
SELECT orderStatus, COUNT(idOS) AS total_os_por_status
FROM OS
GROUP BY orderStatus;

Selecionar os clientes que possuem veículos com placas terminando em '123':
SELECT c.* FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
WHERE v.plate_number LIKE '%123';

Selecionar a média de valor de serviço por cliente:
SELECT c.idClient, AVG(os.ServiceValue) AS media_valor_servico
FROM Clients c
LEFT JOIN Vehicles v ON c.idClient = v.idClient
LEFT JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient;

Selecionar os veículos que possuem mais de 5 ordens de serviço:
SELECT v.*, COUNT(os.idOS) AS total_os
FROM Vehicles v
LEFT JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY v.idVehicle
HAVING COUNT(os.idOS) > 5;

Selecionar os clientes que possuem ordens de serviço com valor total acima de 1000:
SELECT c.* FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient
HAVING SUM(os.ServiceValue) > 1000;

Selecionar os veículos que tiveram suas ordens de serviço finalizadas no último mês:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
WHERE os.EndDate >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY v.idVehicle;

Selecionar a quantidade de ordens de serviço por mês:
SELECT MONTH(sendDate) AS mes, COUNT(idOS) AS total_os
FROM OS
GROUP BY MONTH(sendDate);

Selecionar os clientes que possuem ordens de serviço canceladas:
SELECT c.* FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
JOIN OS os ON v.idVehicle = os.id_vehicle
WHERE os.orderStatus = 'Cancelado'
GROUP BY c.idClient;

Selecionar os veículos que possuem ordens de serviço com valor total acima da média:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY v.idVehicle
HAVING SUM(os.ServiceValue) > (SELECT AVG(ServiceValue) FROM OS);

Selecionar o cliente com mais veículos:
SELECT c.*, COUNT(v.idVehicle) AS total_veiculos
FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
GROUP BY c.idClient
ORDER BY total_veiculos DESC
LIMIT 1;

Selecionar os veículos que possuem ordens de serviço finalizadas e estão associados a um determinado mecânico:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
JOIN Mechanic m ON os.idMechanic = m.idMechanic
WHERE os.orderStatus = 'Finalizado'
AND m.idMechanic = 1;

Selecionar o cliente com o valor total de ordens de serviço mais alto:
SELECT c.*, SUM(os.ServiceValue) AS valor_total_servico
FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient
ORDER BY valor_total_servico DESC
LIMIT 1;

Selecionar os veículos que foram enviados para serviço antes de uma determinada data:
SELECT * FROM Vehicles
JOIN OS ON Vehicles.idVehicle = OS.id_vehicle
WHERE OS.sendDate < '2021-01-01';

Selecionar a quantidade de ordens de serviço por cliente ordenado decrescentemente pela quantidade:
SELECT c.idClient, COUNT(os.idOS) AS total_os
FROM Clients c
LEFT JOIN Vehicles v ON c.idClient = v.idClient
LEFT JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient
ORDER BY total_os DESC;

Selecionar os veículos que possuem ordens de serviço não confirmadas:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
WHERE os.orderStatus = 'Em processamento';

Selecionar a quantidade de ordens de serviço por mês e por status de ordem:
SELECT MONTH(sendDate) AS mes, orderStatus, COUNT(idOS) AS total_os
FROM OS
GROUP BY MONTH(sendDate), orderStatus;

Selecionar os veículos que possuem ordens de serviço com valor total acima de 500 e estão associados a um determinado mecânico:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
JOIN Mechanic m ON os.idMechanic = m.idMechanic
WHERE os.ServiceValue > 500
AND m.idMechanic = 1;

Selecionar o cliente com a menor quantidade de veículos:
SELECT c.*, COUNT(v.idVehicle) AS total_veiculos
FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
GROUP BY c.idClient
ORDER BY total_veiculos ASC
LIMIT 1;

Selecionar os veículos que possuem ordens de serviço canceladas e estão associados a um determinado mecânico:
SELECT v.* FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
JOIN Mechanic m ON os.idMechanic = m.idMechanic
WHERE os.orderStatus = 'Cancelado'
AND m.idMechanic = 1;

Selecionar a quantidade de ordens de serviço por cliente em ordem crescente pelo valor total das ordens:
SELECT c.idClient, COUNT(os.idOS) AS total_os, SUM(os.ServiceValue) AS valor_total_servico
FROM Clients c
LEFT JOIN Vehicles v ON c.idClient = v.idClient
LEFT JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient
ORDER BY valor_total_servico;

Selecionar os veículos que possuem ordens de serviço finalizadas e estão associados a um determinado mecânico, ordenados pelo valor total das ordens em ordem decrescente:
SELECT v.*, SUM(os.ServiceValue) AS valor_total_servico
FROM Vehicles v
JOIN OS os ON v.idVehicle = os.id_vehicle
JOIN Mechanic m ON os.idMechanic = m.idMechanic
WHERE os.orderStatus = 'Finalizado'
AND m.idMechanic = 1
GROUP BY v.idVehicle
ORDER BY valor_total_servico DESC;

Selecionar os clientes que possuem ordens de serviço com valor total acima de 500:
SELECT c.* FROM Clients c
JOIN Vehicles v ON c.idClient = v.idClient
JOIN OS os ON v.idVehicle = os.id_vehicle
GROUP BY c.idClient
HAVING SUM(os.ServiceValue) > 500;

Espero que essas queries sejam úteis! Lembre-se de substituir os valores e condições conforme necessário, como o ID do mecânico ou uma determinada data.