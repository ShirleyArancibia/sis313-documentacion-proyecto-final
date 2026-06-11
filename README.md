# 🚀 Proyecto Final SIS313: [Título del Proyecto]

> **Asignatura:** SIS313: Infraestructura, Plataformas Tecnológicas y Redes<br>
> **Semestre:** 1/2026<br>
> **Docente:** Ing. Marcelo Quispe Ortega

## 👥 Miembros del Equipo ([Número o denominación del grupo])

| Nombre Completo | Rol en el Proyecto | Contacto (GitHub/Email) |
| :--- | :--- | :--- |
| [Nombre y Apellido 1] | [Rol Principal: Ej. Arquitecto de Seguridad] | [Usuario de GitHub] |
| [Nombre y Apellido 2] | [Rol Principal: Ej. Ingeniero de Automatización] | [Usuario de GitHub] |
| [Nombre y Apellido 3] | [Rol Principal: Ej. Administrador de Sistemas] | [Usuario de GitHub] |
| [Nombre y Apellido 4] | [Rol Opcional] | [Usuario de GitHub] |

## 🎯 I. Objetivo del Proyecto

Describe el objetivo de manera puntual, debe ser específica y medible, tal como se define en el banco de proyectos o tal como lo plantean como proyecto.

> **Objetivo:** [Indicar el objetivo del proyecto, ej: "Diseñar y configurar un clúster de Base de Datos con replicación Maestro-Esclavo para optimizar el rendimiento y la tolerancia a fallos."]

## 💡 II. Justificación e Importancia

Explica por qué este proyecto es relevante para una infraestructura universitaria o empresarial. Menciona los problemas de la continuidad operacional (T1) o la seguridad (T5) que resuelve.

> **Justificación:** [Explicar la justificación, ej: "El proyecto elimina el Single Point of Failure en la BD, aplicando conceptos de Alta Disponibilidad (T2) y mejorando la capacidad de respuesta de aplicaciones con muchas consultas de lectura."]

## 🛠️ III. Tecnologías y Conceptos Implementados

### 3.1. Tecnologías Clave

Enumera y describe brevemente el rol de cada software y tecnología utilizada.

* **[Tecnología 1, ej: Nginx]:** [Función específica: Proxy Inverso y Balanceo de Carga con Rate Limiting.]
* **[Tecnología 2, ej: MariaDB]:** [Función específica: Servidor de Base de Datos principal con replicación.]
* **[Tecnología 3, ej: Keepalived]:** [Función específica: Implementación de VRRP para Failover de la IP Virtual (HA).]
* **[Tecnología 4, ej: Ansible/Bash]:** [Función específica: Automatización del despliegue y la configuración de hardening.]
* **[Tecnología 5, ej: Prometheus/Grafana]:** [Función específica: Monitoreo y visualización de métricas de rendimiento/tráfico.]

### 3.2. Conceptos de la Asignatura Puestos en Práctica (T1 - T6)

Marca con un ✅ los temas avanzados de la asignatura que fueron implementados:

* **Alta Disponibilidad (T2) y Tolerancia a Fallos:** [Describir cómo: Ej. Replicación DB y uso de Keepalived para failover.]
* **Seguridad y Hardening (T5):** [Describir cómo: Ej. Uso de Firewall (UFW), Hardening SSH, Certificados SSL/TLS.]
* **Automatización y Gestión (T6):** [Describir cómo: Ej. Scripts de Backup (DRP) o Playbooks de Ansible para la configuración.]
* **Balanceo de Carga/Proxy (T3/T4):** [Describir cómo: Ej. Nginx/HAProxy para distribución de tráfico y health checks.]
* **Monitoreo (T4/T1):** [Describir cómo: Ej. Uso de Prometheus/Grafana para métricas en tiempo real.]
* **Networking Avanzado (T3):** [Describir cómo: Ej. Implementación de VLANs o Enrutamiento Estático.]

## 🌐 IV. Diseño de la Infraestructura y Topología

### 4.1. Diseño Esquemático

Incluye un diagrama de la topología final. Muestra claramente la segmentación de red, las IPs utilizadas, y los flujos de tráfico.

> 
| VM/Host | Rol | IP Física | IP Virtual (si aplica) | Red Lógica | SO |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **VM-LB-M** | Proxy / Load Balancer MASTER | 192.168.10.2 | 192.168.10.1 (VIP) | Red 10 | Ubuntu 22.04 |
| **VM-DB-M** | Base de Datos (Maestro) | 192.168.20.2 | N/A | Red 20 | Debian 12 |
| **VM-DB-S** | Base de Datos (Esclavo) | 192.168.20.3 | N/A | Red 20 | Debian 12 |
| **VM-MON** | Monitoreo (Grafana/Prometheus) | 192.168.10.3 | N/A | Red 10 | Ubuntu 22.04 |

### 4.2. Estrategia Adoptada (Opcional)

Describe la estrategia de diseño y las decisiones críticas.

* **Estrategia de Replicación:** [Ej. Se optó por la replicación asíncrona de MariaDB debido a la menor latencia, priorizando la separación de lectura/escritura con ProxySQL.]
* **Estrategia de Hardening:** [Ej. Se aplicaron los estándares CIS de hardening mediante un playbook de Ansible para la automatización de la seguridad inicial.]

## 📋 V. Guía de Implementación y Puesta en Marcha

Documenta los pasos esenciales para que cualquier persona pueda replicar el proyecto (instalación, configuración de ficheros clave, comandos).

### 5.1. Pre-requisitos
* [Ej. 4 VMs con Ubuntu 22.04 y acceso root/sudo.]
* [Ej. Repositorio git clonado en cada VM.]

### 5.2. Despliegue (Ejecución de la Automatización)
1.  **Instalación:** Instalar Ansible en la máquina de control.
2.  **Configuración:** Editar el archivo de inventario (`hosts.ini`) con las IPs.
3.  **Ejecución:** Ejecutar el playbook principal: `ansible-playbook setup.yml`.

### 5.3. Ficheros de Configuración Clave
* `/etc/ansible/playbooks/db_cluster.yml`: Playbook para la replicación y ProxySQL.
* `/etc/nginx/sites-available/proxy.conf`: Configuración del Balanceador y Hardening TLS.
* `/etc/keepalived/keepalived.conf`: Configuración del Failover (MASTER/BACKUP).

**Incluir además los archivos de configuración y software a utilizar dentro del proyecto y organizados en carpetas.**

## ⚠️ VI. Pruebas y Validación

| Prueba Realizada | Resultado Esperado | Resultado Obtenido |
| :--- | :--- | :--- |
| Test de Failover de la BD (Apagar Maestro) | El esclavo debe tomar las escrituras o el servicio debe seguir activo. | [OK/FALLIDO] |
| Prueba de Carga/Estrés (Balanceo) | El tráfico se distribuye equitativamente entre los servidores de aplicación. | [OK/FALLIDO] |
| Test de Seguridad (SSL/Firewall) | El acceso HTTP debe redirigirse a HTTPS y el Firewall debe bloquear todos los puertos excepto 443. | [OK/FALLIDO] |

## 📚 VII. Conclusiones y Lecciones Aprendidas

[Resumen de los principales logros y desafíos técnicos superados. ¿Qué harían diferente?]
