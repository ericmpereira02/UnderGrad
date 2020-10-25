import random

def Select(someClass, SQUAD1, SQUAD2, SQUAD3, SQUAD4, num) :

    while someClass:
        index = random.randrange(len(someClass))
        person = someClass[index]
        

        if (num % 4 == 0):
            SQUAD1.append(person)
        elif (num % 4 == 1):
            SQUAD2.append(person)
        elif (num % 4 == 2):
            SQUAD3.append(person)
        elif (num % 4 == 3):
            SQUAD4.append(person)
        else:
            print("ERROR: Number out of Range somehow, exiting...")
            break
        
        del someClass[index]
        
        num+=1
    
    return num

MS3 = ["Gonzalez D.", "Jones", "Chernokolpakov", "Mullins", "Krygier", "Mossiah", "Kallet", "Schaefers"]
MS2 = ["Apathy", "Taylor", "Kerchner", "Bruder", "Money", "Dmutryk", "Gonzalez A.", "Paolucci", "Sanders", "Barker", "Petrazzulo", "Vergara", "Hahn", "Lepp"]
MS1 = ["Johsnon", "Gaglione", "Blanco", "Corona", "Tabron", "Prior", "Accardi", "Seibold", "Tegland", "Yu", "Wiseman", "Crofton", "Aebi", "Shimer", "Marzano", "Vickers", "Makumi"]

num = 0

SQUAD1 = []
SQUAD2 = []
SQUAD3 = []
SQUAD4 = []

num = Select(MS3, SQUAD1, SQUAD2, SQUAD3, SQUAD4, num)
num = Select(MS2, SQUAD1, SQUAD2, SQUAD3, SQUAD4, num)
num = Select(MS1, SQUAD1, SQUAD2, SQUAD3, SQUAD4, num)

print("SQUAD1: ",', '.join(SQUAD1))
print("SQUAD2: ",', '.join(SQUAD2))
print("SQUAD3: ",', '.join(SQUAD3))
print("SQUAD4: ",', '.join(SQUAD4))
