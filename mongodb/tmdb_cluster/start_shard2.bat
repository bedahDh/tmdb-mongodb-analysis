@echo off
cd "C:\Program Files\MongoDB\Server\8.2\bin"

start cmd /k mongod --shardsvr --replSet shard2Repl --port 27021 --dbpath C:\tmdb_data\shard2_primary --bind_ip localhost
start cmd /k mongod --shardsvr --replSet shard2Repl --port 27022 --dbpath C:\tmdb_data\shard2_secondary --bind_ip localhost