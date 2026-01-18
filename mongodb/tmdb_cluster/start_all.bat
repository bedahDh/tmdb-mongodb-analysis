@echo off

start cmd /k C:\tmdb_cluster\start_config.bat
timeout /t 5

start cmd /k C:\tmdb_cluster\start_shard1.bat
timeout /t 5

start cmd /k C:\tmdb_cluster\start_shard2.bat
timeout /t 5

start cmd /k C:\tmdb_cluster\start_mongos.bat