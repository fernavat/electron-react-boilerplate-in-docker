FROM node:latest
RUN apt-get update -y && \
    apt-get install -y libgtk2.0-0 && \
    apt-get install -y libcanberra-gtk-module && \
    apt-get install -y libx11-xcb1 -y && \
    apt-get install -y libnotify-dev && \
    apt-get install -y libgconf-2-4 && \
    apt-get install -y libnss3 && \
    apt-get install -y libxss1
COPY ["./entryScript.sh", "/opt/entryScript.sh"]
RUN chmod +x /opt/entryScript.sh
ENTRYPOINT ["/bin/bash", "/opt/entryScript.sh"]
