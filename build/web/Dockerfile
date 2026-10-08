# Overlay of SKF labs' python/JWT-null/Dockerfile (vendored unchanged in app/). Differences:
# - COPY ./ becomes COPY app/ (the vendored lab sits in app/ of this build folder);
# - templates/index.html is edited in the image so that its script calls /auth and /protected on the
#   page's own host and port instead of a hard-coded port 5000 (the lab is published on 5050, since
#   macOS keeps 5000 for AirPlay).

### Static layers

FROM alpine:3.7 AS skf-alpine37
LABEL Glenn ten Cate <glenn.ten.cate@owasp.org>

# Installing needed binaries and deps. Then removing unneeded deps:
RUN apk update --no-cache && apk add python3 python3-dev py3-pip bash git dos2unix

### Dynamic layers
FROM skf-alpine37
LABEL Glenn ten Cate <glenn.ten.cate@owasp.org>

RUN addgroup -g 1000 app 
RUN adduser -u 1000 -G app -D -h /home/app app
RUN rm -rf /var/cache/apk/APKINDEX*

COPY app/ /home/app/JWT-null

# Switching to the new app location:
WORKDIR /home/app/JWT-null

# Overlay: the page's script calls the API on port 5000 of the page's host; call the page's own host and port.
RUN sed -i 's|"http://" + host + ":5000/|"//" + window.location.host + "/|' templates/index.html \
  && ! grep -q ':5000/' templates/index.html

RUN chown -R app:app /home/app/JWT-null

# Switching to the limited user
USER app

# Installing needed binaries and deps
RUN pip3 install --no-cache-dir  --user -r requirements.txt 

# Fixing Windows line endings for our students:
RUN find . -name "*.sh" -o -name "*.py" -o -name "*.css" -o -name "*.js" | xargs dos2unix

# Setting chmod +x on the scripts:
RUN find . -name "*.sh" -o -name "*.py" | xargs chmod +x

# Starting the actual application:
ENTRYPOINT [ "python3", "./JWT-null.py" ]
