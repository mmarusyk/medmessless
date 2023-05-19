# Forget about mess in your hospital

## Links

1. https://medmemssless.onrender.com/users/sign_in
2. https://medmemssless.onrender.com/admin

## Credentials

1. Admin:

```
Login: 380686205333
Password: somepass
```

2. Doctor:

```
Login: 380686205334
Password: somepass
```

3. Patient:

```
Login: 380686205335
Password: somepass
```

## Requirements

Please ensure you are using Docker Compose V2

Check your docker compose version with:

```
% docker compose version
Docker Compose version v2.17.2
```

## Initial setup

1. Install ruby 3.2.1
2. Install nodejs 18.14.1
3. Install yarn
4. Setup .env file

```
cp .env.example .env
```

## Running the Rails app

1. Run additional services (postgres)

```
docker compose up -d
```

2. Install additional packages

```
sudo apt install libpq-dev
```

3. Install gems and run server

```
bundle i
bin/rails db:setup
bin/dev
```

## Running the Rails console

```
bin/rails c
```

## Running specs

```
bundle exec rspec
```
