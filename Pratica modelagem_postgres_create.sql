CREATE TABLE customers (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
);

CREATE TABLE categories (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE products (
	id SERIAL NOT NULL PRIMARY KEY,
	price integer NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"categoryId" integer NOT NULL REFERENCES categories (id),
	size TEXT NOT NULL
);

CREATE TABLE photos (
	id SERIAL NOT NULL PRIMARY KEY,
	"productId" serial NOT NULL REFERENCES products (id),
	photo TEXT NOT NULL,
	"categoryId" integer NOT NULL REFERENCES categories (id)
);

CREATE TABLE states (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE cities (
	id SERIAL NOT NULL PRIMARY KEY,
	name TEXT NOT NULL UNIQUE
);

CREATE TABLE "customerAddresses" (
	id SERIAL NOT NULL PRIMARY KEY,
	street TEXT NOT NULL,
	number integer NOT NULL,
	district TEXT NOT NULL,
	complement TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES states (id)
	"cityId" integer NOT NULL REFERENCES cities (id),
	"postalCode" TEXT NOT NULL,
	"customerId" integer NOT NULL REFERENCES customers(id)
);

CREATE TYPE "statusType" AS ENUM ('created', 'pay','delivered','canceled');

CREATE TABLE purchases (
	id SERIAL NOT NULL PRIMARY KEY,
	"customerId" integer NOT NULL REFERENCES categories (id),
	"productId" integer NOT NULL REFERENCES products (id),
	amount integer NOT NULL,
	"purchaseData" timestamp with time zone NOT NULL,
	status "statusType" NOT NULL,
	"customerAddressesId" INTEGER NOT NULL REFERENCES "customerAddresses" (id)
);
