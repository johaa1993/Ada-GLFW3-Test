:loop
del /s /q bin\test.exe
gprbuild -p main.gpr
pause
cd bin
test.exe
cd ..
pause
goto loop