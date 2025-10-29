Тестовое задание на позцицию DevOps developer от Effective Mobile

Задача:
Написать скрипт на bash для мониторинга процесса test в среде
linux. Скрипт должен отвечать следующим требованиям:
1. Запускаться при запуске системы (предпочтительно написать юнит systemd в дополнение к скрипту)
2. Отрабатывать каждую минуту
3. Если процесс запущен, то стучаться(по https) на https://test.com/monitoring/test/api
4. Если процесс был перезапущен, писать в лог /var/log/monitoring.log (если процесс не запущен, то ничего не делать)
5. Если сервер мониторинга не доступен, так же писать в лог.

Запуск скрипта:

1) Требуется указать путь к основному скрипту monitoring_test.sh в monitoring_test_api.service в поле ExecStart
   и разрешить выполнение его с помошью: \
   `$ sudo chmod +x /path/to/monitoring_test.sh`
3) Перемещение файлов для systemd unit: \
   `$ sudo mv monitoring_test_api.timer /etc/systemd/system/` \
   `$ sudo mv monitoring_test_api.service /etc/systemd/system/`
4) Запуск \
   `$ sudo systemctl daemon-reload` \
   `$ sudo systemctl enable monitoring_test_api.timer` \
   `$ sudo systemctl start monitoring_test_api.timer` \

Поддержка:
Конфигурационный файл - configurate_script.conf должен находится рядом с основным скриптом monitoring_test.sh, он отвечает
за такие выбранные параметры как:
- Имя процесса, за которым необходимо установить мониторинг
- Файл для логирования
- URL для хэлсчека

------------------------------------------------------------------------------------------------------------------------

A test assignment for the DevOps developer position from Effective Mobile

Task:
Write a script in bash to monitor the test process in the environment
linux. The script must meet the following requirements:
1. Run at system startup (preferably write a systemd unit in addition to the script)
2. Practice every minute
3. If the process is running, then knock (over https) on https://test.com/monitoring/test/api
4. If the process has been restarted, write to /var/log/monitoring.log (if the process is not running, then do nothing)
5. If the monitoring server is not available, write to the log as well.

Running the script:

1) You need to specify the path to the regular script monitoring_test.sh via monitoring_test_api.service after launch
   and allow it to be executed using: \
`$sudo chmod +x /path/to/monitoring.sh `
3) Changing the settings for the system unit: \
   `$ sudo mv monitoring_test_api.timer /etc/systemd/system/` \
   `$ sudo mv monitoring_test_api.service /etc/systemd/system/`
4) Launch \
   `daemon $sudo systemctl-reboot` \
   `$ sudo systemctl enable monitoring_test_api.timer` \
   `$ sudo systemctl start monitoring_test_api.timer` 

Support:
The config file - configurate_script.conf should be located next to the main script. monitoring_test.sh it is responsible
for such selected parameters as:
- The name of the process to be monitored
- A file for logging
- The URL for the health check
