Тестовое задание на позцицию DevOps developer от Effective Mobile

Задача:
Написать скрипт на bash для мониторинга процесса test в среде
linux. Скрипт должен отвечать следующим требованиям:
1. Запускаться при запуске системы (предпочтительно написать юнит systemd в дополнение к скрипту)
2. Отрабатывать каждую минуту
3. Если процесс запущен, то стучаться(по https) на https://test.com/monitoring/test/api
4. Если процесс был перезапущен, писать в лог /var/log/monitoring.log (если процесс не запущен, то ничего не делать)
5. Если сервер мониторинга не доступен, так же писать в лог.

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
