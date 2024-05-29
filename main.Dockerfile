# docker build -f main.Dockerfile -t devbro1/url_to_pdf:latest .
# docker image inspect devbro1/url_to_pdf:latest --format='{{.Size}}' | awk '{size=$1/1024/1024; printf "%.2fMB\n", size}'
# docker push devbro1/url_to_pdf:latest

# docker run -p 9000:80 --env ALLOW_HTTP=true --env NODE_ENV=true --env PORT=80 devbro1/url_to_pdf:latest
FROM --platform=linux/amd64 ghcr.io/puppeteer/puppeteer:latest

USER root
WORKDIR /app/
COPY . /app/

RUN npm i
RUN npx puppeteer browsers install chrome
# RUN cp .env.sample .env
# RUN chown -R pptruser:pptruser .
# RUN apt update & apt install -y setcap
# RUN setcap 'cap_net_bind_service=+ep' $(which node)
# RUN apt-get update && apt install -y netstat
# USER pptruser

EXPOSE 80
CMD [ "node", "./src/index.js" ]