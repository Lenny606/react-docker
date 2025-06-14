FROM node:20-alpine
RUN addgroup app && adduser -S -G app app
USER app
WORKDIR /app

# cuz Docker cache 
COPY package*.json ./
# change ownership
USER root
RUN chown -R app:app .
USER app

RUN npm install

COPY . .
EXPOSE 5173

CMD npm run dev