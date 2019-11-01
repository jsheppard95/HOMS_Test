@echo You need to cd $EPICS_BASE/bin/rhel7-x86_64
@echo Run also ./caRepeater&
@echo Then ./caget (pvname) etc.

docker run --entrypoint /bin/bash -it pcdshub/ads-deploy:latest

pause