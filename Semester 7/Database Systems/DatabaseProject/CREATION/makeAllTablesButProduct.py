from random import randint
from datetime import datetime
import random

from faker import Faker
fake = Faker()

from random import randrange
from datetime import timedelta

members = []
addressToCustomer = []
addresses = []
cities = []
emails = []
addressEnd = ["Street", "Road", "Boulevard", "Court", "Way"]


def random_date(start, end):
    """
    This function will return a random datetime between two datetime 
    objects.
    """
    delta = end - start
    int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
    random_second = randrange(int_delta)
    return start + timedelta(seconds=random_second)

file = open("RunToInsert.sql","w")
file.write(f'SET FOREIGN_KEY_CHECKS = 0;\n')
for i in range(100):
    name = fake.name()
    email = fake.email()
    emails.append(email)
    isMember = randint(0,1)
    city = fake.city()
    cities.append(city)
    internal = '##) ###-###'
    for j in range(8):
        internal = internal.replace('#', str(randint(0, 9)), 1)
    phone = f'({randint(1, 9)}{internal}'
    addressName = fake.country();
    addNum = randint(1, 4000)

    address = (str(addNum)+" "+addressName+" "+random.choice(addressEnd))
    addressToCustomer.append(f'INSERT INTO `addresses` (`email`,  `address`, `city`) VALUES ("{email}", "{address}", "{city}");\n')
    addresses.append(address)
    #city = fake.city()
 
    file.write(f'INSERT INTO `customer` (`name`, `email`, `Username`, `Password`, `phone`) VALUES ("{name}", "{email}", "{name}","password","{phone}");\n')
    #print(f'INSERT INTO `customer` (`name`, `email`,  `Username`, `Password`) VALUES ("{name}", "{email}", "{name}","password");')
    if (isMember is 1):
        d1 = datetime.strptime('1/1/2017 1:30 PM', '%m/%d/%Y %I:%M %p')
        d2 = datetime.strptime('1/1/2018 4:50 AM', '%m/%d/%Y %I:%M %p')

        start_date= random_date(d1, d2)   
        d1 = datetime.strptime('12/7/2018 1:30 PM', '%m/%d/%Y %I:%M %p')
        d2 = datetime.strptime('2/12/2019 4:50 AM', '%m/%d/%Y %I:%M %p')
        end_date = random_date(d1,d2)
        members.append(f'INSERT INTO `members` (`email`,  `start_date`, `end_date`) VALUES ("{email}", "{start_date}", "{end_date}");\n')
        
#file.close()


#file = open("members.sql", "w")
for item in members:
    file.write(item)
    #print(item)



#file = open("addresses.sql", "w")
for item in addressToCustomer :
    file.write(item)
    #print(item)

#file=open("individual_product.sql", "w")
for i in range (15000):
    #print(f'INSERT INTO `individual_product` ( `Serial_no`,  `Product_Id`) VALUES ("{i+1}", "{randint(1,362)}");')
    file.write(f'INSERT INTO `individual_product` ( `Serial_no`,  `Product_Id`) VALUES ("{i+1}", "{randint(1,362)}");\n')

#file = open("ordered_products.sql", "w")
tracklist=list(range(2,351))
seriallist=list(range(2,15001))
while len(tracklist)!=0:
    num = random.choice(tracklist)
    remove = randrange(0,4)

    serialno = random.choice(seriallist)
    seriallist.remove(serialno)

    if(remove >= 0):
        tracklist.remove(num)

    #print(f'INSERT INTO `products_ordered` ( `Serial_No`,  `Tracking_No`) VALUES ("{serialno}", "{num}");')
    file.write(f'INSERT INTO `products_ordered` ( `Serial_No`,  `Tracking_No`) VALUES ("{serialno}", "{num}");\n')

#file = open("order.sql", "w")
for i in range(350):
    email = random.choice(emails)
    addressName = fake.country()
    addNum = randint(1, 4000)

    address = (str(addNum)+" "+addressName+" "+random.choice(addressEnd))
    addresses.append(address)
    address = random.choice(addresses)

    city = fake.city()
    cities.append(city)
    city = random.choice(cities)
    print(f'{city}\n')

    d1 = datetime.strptime('1/1/2010 1:30 PM', '%m/%d/%Y %I:%M %p')
    d2 = datetime.strptime('12/7/2018 4:50 AM', '%m/%d/%Y %I:%M %p')

    date= random_date(d1, d2)   
    #print(f'INSERT INTO `order` ( `email`,  `tracking_number`, `date_ordered`, `address`, `city`) VALUES ("{email}", "{i+1}", "{date}","{address}","{city}");')
    file.write(f'INSERT INTO `order` ( `email`,  `tracking_number`, `date_ordered`, `address`, `city`) VALUES ("{email}", "{i+1}", "{date}","{address}","{city}");\n')

file.write(f'SET FOREIGN_KEY_CHECKS = 1;\n')

