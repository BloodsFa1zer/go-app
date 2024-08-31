FROM golang:1.23-alpine

WORKDIR /go-app

COPY go.mod go.sum ./

RUN go mod tidy # download all the dependencies from go.mod and go.sum

COPY . .

RUN go build -o main ./main.go

RUN chmod +x main

EXPOSE 4040

CMD [ "./main" ]