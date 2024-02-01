FROM node:20-alpine

WORKDIR /strapi

COPY novadata-strapi/. .

RUN yarn --frozen-lockfile

EXPOSE 1337

ENV HOST 0.0.0.0
ENV PORT 1337
ENV APP_KEYS l/QUhJAmpt3u0DQhySLTQA==,mI7olUQmguFvNxmMKZTgOg==,DLz5z0EouIT134q31+D+HA==,vqomlnXQ6YxF14UFbVFdNQ==
ENV API_TOKEN_SALT OOFrJv8WG9UoE+z9xYXrxw==
ENV ADMIN_JWT_SECRET DY3yVd+INPkl0cE6AjL0fw==
ENV TRANSFER_TOKEN_SALT wklH/X2z8DDeUmFMYk+2OQ==
ENV DATABASE_CLIENT sqlite
ENV DATABASE_FILENAME .tmp/data.db
ENV JWT_SECRET rP2vquYG4078GzdzmfRo7g==

RUN yarn build

CMD ["yarn", "start"]

WORKDIR /front

COPY novadata-front/. .

RUN yarn --frozen-lockfile

RUN yarn build

EXPOSE 3000

CMD ["yarn", "start"]