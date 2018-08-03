echo "${_USER}:x:${_UID}:${_UID}:${_USER},,,:/home/${_USER}:/bin/bash" >> /etc/passwd && \
echo "${_USER}:x:${_UID}:" >> /etc/group && \
chown $_UID:$_UID -R /home/$_USER
su $_USER <<'EOF'
if [ ! -d "/home/${_USER}/app/node_modules" ]; then
    (cd /home/$_USER/app; npm install; )
fi
/home/$_USER/app/node_modules/electron/dist/electron  /home/$_USER/app;
EOF
