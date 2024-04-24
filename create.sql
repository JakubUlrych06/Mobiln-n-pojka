-- Vytvoření tabulky pro nápoje
CREATE TABLE Napoje (
    beverage_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    base_price DECIMAL(10, 2),
    daily_price DECIMAL(10, 2)
);

-- Vytvoření tabulky pro prodeje
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    beverage_id INT,
    sale_date DATE,
    quantity_sold INT,
    FOREIGN KEY (beverage_id) REFERENCES Napoje(beverage_id)
);

-- Vytvoření tabulky pro nabídku nápojů
CREATE TABLE Nabidka (
    ferda_id INT AUTO_INCREMENT,
    offer_date DATE,
    beverage_id INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (ferda_id, offer_date),
    FOREIGN KEY (beverage_id) REFERENCES Napoje(beverage_id)
);
