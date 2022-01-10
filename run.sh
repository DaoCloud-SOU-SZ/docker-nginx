#!/bin/sh

echo "start..."
test -z "$TZ" && export TZ='Asia/Shanghai'

if [ "$DX_TRACING_ENABLE" = "true" ]
then
    # export NGINX_DIR="/etc/openresty"
    # export NGINX_FILE="nginx.conf"
    test -z "$CONFIG_TMP_FILE" && export CONFIG_TMP_FILE='nginx.conf'
    test -z "$CONFIG_TMP_DIR" && export CONFIG_TMP_DIR=''
    rm -rf $NGINX_DIR/$NGINX_FILE
    cp $CONFIG_TMP_DIR/$CONFIG_TMP_FILE $NGINX_DIR/$NGINX_FILE

    # sed -i "s%\${}%${}%g" $NGINX_DIR/$NGINX_FILE
    # sed -i "s%\${DX_APP_NAME}%${DX_APP_NAME}%g" $NGINX_DIR/$NGINX_FILE
    # sed -i "s%\${DX_APP_ID}%${DX_APP_ID}%g" $NGINX_DIR/$NGINX_FILE
    # sed -i "s%\${DX_SERVICE_ID}%${DX_SERVICE_ID}%g" $NGINX_DIR/$NGINX_FILE

    sed -i "s%\${NGINX_TYPE}%${NGINX_TYPE}%g" $NGINX_DIR/$NGINX_FILE
    sed -i "s%\${DX_SERVICE_NAME}%${DX_SERVICE_NAME}%g" $NGINX_DIR/$NGINX_FILE
    sed -i "s%\${DX_SERVICE_INSTANCE_NAME}%${DX_SERVICE_INSTANCE_NAME}%g" $NGINX_DIR/$NGINX_FILE
    sed -i "s%\${DX_ENV_ID}%${DX_ENV_ID}%g" $NGINX_DIR/$NGINX_FILE
    sed -i "s%\${DX_KUBE_NS}%${DX_KUBE_NS}%g" $NGINX_DIR/$NGINX_FILE
    sed -i "s%\${DX_DMP_TRACING_SERVER}%${DX_DMP_TRACING_SERVER}%g" $NGINX_DIR/$NGINX_FILE
fi

exec "$@"
