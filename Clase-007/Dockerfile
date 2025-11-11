FROM tomcat:10.1-jdk17

# Eliminar las aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar tu aplicación
COPY JSP/ /usr/local/tomcat/webapps/ROOT/

# Exponer el puerto
EXPOSE 8080

# Tomcat se inicia automáticamente