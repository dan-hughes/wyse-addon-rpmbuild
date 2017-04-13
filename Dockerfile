FROM centos:7
MAINTAINER "Daniel Hughes" <dan.hughess@gatwickairport.com>
RUN yum clean metadata \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install rpm-build tito mock git rpmdevtools squahsfs-tools tar make yum-utils \
    && yum -y update \
    && yum clean all \
    && package-cleanup --oldkernels --count=1 \
    && rm -rf /var/cache/*

RUN useradd -m rpmbuild && \
    echo "rpmbuild ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rpmbuild

USER rpmbuild
WORKDIR /home/rpmbuild

CMD ["/bin/bash"]