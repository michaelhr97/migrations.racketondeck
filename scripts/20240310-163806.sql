CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE accounts (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	enabled bool NOT NULL DEFAULT true,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT account_pkey PRIMARY KEY (id)
);

CREATE TABLE "users" (
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	account_id uuid NOT NULL,
	"name" varchar(255) NULL,
	email varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	role_type varchar(255) NOT NULL,
	enabled bool NOT NULL DEFAULT true,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT user_email_key UNIQUE (email),
	CONSTRAINT user_pkey PRIMARY KEY (id),
	CONSTRAINT user_role_type_check CHECK (((role_type)::text = ANY ((ARRAY['ACCOUNT_OWNER'::character varying, 'ACCOUNT_ADMIN'::character varying, 'APPLICATION_USER'::character varying])::text[]))),
	CONSTRAINT fk_account_id FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE
);