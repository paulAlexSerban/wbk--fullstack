
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM seeder_log WHERE script_name = 'seed.sql') THEN
    
      -- Insert seed data
      INSERT INTO
        monsters(name, personality)
      VALUES
        ('Fluffy', 'aggressive'),
        ('Noodles', 'impatient'),
        ('Rusty', 'passionate');

      INSERT INTO
        habitats(name, climate, temperature)
      VALUES
        ('desert', 'dry', 100),
        ('forrest', 'haunted', 70),
        ('mountain', 'icy', 30);

      INSERT INTO
        lives(monster, habitat)
      VALUES
        ('Fluffy', 'desert'),
        ('Noodles', 'forrest'),
        ('Rusty', 'mountain');
        -- Log the execution of the seed script

      INSERT INTO seeder_log (script_name) VALUES ('seed.sql');
    END IF;
END $$;