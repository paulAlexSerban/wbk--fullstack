CREATE USER node_user WITH SUPERUSER PASSWORD 'node_password';

CREATE TABLE IF NOT EXISTS seeder_log (
    id SERIAL PRIMARY KEY,
    script_name VARCHAR(255) NOT NULL,
    executed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE monsters(
  id serial,
  name character varying(50),
  personality character varying(50)
);

CREATE TABLE habitats(
  id serial,
  name character varying(50),
  climate character varying(50),
  temperature int
);

CREATE TABLE lives(
  id serial,
  monster character varying(50),
  habitat character varying(50)
);