# generatedata

Docker compose packaging of generatedata based on [computerlyrik](https://github.com/computerlyrik/generatedata.git
)

## Usage

### Clone this repo

```bash
git clone https://github.com/asperitus/generatedata.git
```

### Build docker image and run

```bash
docker-compose up -d
```

### Initialize and generate data

[http://localhost:8080/generatedata/install.php](http://localhost:8080/generatedata/install.php)

and follow the instructions.

### Database admin (optional)

[http://localhost:8082/](http://localhost:8082/)

```properties
Username: user
Password: password
Database: generatedata
```

### Rebuild docker image if you make changes to settings (optional)

```bash
docker-compose build
```

