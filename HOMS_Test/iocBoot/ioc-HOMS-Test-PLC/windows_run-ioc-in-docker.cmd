
@echo Your development environment Net ID is: 134.79.82.38.1.1

@echo You must fully exit TwinCAT for this IOC to work.
@echo Please close TwinCAT now and
@pause

"C:/Program Files/Docker/Docker/resources/bin/docker.exe" run ^
        -v "c:\Repos\ads-deploy\tools\:/ads-deploy" ^
        -v "C:\Users\sheppard\Documents\Visual Studio 2013\Projects\HOMS_Test\HOMS_Test\\:/reg/g/pcds/epics/ioc/HOMS_Test" ^
        -i pcdshub/ads-deploy:latest ^
        "make -C ${ADS_IOC_PATH}/iocBoot/templates && cd '/reg/g/pcds/epics/ioc/HOMS_Test/iocBoot/ioc-HOMS-Test-PLC' && make && sed -i '/^adsIoc_registerRecord.*$/a adsSetLocalAddress(134.79.82.38.1.1)' st.cmd && ./st.cmd"
