# COMMODUS
Easy Group Communication API (without talking to the whole group)

# Description
Provides API backend for commodus

# Start
```
./commodus 
```
Make sure port 8080 is open and use the following endpoints

| VERB | URL | Description |
| ---- | --- | ----------- |
| GET | https://localhost:8080/members | list members |
| POST | https://localhost:8080/members | create member |


# Build
Deploy a new docker image and publish it

```
inv build --version <VERSION_NUMBER>
```

