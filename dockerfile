FROM golang as build

WORKDIR /src/app

COPY . .

RUN go build -v -o ./build/main

FROM scratch
COPY --from=build  /src/app/build /app/go

WORKDIR /app/go

CMD [ "./main" ]
