- https://github.com/abhisheknaiidu/awesome-github-profile-readme






Mail Server config 
- https://contabo.com/blog/linux-mail-server-setup-and-configuration/?utm_source=google&utm_medium=cpc&utm_campaign=bfcm25&utm_term=&utm_content=&gad_source=1&gad_campaignid=23299573646&gbraid=0AAAAAD_Qy-cxkj9E9vF5PKET3xWIA7Znj&gclid=CjwKCAiAlrXJBhBAEiwA-5pgwiHt1ceiLm3Om2Ga-HNPqnc-iEO4jFFHDdfARbUAWuUVxxW95FmYcBoCX80QAvD_BwE
- https://www.youtube.com/watch?v=vxD9p-hAuos - Configura tu propio Servidor de Correos paso a paso (incluyendo dominios Internacionalizados IDN)
- https://www.youtube.com/watch?v=CvQny6sYVxg - Cómo autogestionar el correo electrónico correctamente (para evitar la carpeta de spam)




https://awesome-docker-compose.com/apps/database-management/azimutt

https://awesome-docker-compose.com/apps/e-commerce/saleor


https://awesome-docker-compose.com/apps/ide-and-tools/jupyterlab

https://awesome-docker-compose.com/apps/api-management/dreamfactory



Arcane is designed to be an easy and modern Docker management platform, built with everybody in mind. The goal of Arcane is to be built for and by the community to make sure nobody feels left out or behind with their specific features or processes.

https://github.com/getarcaneapp/arcane



Mathesar
An intuitive UI for managing data collaboratively, for users of all technical skill levels. Built on Postgres – connect an existing DB or set up a new one.
https://awesome-docker-compose.com/apps/database-management/mathesar

https://www.youtube.com/watch?v=bl4gSr3cTqY


How to Turn Any Product Image Into a Pro CGI Ads - n8n Workflow!
https://www.youtube.com/watch?v=cGmm1z2vWGA


How I Made a 360° Product Video From Just 1 Image 😱 (FREE Template)
https://www.youtube.com/watch?v=JfPon2ZDUG0



How to create unlimited viral videos, fully automatic & free!
https://www.youtube.com/watch?v=bl4gSr3cTqY



- santifiorino/sudoku.com-solver
- sdras/awesome-actions
- trekhleb/javascript-algorithms
- mtdvio/every-programmer-should-know
- https://github.com/microsoft/ML-For-Beginners
- public-api-lists/public-api-lists
- MarcinZiabek/message-router
- https://github.com/exceptionnotfound
- raramuridesign/mysql-country-list
- https://github.com/github/gitignore
- https://github.com/tomalaforge/angular-challenges
- https://github.com/microsoft/bash-for-beginners
- https://github.com/madebygps/second-brain?tab=readme-ov-file


https://chrisveleris.com/cs/monitoring-system-stats-with-go-pt-1/




## Memos

An open-source, self-hosted note-taking service. Your thoughts, your data, your control — no tracking, no ads, no subscription fees.
https://github.com/usememos/memos
https://docs.techdox.nz/memos/

```yaml
version: "3.0"
services:
  memos:
    image: neosmemo/memos:latest
    container_name: memos
    volumes:
      - ~/.memos/:/var/opt/memos
    ports:
      - 5230:5230
```


## FocalBoard
Focalboard is an open-source, self-hosted project management tool that's an alternative to Trello, Notion, and Asana. It's designed to help teams stay organized and aligned.
https://docs.techdox.nz/focalboard/

```yml
version: "3.0"
services:
  focalboard:
    image: focalboard/focalboard:latest
    container_name: focalboard
    volumes:
      - ~/.focalboard/:/var/opt/focalboard
    ports:
      - 5230:5230



      version: "3.3"
services:
  focalboard:
    ports:
      - 8000:8000
    restart: always
    image: mattermost/focalboard
```



## Firefly
Firefly III is a free and open-source personal finance manager designed to help you keep track of your expenses, income, budgets, and more. It offers a user-friendly interface and a rich set of features that make managing your finances easier and more efficient.
https://docs.techdox.nz/firefly/

