# Rust TODO Api Service
This is a TODO Rest Api based in Rust with Postgres as database.

## How to run the service?

Execute the following command:

```
docker-compose up -d
```

After that two services will be created:

- __api__: A Rust service which expose the port 8080
- __db__: A postgres service which is created and initialized with a script (01.init.sh)

## How to test the service?

Below some requests:

- GET http://localhost/ HTTP/1.1

- GET http://localhost/todos HTTP/1.1

- GET http://localhost/todos/1/items HTTP/1.1

- PUT http://localhost/todos/1/items/2 HTTP/1.1

  Conten-Type: application/json

  {"success": false}

- POST http://localhost:8080/todos HTTP/1.1

  Content-Type: application/json

  {"title": "List 3"}

## How to stop the service?

Execute the following command:

```
docker-compose down
```