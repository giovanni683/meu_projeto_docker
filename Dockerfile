# Usar uma imagem base do OpenJDK 17
FROM openjdk:17-jdk-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copiar o arquivo JAR gerado para o diretório /app
COPY target/meu_projeto_docker-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta 8080 para o Spring Boot
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
