# Meu Projeto Docker com Spring Boot e Azure

Este projeto é uma aplicação Spring Boot empacotada em um contêiner Docker, utilizando o Azure como banco de dados. Este README fornece instruções detalhadas para configurar, executar e testar a aplicação.

## Pré-requisitos

Antes de começar, verifique se você tem os seguintes itens instalados:

- [Docker](https://www.docker.com/get-started)
- [Java JDK 17](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html)
- [Maven](https://maven.apache.org/download.cgi)

## Estrutura do Projeto

A estrutura do projeto é a seguinte:

```
meu_projeto_docker/
├── Dockerfile
├── pom.xml
├── src/
└── application.properties
```

## Configuração do Banco de Dados

Certifique-se de que o Azure está configurado corretamente para usar como banco de dados. O arquivo `application.properties` deve conter as informações corretas de conexão. Aqui está um exemplo de como pode ser:

```properties
spring.datasource.url=jdbc:sqlserver://<URL_DO_AZURE>:<PORTA>;databaseName=<NOME_DO_BANCO>
spring.datasource.username=<USUÁRIO>
spring.datasource.password=<SENHA>
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

## Dockerfile

Aqui está o conteúdo do seu `Dockerfile`:

```dockerfile
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
```

## Construindo o Projeto

Para construir o projeto, navegue até o diretório do projeto e execute o comando:

```bash
mvn clean package
```

Este comando irá gerar um arquivo JAR no diretório `target/`.

## Construindo a Imagem Docker

Após a construção do projeto, crie a imagem Docker com o seguinte comando:

```bash
docker build -t meu_projeto_docker .
```

## Executando o Container

Para executar o container, use o comando:

```bash
docker run -d -p 8080:8080 meu_projeto_docker
```

## Testando a Aplicação

Abra o seu navegador e acesse:

```
http://localhost:8080
```

Se a aplicação estiver funcionando corretamente, você deverá ver a resposta da sua aplicação Spring Boot.

## Verificando Logs do Container

Caso a aplicação não esteja funcionando, você pode verificar os logs do container com o seguinte comando:

```bash
docker logs <container_id>
```

Substitua `<container_id>` pelo ID do seu container, que pode ser obtido com:

```bash
docker ps -a
```

## Conclusão

Este projeto é uma demonstração de como configurar uma aplicação Spring Boot usando Docker e Azure como banco de dados. Sinta-se à vontade para personalizar e expandir conforme suas necessidades.
