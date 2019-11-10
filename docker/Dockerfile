FROM openptrack/open_ptrack
LABEL maintainer="Paul Alkemade & Kyaing Thiha"

# Install node js within the container, code has been referenced from
# StackExchange thread, https://askubuntu.com/questions/720784/how-to-install-latest-node-inside-a-docker-container
# in answer posted by user Tomasz
RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash
RUN apt-get -y install nodejs 

# Clone fetchbot repo
RUN git clone https://github.com/kyaing-thiha/fetchbot.git HAE \
    && cd HAE/docker \
    && chmod +x start.sh

# Install node js script dependency
RUN cd /root/HAE \
    && npm install minimist

# Change open_ptrack udp endpoint address to loopback
RUN sed -i '4s/.*/  hostip: "127.0.0.1"/' /root/open_ptrack/opt_utils/conf/json_udp.yaml