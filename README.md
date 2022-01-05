# docker-nginx
Contains the base image of skywalking-agent.

## openresty
Openresty has lua module.

## nginx
Add lua module for nginx, [refer to the document](https://github.com/nginxinc/docker-nginx/tree/master/modules).

## Parameter Description  

| Environment variable parameters | Description                  |  Default     |  Remark                           |
| :------------------------------ | :--------------------------- | :----------  | --------------------------------- |
| CONFIG_TMP_DIR                  | Custom template path         |  `/`         | When skywaking is enabled, the template path will be used, usually using configmaps to mount into pods |
| CONFIG_TMP_FILE                 | Custom template file name    | `nginx.conf` | When skywaking is enabled, the template file will be used, usually using configmaps to mount into pods |
| DX_TRACING_ENABLE               | Whether to enable skywalking | `false`      |                                    ｜
| DX_DMP_TRACING_SERVER           | Skywalking service address   | `NaN`        | Should use skywalking REST API port｜
| DX_ENV_ID                       | DMP environment code         | `NaN`        |                                    ｜
| DX_KUBE_NS                      | Service namespace            | `NaN`        |                                    ｜
| DX_SERVICE_NAME                 | Service name                 | `NaN`        | Usually the service name           ｜ 
| DX_SERVICE_INSTANCE_NAME        | Service instance name        | `NaN`        | Usually pods name                  ｜