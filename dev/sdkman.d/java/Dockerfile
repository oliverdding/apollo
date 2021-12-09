FROM oliverdd/apollo:sdkman

RUN /bin/bash -c 'export SDKMAN_DIR=/root/.local/share/sdkman && \
    source "/root/.local/share/sdkman/bin/sdkman-init.sh" && \
    sdk install java 8.0.312-zulu && \
    sdk default java 8.0.312-zulu && \
    sdk install gradle 7.3.1 && \
    sdk default gradle 7.3.1 && \
    rm -rf /root/.local/share/sdkman/tmp/*'
