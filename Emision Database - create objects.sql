/*
--------------------------------------------------------------------
Name   : Emision
Link   : http://www.sqlservertutorial.net/load-sample-database/
Version: 1.0
--------------------------------------------------------------------
*/
-- create schemas
CREATE SCHEMA production;
go


-- create tables
CREATE TABLE production.plan (
	nro_plan INT IDENTITY (1, 1) PRIMARY KEY,
	plan_nombre VARCHAR (255) NOT NULL
);

CREATE TABLE production.beneficios (
	cod_beneficio INT IDENTITY (1, 1) PRIMARY KEY,
	beneficio_name VARCHAR (255) NOT NULL
);

CREATE TABLE production.plan_beneficio (
	nro_plan INT NOT NULL,
	cod_beneficio INT NOT NULL,
	model_year SMALLINT NOT NULL,
	monto_anual DECIMAL (10, 2) NOT NULL,
	FOREIGN KEY (cod_beneficio) REFERENCES production.beneficios (cod_beneficio) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (nro_plan) REFERENCES production.plan (nro_plan) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sales.customers (
	customer_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	phone VARCHAR (25),
	email VARCHAR (255) NOT NULL,
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);


CREATE TABLE production.plan_forma_reclamo (
	nro_plan INT,
	forma_reclamo INT,
	quantity INT,
	PRIMARY KEY (nro_plan, forma_reclamo),
	FOREIGN KEY (nro_plan) REFERENCES production.plan (nro_plan) ON DELETE CASCADE ON UPDATE CASCADE,
	
);