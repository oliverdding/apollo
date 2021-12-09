FROM oliverdd/apollo:base

RUN export SDKMAN_DIR=/root/.local/share/sdkman && curl -s "https://get.sdkman.io" | bash && \
    sed -i 's/sdkman_auto_answer=false/sdkman_auto_answer=true/' /root/.local/share/sdkman/etc/config
