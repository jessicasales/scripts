#!/bin/bash
#Escrito por: Jéssica Sales

#Ativando controle de jobs no bash
set -m

#Comando para iniciar processo principal em segundo plano
echo INICIANDO PROCESSO PRINCIPAL DO WILDFLY
/opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Djboss.tx.node.id=my-unique-server-id -c standalone-full.xml &

#Captura o PID do processo WildFly em segundo plano
WILDFLY_PID=$!

#Aguardando Wildfly ficar pronto
sleep 15

#Iniciar adição das properties
echo INSERINDO PROPERTIES
/opt/jboss/wildfly/bin/jboss-cli.sh -c --command="/system-property=grupo:add(value=${NGINX_BORDA})"
/opt/jboss/wildfly/bin/jboss-cli.sh -c --command="/system-property=redis_address:add(value=redis://${REDIS_URL})"
/opt/jboss/wildfly/bin/jboss-cli.sh -c --command="/system-property=scsdp:add(value=$NGINX_BORDA)"
/opt/jboss/wildfly/bin/jboss-cli.sh -c --command="/system-property=file:add(value=$NGINX_BORDA)"
/opt/jboss/wildfly/bin/jboss-cli.sh -c --command="/system-property=localizacao:add(value=${NGINX_BORDA})"


#Voltando job para o primeiro plano
fg %1                              