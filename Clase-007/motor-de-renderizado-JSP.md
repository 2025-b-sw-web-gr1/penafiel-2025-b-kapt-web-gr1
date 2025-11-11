# JSP
JSP (JavaServer Pages) es una tecnología que permite generar contenido HTML dinámico en el servidor. Funciona mezclando HTML con código Java, lo que facilita crear páginas web interactivas.

## Funcionamiento del Motor de Renderizado JSP
Flujo de ejecución:
1. Cliente solicita un archivo .jsp
2. Servidor recibe la petición
3. Motor JSP convierte el archivo .jsp en código Java (servlet)
4. Compilación del código Java a bytecode
5. Ejecución en la JVM (Java Virtual Machine)
6. Respuesta HTML se envía al cliente

Componentes clave:
- Expresiones: ```<%= variable %>```
- Scriptlets: ```<% código Java %>```
- Directivas: ```<%@ page ... %>```
- Acciones: ```<jsp:useBean />```, ```<jsp:include />```

## Configuracion:

1. Requisitos previos
```bash
# Instalar Java
sudo apt update
sudo apt install openjdk-11-jdk

# Verificar instalación
java -version
```

2. Instalar tomcat (servidor JSP)

```bash
# Descargar Tomcat
cd /opt
sudo wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.70/apache-tomcat-9.0.70.tar.gz

# Extraer
sudo tar -xzf apache-tomcat-9.0.70.tar.gz
sudo mv apache-tomcat-9.0.70 tomcat

# Dar permisos
sudo chown -R $USER:$USER /opt/tomcat
```

3. Iniciar Tomcat

```bash
# Navegar al directorio
cd /opt/tomcat/bin

# Hacer ejecutables los scripts
chmod +x *.sh

# Iniciar servidor
./startup.sh

# Verificar en el navegador
# http://localhost:8080
```

## Uso: crear JSP

Crear archivo

```bash
mkdir -p /opt/tomcat/webapps/ROOT/ejemplos
nano /opt/tomcat/webapps/ROOT/ejemplos/hola.jsp
```

Acceso: Abrir en el navegador ```http://localhost:8080/ejemplos/hola.jsp```

## Comandos utiles

```bash
# Ver logs
tail -f /opt/tomcat/logs/catalina.out

# Detener Tomcat
/opt/tomcat/bin/shutdown.sh

# Reiniciar
/opt/tomcat/bin/shutdown.sh
sleep 2
/opt/tomcat/bin/startup.sh
```