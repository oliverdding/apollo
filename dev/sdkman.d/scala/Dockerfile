FROM oliverdd/apollo:java

RUN export SDKMAN_DIR=/root/.local/share/sdkman && \
    source "/root/.local/share/sdkman/bin/sdkman-init.sh" && \
    sdk install scala 2.11.12 && \
    sdk install scala 2.12.15 && \
    sdk default scala 2.11.12 && \
    sdk install sbt 1.3.8 && \
    sdk default sbt 1.3.8 && \
    rm -rf /root/.local/share/sdkman/tmp/*