```yml
version: '3.8'

services:
  app:
    image: fireflyiii/core:latest            # Uses the latest Firefly III Docker image.
    container_name: firefly_iii_app          # Names the container for easier management.
    hostname: app                            # Sets the hostname inside the container.
    restart: always                          # Restarts the container automatically on failure.
    volumes:
      - firefly_iii_upload:/var/www/html/storage/upload  # Stores uploaded files persistently.
    env_file:
      - .env                                 # Loads environment variables from .env file.
    networks:
      - firefly_iii                          # Connects to the specified Docker network.
    ports:
      - "8051:8080"                          # Exposes Firefly III on port 8051.
    depends_on:
      - db                                   # Ensures the database service starts before the app.

  db:
    image: mariadb:lts                       # Uses the latest stable MariaDB image.
    container_name: firefly_iii_db           # Names the container for easier management.
    hostname: db                             # Sets the hostname inside the container.
    restart: always                          # Restarts the container automatically on failure.
    env_file:
      - .db.env                              # Loads environment variables from .db.env file.
    networks:
      - firefly_iii                          # Connects to the specified Docker network.
    volumes:
      - firefly_iii_db:/var/lib/mysql        # Stores database data persistently.

  cron:
    image: alpine                            # Uses a lightweight Alpine Linux image.
    container_name: firefly_iii_cron         # Names the container for easier management.
    restart: always                          # Restarts the container automatically on failure.
    command: >
      sh -c "echo '0 3 * * * wget -qO- http://app:8080/api/v1/cron/YOUR_32_CHAR_CRON_TOKEN' | crontab - && crond -f -L /dev/stdout"
    networks:
      - firefly_iii                          # Connects to the specified Docker network.

volumes:
  firefly_iii_upload:
  firefly_iii_db:

networks:
  firefly_iii:
    driver: bridge
```



## Excalidraw
https://docs.techdox.nz/excalidraw/
Excalidraw is a virtual collaborative whiteboard tool that lets you easily sketch diagrams with a hand-drawn feel. It's designed to be simple, intuitive, and to allow rapid collaboration.

```yml

version: "3.8"

services:
  excalidraw:
    container_name: excalidraw
    image: excalidraw/excalidraw:latest
    ports:
      - "3030:80"
    restart: on-failure
```


## Docmocs
Docmost is a self-hosted document collaboration and management platform that provides a secure and efficient way to work on and manage your documents. With Docker Compose, deploying and managing Docmost becomes straightforward.
https://docs.techdox.nz/docmost/

```yml
services:
  docmost:
    image: docmost/docmost:latest
    depends_on:
      - db
      - redis
    environment:
      APP_URL: 'http://localhost:3090'
      APP_SECRET: '<APP SECRET>'
      DATABASE_URL: 'postgresql://docmost:STRONG_DB_PASSWORD@db:5432/docmost?schema=public'
      REDIS_URL: 'redis://redis:6379'
    ports:
      - "3090:3000"
    restart: unless-stopped
    volumes:
      - docmost:/app/data/storage

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: docmost
      POSTGRES_USER: docmost
      POSTGRES_PASSWORD: STRONG_DB_PASSWORD
    restart: unless-stopped
    volumes:
      - db_data:/var/lib/postgresql/data

  redis:
    image: redis:7.2-alpine
    restart: unless-stopped
    volumes:
      - redis_data:/data

volumes:
  docmost:
  db_data:
  redis_data:
  
```




## Duplicati - Docker Setup
Setting Up Duplicati with Docker Compose¶
Introduction to Duplicati: Duplicati is a free and open-source backup software that allows you to securely store backups online in various standard protocols and services. It's known for its versatility and ease of use, providing features like encryption, compression, and scheduling.


```yml
version: "2.1"
services:
  duplicati:
    image: lscr.io/linuxserver/duplicati:latest
    container_name: duplicati
    environment:
      - PUID=0
      - PGID=0
      - TZ=Etc/UTC
      - CLI_ARGS= #optional
    volumes:
      - ./config:/config
      - ./backups:/backups
      - /:/source
    ports:
      - 8200:8200
    restart: unless-stopped
```