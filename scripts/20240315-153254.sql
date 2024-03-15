CREATE TABLE IF NOT EXISTS applications (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    account_id UUID NOT NULL REFERENCES accounts(id),
    name VARCHAR NOT NULL,
    description VARCHAR,
    logo VARCHAR,
    enabled BOOLEAN NOT NULL DEFAULT TRUE
);
