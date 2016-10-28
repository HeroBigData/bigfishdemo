start /wait cmd /c install_sql.bat
del install_sql.bat
start /wait cmd /c ant build
ant run-install-seed