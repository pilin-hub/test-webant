## Описание проекта
Этот проект включает настройку виртуализированной инфраструктуры с использованием **Proxmox VE (PVE)**, **Terraform** для развертывания виртуальных машин и **Ansible** для установки необходимого ПО и настройки.

## Компоненты:
**Proxmox VE (PVE)** — гипервизор для создания виртуальных машин.
**Terraform** — автоматизация развертывания виртуальных машин.
**Ansible** — автоматизация установки ПО и конфигурации виртуальных машин.
Требования
**Proxmox VE (PVE)**.
**Terraform**.
**Ansible**.
## Шаги развертывания
### 1. Развертывание виртуальных машин с помощью **Terraform**
Откройте терминал и перейдите в каталог с **Terraform** конфигурацией.
### Инициализируйте **Terraform**:
> 
> terraform init
> 
### Проверьте конфигурацию:
> terrafom plan
> 
### Разверните виртуальные машины:
> 
> terraform apply
> 
#### После этого будут развернуты 3 виртуальные машины:
- 1 виртуальные машины для приложений (APP).
- 1 виртуальная машина для NGINX.
- 1 виртуальная машина для базы данных.

### 2. Установка ПО и настройка с помощью **Ansible**
###### Откройте терминал и перейдите в каталог с **Ansible** playbooks.
###### Запустите playbook для установки ПО и настройки виртуальных машин:
> ansible-playbook -i inventory/hosts playbook-***.yml
### 5. Проверка
Убедитесь, что все виртуальные машины запущены и настроены правильно.
Проверьте доступность всех сервисов (приложений, NGINX, базы данных) через назначенные IP-адреса.

## Структура проекта
```
├── ansible/
│   ├── inventory/
│   │   └── hosts.ini
│   |── playbook.yml
│   └── vars.yml
|   └── roles
|        ├── tasks
|        |    └── main.yml
|        └── templates
|             └── default.conf
├── terraform/
│   ├── provider.tf
│   ├── credentials.auto.tfvars
|   ├── VV-App.tf
|   ├── VV-DB.tf 
│   └── VV-nginx.tf
|
├── winter/
|    ├──.docker-compose
|    |   └── docker-compose.yml
|    ├── Dockerfile
|    ├── gitlab-ci.yml
|    └── .gitlab-ci
|        ├── build.yml
|        ├── default.yml
|        ├── deploy.yml
|        ├── extendes.yml
|        ├── prepare-deploy.yml
|        └── workflow.yml
|
└── README.md
```