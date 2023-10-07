FROM quay.io/kubespray/kubespray:v2.23.0 AS helper

ENV TERRAFORM_VERSION=1.6.0

RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/* && \ 
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d / && \
    rm /terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM quay.io/kubespray/kubespray:v2.23.0

COPY --from=helper /terraform /usr/local/bin
