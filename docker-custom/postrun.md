1. initialize
```
docker run -d -i -t --rm --name=<name> -v <mount point>:/data <image>:<version>
docker exec -u node-red <name> npm install --prefix=/data --production
docker stop <name>
```

2. start main service
```
docker run ...
```

3. enable ssh service (optional)
```
docker exec -u root <container> /usr/sbin/sshd -p 22
docker exec -u root <container> /usr/bin/chpass.sh <password>
```
