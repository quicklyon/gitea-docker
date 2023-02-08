#!/bin/bash
# shellcheck disable=SC1091

APP_NAME=$1
ACTION=$2
SUCCESS_STRING="登录 - QuickOn platform gitea application."
SERVICE_PORT=8080
MAXWAIT=180

. debian/prebuildfs/opt/easysoft/scripts/liblog.sh

info "Testing $APP_NAME"

info "Clear previous services."
make clean > /dev/null 2>&1

info "Run $APP_NAME"
make "$ACTION"  > /dev/null 2>&1

info "Checking service"

retries=${MAXWAIT:-30}
for ((i = 1; i <= retries; i += 1)); do
    if [ "$(curl --connect-timeout 0.1 -sL  http://localhost:"$SERVICE_PORT" | htmlq  -t 'title' )" == "$SUCCESS_STRING" ];then
        info "$APP_NAME is ok!"
        break
    fi

    warn "Waiting $APP_NAME $i seconds"
    sleep 1

    if [ "$i" == "$retries" ]; then
        error "$APP_NAME is unavailable after $MAXWAIT seconds,please check."
        return 1
    fi
done

info "Clear services"
make clean > /dev/null 2>&1
