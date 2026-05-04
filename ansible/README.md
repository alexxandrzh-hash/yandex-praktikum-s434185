Ansible Configuration
Роли
base: Установка пакетов и настройка системы

nginx-proxy: Прокси-сервер на порту 3000

nginx-backend: Отдающий веб-сервер
# Проверка подключения
ansible all -m ping

# Запуск playbook
ansible-playbook playbook.yml

# Проверка результата
curl http://2.26.106.29:3000
