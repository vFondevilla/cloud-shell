FROM ubuntu:20.04
RUN apt-get update && apt-get install -y wget \
unzip \
ssh \
jq \
&& rm -rf /var/lib/apt/lists/*
WORKDIR /tmp
RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip && unzip terraform_0.12.24_linux_amd64.zip && mv terraform /usr/bin/ && rm terraform_0.12.24_linux_amd64.zip
RUN wget https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && unzip awscli-exe-linux-x86_64.zip && ./aws/install && rm awscli-exe-linux-x86_64.zip
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v0.9.1/terraform-docs-v0.9.1-linux-amd64 && mv terraform-docs-v0.9.1-linux-amd64 /usr/bin/terraform-docs && chmod +x /usr/bin/terraform-docs
RUN wget https://cache.agilebits.com/dist/1P/op/pkg/v0.10.0/op_linux_amd64_v0.10.0.zip && unzip op_linux_amd64_v0.10.0.zip && mv op /usr/bin/op && chmod +x  /usr/bin/op
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.18.2/bin/linux/amd64/kubectl && chmod +x kubectl && mv kubectl /usr/bin

ENV AWS_DATA_PATH=/localhost/.aws
ENV AWS_CONFIG_FILE=${AWS_DATA_PATH}/config
ENV AWS_SHARED_CREDENTIALS_FILE=${AWS_DATA_PATH}/credentials
ENV KUBECONFIG=/localhost/.kube/config