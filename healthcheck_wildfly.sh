#!/bin/bash
#Escrito por: Jéssica Sales

#Esperar container iniciar
echo "Iniciando script Healthcheck..."
echo "Aguardando inicialização completa do container."
sleep 720

# Número máximo de tentativas
max_tentativas=2

# URL para verificar o status do serviço
service_url="http://localhost:9200"

# Diretório para verificar a existência do arquivo .war
pasta_war="/opt/jboss/wildfly/standalone/tmp/"

# Função para verificar o status do serviço via HTTP
check_status_servico() {
        status_code=$(curl -s -o /dev/null -w "%{http_code}" "$service_url")
        echo $status_code
        return $status_code
}

# Função para verificar a existência de arquivos .war no diretório
check_arquivo_war() {
        conta_war=$(find "$pasta_war" -maxdepth 1 -type f -name "*.war" | wc -l)
        echo $conta_war
        return $conta_war
}

# Loop para realizar as verificações com um número máximo de tentativas
for ((int=1; int<=$max_tentativas; int++)); do

        echo "Tentativa $int de $max_tentativas"

        # Verificar o status do serviço
        status_servico=$(check_status_servico)

        # Verificar a existência de arquivos .war
        status_war=$(check_arquivo_war)

        # Verificar se ambas as condições são atendidas
        if [ "$status_servico" -eq 200 ] || [ "$status_war" -gt 0 ]; then
                echo "Healthcheck passou com sucesso!"
                exit 0
        else
                echo "Healthcheck falhou. Aguardando 5 segundos antes de tentar novamente."
                sleep 5

                if [ "$int" -eq "$max_tentativas" ]; then
                        # Se todas as tentativas falharem, encerrar o container
                        echo "Healthcheck falhou após $max_tentativas tentativas. Encerrando o container..."
                        kill -SIGTERM 1
                fi

        fi
done
