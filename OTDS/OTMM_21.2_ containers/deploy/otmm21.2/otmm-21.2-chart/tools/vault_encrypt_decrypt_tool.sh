#!/bin/sh
linux=true;

EXECUTABLE_CLASS=com.artesia.common.encryption.driver.EncryptDecryptDriver

CLASSPATH="libs/TEAMS-common.jar:libs/commons-logging-1.2.jar:libs/commons-codec-1.5.jar"

JAVA_EXECUTABLE=java

if [ ! -z "$JAVA_HOME" ]; then
  JAVA_EXECUTABLE="$JAVA_HOME/bin/java"
fi

FILE_PATH="C:/Users/tempjaraa/IdeaProjects/OTDS/OTMM_21.2_ containers/deploy/otmm21.2/otmm-21.2-chart/conf/vault"
SEC_FILE_NAME=$FILE_PATH/sec.cfg
KEY_FILE_NAME=$FILE_PATH/key.txt
if [ -f "$KEY_FILE_NAME" ]; then
export ENCRYPTION_KEY_IMPLEMENTATION_CLASS=com.artesia.common.encryption.key.FileSystemSecretKey
export ENCRYPTION_KEY_FILE_PATH=$KEY_FILE_NAME
fi

ENCRYPTION_KEYWORD=$(grep ENC $SEC_FILE_NAME)

if [ "${ENCRYPTION_KEYWORD}x" != "x" ]; then
    sed -i -e 's|ENC(|''''|g' $SEC_FILE_NAME
	sed -i -e 's|)|''''|g' $SEC_FILE_NAME
    DECRYPTION_ENCRYPTION=df
	echo 'Decrypting!!!'
else
    DECRYPTION_ENCRYPTION=ef
	echo 'Encrypting!!!'
fi

TEMP=$(eval "$JAVA_EXECUTABLE -classpath $CLASSPATH $EXECUTABLE_CLASS $DECRYPTION_ENCRYPTION $SEC_FILE_NAME")


FINAL_CONTENT="ENC($(cat $SEC_FILE_NAME))"
if [ "$DECRYPTION_ENCRYPTION" = "ef" ]; then
     echo $FINAL_CONTENT > $SEC_FILE_NAME
fi

sleep 5d