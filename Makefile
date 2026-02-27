SHELL=/bin/bash
SERVICE_NAME=$(notdir $(shell pwd))
POSTGRES_USER := $(shell grep POSTGRES_USER .env | cut -d '=' -f 2)
POSTGRES_PASSWORD := $(shell grep POSTGRES_PASSWORD .env | cut -d '=' -f 2)
POSTGRES_HOST := $(shell grep POSTGRES_HOST .env | cut -d '=' -f 2)
POSTGRES_PORT := $(shell grep POSTGRES_PORT .env | cut -d '=' -f 2)
POSTGRES_DB := $(shell grep POSTGRES_DB .env | cut -d '=' -f 2)

DATABASE_URL = postgresql://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@$(POSTGRES_HOST):$(POSTGRES_PORT)/$(POSTGRES_DB)
export DATABASE_URL


.PHONY: run-local
run-local:
	docker compose up -d
	npm run dev

.PHONY: stop-local
stop-dev:
	docker compose down

.PHONY: db-migrate
db-migrate:
	docker compose exec -T app npx prisma migrate dev --name init --schema prisma/schema.prisma

.PHONY: db-push
db-push:
	docker compose exec -T app npx prisma db push --schema prisma/schema.prisma
