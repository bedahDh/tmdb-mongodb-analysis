@echo off
cd "C:\Program Files\MongoDB\Server\8.2\bin"

start cmd /k mongod --shardsvr --replSet shard1Repl --port 27018 --dbpath C:\tmdb_data\shard1_primary --bind_ip localhost
start cmd /k mongod --shardsvr --replSet shard1Repl --port 27020 --dbpath C:\tmdb_data\shard1_secondary --bind_ip localhost