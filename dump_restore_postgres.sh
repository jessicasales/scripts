#!/bin/bash
#Este script pode ser utilizado para fazer o DUMP dos Clusters de DEV, TST ou HML para outro cluster no ambiente (todos os bancos). É necessário inserir o nome dos bancos mantendo o registro atualizado para que nenhum banco fique fora do dump
#Escrito por: Jéssica Sales


echo "#########################################################"
echo "###### Restore de Bancos Postgres DEV - TST - HML #######"
echo "#########################################################"

USER="postgres"
PORTA="5060"
DATA_HORA=$(date +"%Y%m%d_%H%M%S")
HOST_DEV="" #Insira aqui seu IP do ambiente
HOST_TST="" #Insira aqui seu IP do ambiente
HOST_HML="" #Insira aqui seu IP do ambiente

#Escolhendo para qual ambiente fazer restore:
echo ""
echo "*********************************"
echo "************AMBIENTES************"
echo "**** Ambiente DEV - Digite 1 ****"
echo "**** Ambiente TST - Digite 2 ****"
echo "**** Ambiente HML - Digite 3 ****"
echo "*********************************"
echo "*********************************"
echo ""

read -p "Digite um número para escolher um ambiente acima: " AMBIENTE

if [ "$AMBIENTE" == 1 ]; then

HOST="$HOST_DEV"
echo "Efetuando dump do host $HOST"

#NOMES DOS BANCOS DE DEV. Caso necessário insira novos nomes de bancos implementados abaixo:

NOMES=(
        nome1
        nome2
        nome3
        nome4
)

elif [ "$AMBIENTE" == 2 ]; then

HOST="$HOST_TST"
echo "Efetuando dump do host $HOST"

#NOMES DOS BANCOS DE TST. Caso necessário insira novos nomes de bancos implementados abaixo:
NOMES=(
        nome1
        nome2
        nome3
        nome4
)

elif [ "$AMBIENTE" == 3 ]; then

HOST=$HOST_HML
echo "Efetuando dump do host $HOST"

#NOMES DOS BANCOS DE HML. Caso necessário insira novos nomes de bancos implementados abaixo:
NOMES=(
        nome1
        nome2
        nome3
        nome4
)


else

echo ""
echo "Essa entrada não é valida, execute novamente informando um dos números acima. Até mais ;)"
exit 1
fi

echo ""
echo "####### ORIGEM DO DUMP #######"
read -s -p "Digite a senha do usuário POSTGRES do ambiente escolhido: " PGPASSWORD_ORIGEM
export PGPASSWORD_ORIGEM
echo ""

echo ""
echo "###### LOCAL DO RESTORE ######"
read -p "Agora, digite o IP de destino do cluster que receberá o restore: " IP
read -s -p "Digite a senha do usuário POSTGRES do ambiente: " PGPASSWORD_DESTINO
export PGPASSWORD_DESTINO

for NOME in "${NOMES[@]}"; do
    OUTPUT_SQL="${NOME}-${DATA_HORA}.sql"
    PGPASSWORD="${PGPASSWORD_ORIGEM}" pg_dump -F p -C -h "${HOST}" -U "${USER}" -p "${PORTA}" "${NOME}" > "${OUTPUT_SQL}"
    echo "Efetuando dump do banco $NOME"
    echo "------"
    echo "Efetuando restore do banco $NOME para o cluster de destino no IP: $IP"
    PGPASSWORD="${PGPASSWORD_DESTINO}" psql -U postgres -h $IP -p 5060 -f "${OUTPUT_SQL}"
    echo "------"
done

unset PGPASSWORD_ORIGEM
unset PGPASSWORD_DESTINO
