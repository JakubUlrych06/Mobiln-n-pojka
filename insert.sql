-- Vložení fiktivních dat do tabulky Napoje
INSERT INTO Napoje (name, base_price, daily_price) VALUES
    ('Cola', 1.5, 1.8),
    ('Káva', 1.2, 1.5),
    ('Čaj', 1.0, 1.3),
    ('Pomerančový džus', 2.0, 2.2);

-- Vložení fiktivních dat do tabulky Nabidka
INSERT INTO Nabidka (offer_date, beverage_id, price) VALUES
    ('2024-04-19', 1, 1.8),
    ('2024-04-19', 2, 1.5),
    ('2024-04-19', 3, 1.3),
    ('2024-04-19', 4, 2.2);

-- Vložení fiktivních dat do tabulky Sales
INSERT INTO Sales (beverage_id, sale_date, quantity_sold) VALUES
    (1, '2024-04-19', 50),
    (2, '2024-04-19', 30),
    (3, '2024-04-19', 20),
    (4, '2024-04-19', 40);
