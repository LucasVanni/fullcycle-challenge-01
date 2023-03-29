FROM golang:alpine3.17 as Builder

WORKDIR /var/www

COPY . /var/www

RUN go build -o . hello.go


# Imagem leve
FROM hello-world

WORKDIR /var/www

COPY --from=Builder /var/www/ /var/www

CMD ["./hello"]

