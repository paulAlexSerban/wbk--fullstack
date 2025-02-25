DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM seeder_log WHERE script_name = 'seed.sql') THEN

        -- Insert seed data
        INSERT INTO hello(message) VALUES 
            ('Hello, Node.js!'),
            ('Hello, PostgreSQL!'),
            ('Hello, Docker!'),
            ('Hello, Kubernetes!'),
            ('Hello, Helm!'),
            ('Hello, Skaffold!'),
            ('Hello, GitHub Actions!'),
            ('Hello, ArgoCD!'),
            ('Hello, Tekton!'),
            ('Hello, Kustomize!'),
            ('Hello, Skaffold!'),
            ('Hello, GitHub Actions!'),
            ('Hello, ArgoCD!'),
            ('Hello, Tekton!'),
            ('Hello, Kustomize!');
        -- Log the execution of the seed script
        
        INSERT INTO seeder_log (script_name) VALUES ('seed.sql');
    END IF;
END $$;