@echo off
cd "C:\Program Files\MongoDB\Server\8.2\bin"
mongod --configsvr --replSet configRepl --port 27019 --dbpath C:\tmdb_data\config --bind_ip localhost
pause