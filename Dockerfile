FROM centos:7
RUN yum install httpd -y
COPY index.html /var/www/html/
EXPOSE 10101
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
