# fix a specific version for reproducability
FROM debian:bookworm-20230919

RUN apt-get update && apt-get install -y \
    sudo curl wget bash vim htop tree fontconfig libfreetype6 \
    libxext6 libxrender1 libxtst6 libfreetype6 libxi6

############################################################################################
################################### set up user ##################################
############################################################################################

# create user "user" without a password
RUN useradd -m user && echo "user:password" | chpasswd && adduser user sudo
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

WORKDIR /app


############################################################################################
################################ Set up IntelliJ ##################################
############################################################################################

RUN wget https://download.jetbrains.com/idea/code-with-me/backend/jetbrains-clients-downloader-linux-x86_64-1867.tar.gz
RUN tar -xvzf jetbrains-clients-downloader-linux-x86_64-1867.tar.gz
RUN cd /app/jetbrains-clients-downloader-linux-x86_64-1867/bin && /bin/bash jetbrains-clients-downloader --products-filter IU --build-filter 233.13135.103 --include-eap-builds --platforms-filter linux-x64 --download-backends /app/backends
RUN cd /app/backends/backends/IU && tar -xvf ideaIU-2023.3.2.tar.gz --directory /app
# cleanup
RUN rm -rf jetbrains-clients-downloader-linux-x86_64-1867* backends

############################################################################################
################################ Apply the neo2-awk-hack ##################################
############################################################################################

# COPY ./apply_neo2_awk_hack.sh /app/apply_neo2_awk_hack.sh
# RUN /app/apply_neo2_awk_hack.sh
# RUN rm /app/apply_neo2_awk_hack.sh

ENTRYPOINT ["/app/idea-IU-233.13135.103/bin/jetbrains_client.sh"]
