-- Active: 1673873325786@@127.0.0.1@3306

-- Práticas

--Prática 1

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users (id, name, email, password)
VALUES
    ("u001", "Ciclope", "ciclope@email.com", "oculosde$ol"),
    ("u002", "Jean Grey", "jeangrey@email.com", "F3nix"),
    ("u003", "Vampira", "vampira@email.com", "luv4sdePelica");

SELECT * FROM users;

Drop Table users;

Drop Table follows;

--Prática 2

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followed_id) REFERENCES users (id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
    ("u001", "u002"), -- Pessoa A segue B
    ("u001", "u003"), -- Pessoa A segue C
    ("u002", "u001"); -- Pessoa B segue A

SELECT * FROM follows;

SELECT * FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

SELECT 
    follows.follower_id as seguidor,
    follows.followed_id as seguido,
    users.name as nomeUsuario,
    users.email as emailUsuario,
    users.password as senha,
    users.created_at as criadoEm
FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

--Prática 3

SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id;

--Mostrando os dados da pessoa que foi seguida.
SELECT
    follows.follower_id as idSeguidor,
    follows.followed_id as idSeguido,
    users.name as nomeSeguidor,
    users.email as emailSeguidor,
    users.created_at as criadoEmDoUsuario
FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id
LEFT JOIN users as followedUsers
ON follows.followed_id = followedUsers.id;


-- Fixação

CREATE TABLE owners (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE banks (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE owners_banks (
    owner_id TEXT NOT NULL,
    bank_id TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owners (id),
    FOREIGN KEY (bank_id) REFERENCES banks (id)
);

INSERT INTO owners (id, name, password)
VALUES
    ("o001", "Viuva Negra", "ru$$ia"),
    ("o002", "Noturno", "tel3port"),
    ("o003", "Adão Negro", "seil4");

INSERT INTO banks (id, name)
VALUES
    ("b001", "Banco do Brasil"),
    ("b002", "Caixa"),
    ("b003", "Nu Bank");


SELECT * FROM owners;

SELECT * FROM banks;

INSERT INTO owners_banks
VALUES 
    ("o001", "b001"),
    ("o001", "b002"),
    ("o001", "b003"),
    ("o002", "b003"),
    ("o003", "b002"),
    ("o003", "b003");

SELECT * FROM onwers_banks;

SELECT * FROM owners_banks
INNER JOIN owners
ON owners_banks.owner_id = owners.id
INNER JOIN banks
ON owners_banks.bank_id = banks.id;

    
