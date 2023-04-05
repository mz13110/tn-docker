from node:19

ENV REPO_URL=
ENV PORT=8080

RUN apt-get install git -y

WORKDIR /usr/app/
RUN git clone $REPO_URL
COPY main.sh main.sh

RUN npm install
RUN npm run build

EXPOSE ${PORT}/tcp

CMD ["/bin/sh", "main.sh"]