CREATE USER node_user WITH SUPERUSER PASSWORD 'node_password';

CREATE TABLE IF NOT EXISTS seeder_log (
    id SERIAL PRIMARY KEY,
    script_name VARCHAR(255) NOT NULL,
    executed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE hello(
  id serial,
  message character varying(50)
);
