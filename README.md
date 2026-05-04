# Cloud Infrastructure Project

## 🏗 Архитектура

| Роль | Имя в инвентори | Внешний IP | Порт | Назначение |
|------|----------------|------------|------|------------|
| Proxy | vm-proxy | 2.26.106.29 | 3000 | Проксирующий Nginx |
| Backend 1 | vm-backend-1 | 2.27.37.132 | 80 | Отдающий Nginx |
| Backend 2 | vm-backend-2 | 2.27.37.134 | 80 | Отдающий Nginx |

## 📁 Структура проекта
cloud-project/
├── terraform/ # Terraform-манифесты
│ ├── main.tf # Основной конфигурационный файл
│ ├── variables.tf # Описание переменных
│ └── terraform.tfvars # Значения переменных
├── ansible/ # Ansible-конфигурация
│ ├── ansible.cfg # Настройки Ansible
│ ├── inventory.yml # Инвентори-файл (список хостов)
│ ├── playbook.yml # Основной плейбук
│ └── roles/ # Роли Ansible
│ ├── base/ # Базовая настройка
│ │ └── tasks/main.yml # Установка пакетов, hostname
│ ├── nginx-backend/ # Отдающий Nginx
│ │ ├── tasks/main.yml
│ │ ├── handlers/main.yml
│ │ └── templates/index.html.j2
│ └── nginx-proxy/ # Проксирующий Nginx
│ ├── tasks/main.yml
│ ├── handlers/main.yml
│ └── templates/nginx-proxy.conf.j2
└── README.md

text

## 🚀 Запуск

```bash
# Проверка доступности хостов
cd ansible
ansible all -m ping

# Применение конфигурации
ansible-playbook playbook.yml
✅ Проверка работы
bash
# Прокси на порту 3000
curl http://2.26.106.29:3000

# Backend-серверы напрямую
curl http://2.27.37.132
curl http://2.27.37.134
📦 Установленные пакеты
net-tools

dnsutils

wget

curl

mc

rsync

🔧 Используемые технологии
Terraform — Infrastructure as Code (описание инфраструктуры)

Ansible — Configuration Management (настройка серверов)

Nginx — Веб-сервер и прокси

Yandex Cloud — Облачный провайдер
