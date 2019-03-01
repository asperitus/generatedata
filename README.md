# generatedata

Docker compose packaging of generatedata based on [computerlyrik](https://github.com/computerlyrik/generatedata.git
)

## Usage

### Build docker image and run

```bash
docker-compose up -d
```

### Initialize and generate data

http://localhost:8080/generatedata/install.php

follow the instructions.

### Database admin

http://localhost:8082/

```properties
Username: user
Password: password
Database: generatedata
```

### Rebuild docker image if you make changes to settings

```bash
docker-compose build
```

