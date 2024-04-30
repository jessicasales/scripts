#!/bin/bash
#Escrito por: Jéssica Sales

# Configurações do banco de dados PostgreSQL
dbname='postgres'
user='postgres'
password='' #Inserir sua senha
host='' #Inserir seu IP
port='5060'

# Array contendo os nomes dos bancos de dados
databases=('nome1' 'nome2' 'nome3' 'nome4')


# Loop através dos bancos de dados
for db in "${databases[@]}"; do

echo "Banco $db"
    # Obter todos os schemas do banco de dados
    schemas=$(psql -h $host -p $port -U $user -d $dbname -t -c "SELECT schema_name FROM information_schema.schemata WHERE schema_name != 'information_schema';")

    # Loop através dos schemas
    for schema in $schemas; do

    echo "Schema $schema"
        # Obter todos os usuários
        users=$(psql -h $host -p $port -U $user -d $dbname -t -c "SELECT usename FROM pg_user;")
        
        # Loop através dos usuários
        for username in $users; do
            # Aplicar permissões
            echo "Aplicando permissão no banco $db - schema $schema - usuário $username"

            psql -h $host -p $port -U $user -d $dbname -c "GRANT CONNECT ON DATABASE $db TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "GRANT USAGE ON SCHEMA $schema TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "ALTER DEFAULT PRIVILEGES IN SCHEMA $schema GRANT SELECT ON TABLES TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA $schema TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA $schema TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "GRANT SELECT ON ALL TABLES IN SCHEMA $schema TO $username;"
            psql -h $host -p $port -U $user -d $dbname -c "GRANT USAGE ON SCHEMA public TO $username;"

            echo "Permissão aplicada ao usuário $username no banco $db para schema $schema"

        done
    done
done

echo "Permissões aplicadas com sucesso."
