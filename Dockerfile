FROM centos:8 
LABEL authors="Alex Lemenze" \
      description="Docker image for BCL2FASTQ and cellranger"
      #Derived from hub.docker.com/r/ngsbioinformatics/cellranger/dockerfile

RUN yum install -y \
      wget \
      which \
      unzip

# BCL2FASTQ v2.2
RUN cd /tmp/ && \
    wget -O bcl2fastq2-v2-20-0-linux-x86-64.zip "https://files.softwaredownloads.illumina.com/e8ed3335-5201-48ff-a2bc-db4bfb792c85/bcl2fastq2-v2-20-0-linux-x86-64.zip?Expires=1612811594&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9maWxlcy5zb2Z0d2FyZWRvd25sb2Fkcy5pbGx1bWluYS5jb20vZThlZDMzMzUtNTIwMS00OGZmLWEyYmMtZGI0YmZiNzkyYzg1L2JjbDJmYXN0cTItdjItMjAtMC1saW51eC14ODYtNjQuemlwIiwiQ29uZGl0aW9uIjp7IkRhdGVMZXNzVGhhbiI6eyJBV1M6RXBvY2hUaW1lIjoxNjEyODExNTk0fX19XX0_&Signature=NSbFHF57VwlRFCGqj9ZBgrcjafnatfw~bvWyjGQ9TFqLXfTZrPpqPestn~Bc4hgTuio0ARDBkwsaQDoAgxGjLHsKj-LPqRu7stllkj3XsXMwOzbgwlyeXle-7VJ3hsGXT~HQxfAM~Uw3t1VpaRf1QOcdYx~eLRe49U99CWYkqpjtKkBp-~m8a~QN8MRVrd7zSDpiZqlT2ZBjOAfQ~5~H8Yx7C3ElYADc6YoSfXJ35zvoSCs4A7jvGRf5eK-PkKkhuGyc95DDK3WrzbMj37QiH~jN~vFi6NRU4tnazwZ-MSF44CkRc6BthrUfutkwn1Lo90TTqHPVTy7Le2XrQZCEWw__&Key-Pair-Id=APKAJO3UYWPXK4A26FPQ" && \
    unzip bcl2fastq2-v2-20-0-linux-x86-64.zip && \
    yum install -y --nogpgcheck bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm && \
    rm -f bcl2fastq2-v2-20-0-linux-x86-64.zip bcl2fastq2-v2.20.0.422-Linux-x86_64.rpm

# cellranger v5.0
RUN cd /opt/ && \
    wget -O cellranger-5.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-vdj/cellranger-5.0.1.tar.gz?Expires=1612854373&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC12ZGovY2VsbHJhbmdlci01LjAuMS50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MTI4NTQzNzN9fX1dfQ__&Signature=COfUk4SQ~a~pZvdh1xsvgtXUpT~txN1c98CSJRA3JHsbVoyF2hvkrvGudAvQQntYMsA8jPZa0DaecS7yp2eGcxqZA12jJAyciYIWGWsbjXMX3-gHYD7YmBA6ZQRQYu5MjphUT5ABn6g9-qlZfAdrhMMjVqDT7bp3zvGo53eLCXnSJOIug8wqTcHEsn8RdIFPJ3BDwOV8PAowdlJHAdsTObmi8PPsCD00lcqpQRwnDQdWaGiGiHjOIBnhbWlkTZcEheZe-dn71VsPConoAllZIQLYEezxBKr88RtljScDXWHCwXL75mQFY6lEh7vMtAD2cf4KWlkls21Yi0iupTUM0g__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA" && \
    tar zxvf cellranger-5.0.1.tar.gz && \
    rm -f cellranger-5.0.1.tar.gz

#export the path
ENV PATH /opt/cellranger-5.0.1:$PATH
