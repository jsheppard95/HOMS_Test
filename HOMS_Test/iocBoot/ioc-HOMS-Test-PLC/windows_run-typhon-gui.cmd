@echo off
echo Starting Typhon...
echo on

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy/tools" ^
        -v "C:\Users\sheppard\Documents\Visual Studio 2013\Projects\HOMS_Test\HOMS_Test\\:/reg/g/pcds/epics/ioc/HOMS_Test" ^
	-e DISPLAY=host.docker.internal:0.0 ^
	-i pcdshub/ads-deploy:latest ^
	"cd '/reg/g/pcds/epics/ioc/HOMS_Test/iocBoot/ioc-HOMS-Test-PLC' && pytmc stcmd --template-path /ads-deploy/tools/templates --template typhon_display.py --only-motor """/reg/g/pcds/epics/ioc/HOMS_Test/HOMS_Test.tsproj""" > /tmp/display.py && echo 'Running Typhon...' && python /tmp/display.py; sleep 1"
