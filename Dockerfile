FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

FROM nginx
EXPOSE 80
# cand facem acest copy, dam dump la tot node_modules, luam doar build folder
COPY --from=builder /app/build /usr/share/nginx/html
# nu trebuie sa dam start, comanda default pt imaginea de nginx e start de nginx