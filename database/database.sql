CREATE DATABASE smartreports;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    email TEXT,
    password VARCHAR(300),
    rol INT,
    status BOOLEAN 
);

CREATE TABLE hospital(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    direction VARCHAR(40),
    capacity INT
);
CREATE TABLE metrics (
    id SERIAL PRIMARY KEY,
    count INT,
    fkidreport INT,
    fkidkeyboars INT,
    fkid hospital INT
);

CREATE TABLE metrics (id SERIAL PRIMARY KEY, count INT, fkidreport INT, fkidkeyboars INT, fkidhospital INT);

CREATE TABLE reports_original(
    id SERIAL PRIMARY KEY,
    fecha VARCHAR(50),
    fkidmedico INT,
    fkidpaciente INT,
    detail VARCHAR(600),
    status BOOLEAN 
);

CREATE TABLE reports_generate(
    id SERIAL PRIMARY KEY,
    detail VARCHAR(600),
    fkidrepororiginal INT,
    status BOOLEAN 
);

CREATE TABLE keyboars_and_meanings(
    id SERIAL PRIMARY KEY,
    keyword VARCHAR(50),
    meanings VARCHAR(700),
    fountain VARCHAR(700),
);

ALTER TABLE "reports_original" 
  ADD CONSTRAINT fkidmedico
   FOREIGN KEY (fkidmedico) 
   REFERENCES "users"(id);


   ALTER TABLE "reports_original" 
  ADD CONSTRAINT fkidpaciente
   FOREIGN KEY (fkidpaciente) 
   REFERENCES "users"(id);

   
   ALTER TABLE "reports_generate" 
  ADD CONSTRAINT fkidrepororiginal
   FOREIGN KEY (fkidrepororiginal) 
   REFERENCES "reports_original"(id);




INSERT INTO users (name, email, password, rol, status) 
VALUES ('Yenner Marchan Zamora', 'jp@gmail.com', '123456', 0, true);