@echo off
cd "C:\Program Files\MongoDB\Server\8.2\bin"
mongos --configdb configRepl/localhost:27019 --port 27017 --bind_ip localhost
pause