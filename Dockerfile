FROM centos:latest
MAINTAINER by medivh
RUN rm -f /etc/localtime  && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && mkdir  /usr/local/java && useradd joy
#相对路径jar,把java添加到容器中
ADD jre-8u191-linux-x64.tar.gz /usr/local/java/

#配置java环境变量
ENV JAVA_HOME /usr/local/java/jdk1.8.0_91
ENV JRE_HOME $JAVA_HOME/bin
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
ENV PATH $JAVA_HOME/bin:$PATH

USER joy
RUN mkdir /home/joy/logs && mkdir /home/joy/src
