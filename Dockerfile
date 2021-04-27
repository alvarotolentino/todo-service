FROM alpine
WORKDIR /app
ADD target/release/todo-service .
CMD ["/app/todo-service"]