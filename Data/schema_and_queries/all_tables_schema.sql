-- Create Card Holder table
CREATE TABLE card_holder (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(150)
);

-- Create Credit Card table
CREATE TABLE credit_card (
  card VARCHAR(20) PRIMARY KEY NOT NULL,
  cardholder_id INT,
  FOREIGN KEY (cardholder_id) REFERENCES card_holder(id)
);

-- Create Merchant Category table
CREATE TABLE merchant_category (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(50)
);

-- Create merchant table
CREATE TABLE merchant (
  id INT PRIMARY KEY NOT NULL,
  name VARCHAR(150),
  id_merchant_category INT,
  FOREIGN KEY (id_merchant_category) REFERENCES merchant_category(id)
);

-- Create Transaction table
CREATE TABLE transaction (
  id INT PRIMARY KEY NOT NULL,
  date timestamp NOT NULL,
  amount DECIMAL(20, 2) NOT NULL,
  card VARCHAR(20),
  id_merchant INT,
  FOREIGN KEY (card) REFERENCES credit_card(card),
  FOREIGN KEY (id_merchant) REFERENCES merchant(id)
);