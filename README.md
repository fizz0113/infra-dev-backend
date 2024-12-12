# infra-dev-backend

`infra-dev-backend` 是一個後端開發者的基礎設施建設項目，集成了一些我使用過的服務，能為後端開發者快速搭建開發環境。通過 Docker Compose 管理服務。

## 目錄說明

```
.
├── kafka/ # Kafka 容器的資料及設定
├── zookeeper/ # Zookeeper 容器的資料及設定 (kafka-old的依賴項)
├── kafka-old/ # Kafka 容器的資料及設定 (舊版 kafka 需要 Zookeeper 才能夠執行)
├── mongodb/ # MongoDB 容器的資料及設定
├── mysql/ # MySQL 容器的資料及設定
├── postgress/ # PostgreSQL 容器的資料及設定
├── rabbitmq/ # RabbitMQ 容器的資料及設定
├── redis/ # Redis 容器的資料及設定
├── ws-go/ # golang 開發環境, 可以透過 hostname 存取相關的服務
└── docker-compose.yml # Docker Compose 設定儲存
```

## 使用方式

執行

```
docker compose up -d
```

看狀態

```
ian@ian-NUC10i5FNH:~/repos/infra-dev-backend$ docker compose ps
NAME                IMAGE                           COMMAND                  SERVICE             CREATED             STATUS              PORTS
dev.adminer         adminer                         "entrypoint.sh docke…"   adminer             8 days ago          Up About a minute   0.0.0.0:8080->8080/tcp, :::8080->8080/tcp
dev.kafka           dev.kafka:0.1                   "/__cacert_entrypoin…"   kafka               8 days ago          Up About a minute   9092/tcp, 19092/tcp
dev.kafka-node1     dev.kafka:0.1                   "/__cacert_entrypoin…"   kafka-node1         8 days ago          Up About a minute   9092/tcp, 19092/tcp
dev.kafka-node2     dev.kafka:0.1                   "/__cacert_entrypoin…"   kafka-node2         8 days ago          Up About a minute   9092/tcp, 19092/tcp
dev.kafka-old       dev.kafka-old:0.1               "/etc/confluent/dock…"   kafka-old           8 days ago          Up About a minute   9092/tcp
dev.kafka-ui        provectuslabs/kafka-ui:latest   "/bin/sh -c 'java --…"   kafka-ui            8 days ago          Up About a minute   0.0.0.0:16080->8080/tcp, :::16080->8080/tcp
dev.mongo-express   mongo-express:latest            "/sbin/tini -- /dock…"   mongo-express       7 days ago          Up 7 days           0.0.0.0:16082->8081/tcp, :::16082->8081/tcp
dev.mongodb         dev.mongodb:0.1                 "docker-entrypoint.s…"   mongodb             7 days ago          Up 7 days           27017/tcp
dev.mysql           dev.mysql:0.1                   "docker-entrypoint.s…"   mysql               8 days ago          Up About a minute   3306/tcp, 33060/tcp
dev.postgres        dev.postgres:0.1                "docker-entrypoint.s…"   postgres            8 days ago          Up About a minute   5432/tcp
dev.rabbitmq        dev.rabbitmq:0.1                "docker-entrypoint.s…"   rabbitmq            8 days ago          Up About a minute   4369/tcp, 5552/tcp, 5671-5672/tcp, 15671/tcp, 15691-15692/tcp, 25672/tcp, 0.0.0.0:15672->15672/tcp, :::15672->15672/tcp
dev.redis           dev.redis:0.1                   "docker-entrypoint.s…"   redis               8 days ago          Up About a minute   6379/tcp
dev.redisinsight    redis/redisinsight:latest       "./docker-entry.sh n…"   redisinsight        8 days ago          Up About a minute   0.0.0.0:16081->5540/tcp, :::16081->5540/tcp
dev.ws-go           dev.ws-go:0.1                   "service ssh start -D"   ws-go               8 days ago          Up 8 days           0.0.0.0:40022->22/tcp, :::40022->22/tcp
dev.zookeeper       dev.zookeeper:0.1               "/etc/confluent/dock…"   zookeeper           8 days ago          Up About a minute   2181/tcp, 2888/tcp, 3888/tcp
```

## 服務說明

* ws-go

  golang 的開發環境, 預設可以從 ssh port 40022 進行連線

  ```
  ssh -p 40022 root@localhost
  ```

* kafka-ui

  Kafka 的 Web UI 管理工具，提供可視化界面來管理 Kafka 集群。預設可以通過地址訪問：http://localhost:16080

* kafka

  Kafka 消息列隊服務，預設監聽在 `kafka:9092`埠。

* kafka-node1

  Kafka 消息列隊群集節點1，與`kafka-node2`組成，預設監聽在 `kafka-node1:9092`埠。

* kafka-node2

  Kafka 消息列隊群集節點2，與`kafka-node1`組成，預設監聽在 `kafka-node2:9092`埠。

* mongo-express

  MongoDB 的 Web UI 管理工具，提供可視化界面來管理 MongoDB 資料庫。預設可以通過地址訪問：http://localhost:16082

* mongodb

  MongoDB 資料庫服務，預設監聽在 `mongodb:27017` 埠。

* adminer
  
  Adminer 資料庫管理工具，提供可視化界面來管理資料庫。預設可以通過地址訪問：http://localhost:8080

* mysql

  MySQL 資料庫服務，預設監聽在 `mysql:3306` 埠。

* postgres

  PostgreSQL 資料庫服務，預設監聽在 `postgres:5432` 埠。

* rabbitmq

  RabbitMQ 消息隊列服務，預設監聽在 `rabbitmq:5672` 埠。
  提供管理界面，預設可以通過地址訪問：http://localhost:15672

* redis

  Redis 快取服務，預設監聽在 `redis:6379` 埠。

* redisinsight

  Redis 的 Web UI 管理工具，提供可視化界面來管理 Redis。預設可以通過地址訪問：http://localhost:16081

* zookeeper

  Zookeeper 分佈式協調服務，預設監聽在 `zookeeper:2181` 埠。

* kafka-old

  Kafka 消息列隊服務，預設監聽在 `kafka-old:9092`埠。

