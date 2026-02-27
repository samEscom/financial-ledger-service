DROP TABLE IF EXISTS user_app;

CREATE TABLE user_app (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    updated_by UUID NOT NULL,
    created_by UUID NOT NULL
);

DROP TABLE IF EXISTS loan;

CREATE TABLE loan (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    interest_rate DECIMAL(10, 2) NOT NULL,
    term INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    updated_by UUID NOT NULL,
    created_by UUID NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_app(id)
);

DROP TABLE IF EXISTS schedule_payment;

CREATE TABLE schedule_payment (
    id UUID PRIMARY KEY,
    loan_id UUID NOT NULL,
    payment_date TIMESTAMP NOT NULL,
    interest_amount DECIMAL(10, 2) NOT NULL,
    principal_amount DECIMAL(10, 2) NOT NULL,
    balance DECIMAL(10, 2) NOT NULL,
    is_paid BOOLEAN NOT NULL DEFAULT FALSE,
    payment_completed_date TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    updated_by UUID NOT NULL,
    created_by UUID NOT NULL,
    FOREIGN KEY (loan_id) REFERENCES loan(id)
);