#!/bin/bash

CONFIG_FILE=".configurate_script.conf"

#Подключение Конфиг-файла
if[ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    PROCESS_NAME="test"
    LOG_FILE="/var/log/monitoring_test_api.log"
    MONITORING_URL="https://test.com/monitoring/test/api"
fi

#Временный файл для хранения PID процесса, за которым необходимо следить
PID_FILE="/tmp/${PROCESS_NAME}.pid"

#Шаблон логирования
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

#Получение пида процесса
get_process_pid() {
    pgrep -x "$PROCESS_NAME" | head -1
}

#Провекрка ответов по HTTP
send_http_monitoring_request(){
    local response
    response=$(curl "$MONITORING_URL" --connect-timeout 10 --max-time 30)

    if [ "$response" != "200" ]; then
        log_message "ERROR: Monitoring server unavailable. HTTP response: $response"
    fi
}

main(){
    current_pid=$(get_process_pid)

    #Проверка работы процесса
    if [-n "$current_pid"]; then

        #Проверка существования файла с PID процесса
        if [-f "$PID_FILE"] then
            previous_pid=$(cat "$PID_FILE")

            #Проверка текущего PID процесса с прошлым, который сохранён во временном файле
            if [$previous_pid != $current_pid]; then
                log_message "INFO: Process '$PROCESS_NAME' was restarted. Old PID: $previous_pid, New PID: $current_pid"
            fi

        fi

        echo "$current_pid" > "$PID_FILE"

        #Проверка хелс-чеком
        send_monitoring_request
    else
        # Процесс не запущен - очищаем временный файл
        rm -f "$PID_FILE"
    
    fi

}

main