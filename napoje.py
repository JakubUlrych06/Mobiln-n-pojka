from peewee import *
import datetime

# Připojení k databázi
db = SqliteDatabase('beverages.db')

# Definice ORM modelů
class Napoj(Model):
    name = CharField(unique=True)
    base_price = DecimalField()
    daily_price = DecimalField()

    class Meta:
        database = db

class Nabidka(Model):
    offer_date = DateField(default=datetime.date.today)
    beverage = ForeignKeyField(Napoj)
    price = DecimalField()

    class Meta:
        database = db

# Vytvoření tabulek v databázi, pokud neexistují
db.connect()
db.create_tables([Napoj, Nabidka])

# Zadávání údajů o nápojích
def add_beverage(name, base_price, daily_price):
    try:
        with db.atomic():
            Napoj.create(name=name, base_price=base_price, daily_price=daily_price)
    except IntegrityError:
        print(f"Nápoj s názvem {name} již existuje.")

# Zobrazování denní nabídky nápojů
def show_daily_offer():
    today = datetime.date.today()
    offer = Nabidka.select().where(Nabidka.offer_date == today)
    print("Denní nabídka nápojů:")
    for item in offer:
        print(f"{item.beverage.name}: {item.price} Kč")

# Příklad použití
if __name__ == "__main__":
    # Přidání nových nápojů
    add_beverage("Cola", 1.5, 1.8)
    add_beverage("Káva", 1.2, 1.5)
    add_beverage("Čaj", 1.0, 1.3)
    add_beverage("Pomerančový džus", 2.0, 2.2)

    # Zobrazení denní nabídky nápojů
    show_daily_offer()
