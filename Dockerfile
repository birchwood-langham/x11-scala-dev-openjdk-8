FROM birchwoodlangham/x11-ubuntu-mate-base:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install openjdk-8-jdk openjdk-8-source openjdk-8-doc openjdk-8-dbg && \
    wget https://dl.bintray.com/sbt/debian/sbt-1.2.3.deb && \
    wget http://downloads.lightbend.com/scala/2.12.7/scala-2.12.7.deb && \
    dpkg -i sbt-1.2.3.deb && \
    dpkg -i scala-2.12.7.deb && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    rm *.deb

RUN mkdir -p /opt/idea && \
    wget https://download.jetbrains.com/idea/ideaIU-2018.2.4-no-jdk.tar.gz && \
    tar -C /opt/idea -zxf ideaIU-2018.2.4-no-jdk.tar.gz --strip-components=1 && \
    rm ideaIU-2018.2.4-no-jdk.tar.gz

RUN echo '[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=IntelliJ IDEA Ultimate Edition\n\
Icon=/opt/idea/bin/idea.png\n\
Exec="/opt/idea/bin/idea.sh" %f\n\
Comment=Capable and Ergonomic IDE for JVM\n\
Categories=Development;IDE;\n\
Terminal=false\n\
StartupWMClass=jetbrains-idea\
' > /usr/share/applications/jetbrains-idea.desktop
