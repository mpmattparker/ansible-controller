FROM ubuntu

# Install Necessary Packages
RUN apt update; \
    apt install -y python3 python3-pip; \
    apt install -y software-properties-common; \
    apt install -y curl; \
    apt clean all;

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install ansible with pip
RUN pip3 install ansible; \
    pip3 install ansible[azure]; \
    pip3 install ansible-lint; \
    pip3 install pywinrm

# Copy ansible files
RUN mkdir /etc/ansible;
COPY /ansible/ /etc/ansible/

# Copy entrypoint script
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh