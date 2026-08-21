import random
#VYVEZDANE NA NUM BROI CHISLA S PROVERKA TRY-EXCEPT(PO USLOVIE)

try:
    num=int(input("Enter a whole number between 30 and 40: "))
    if num<30 or num>40:
        raise ValueError("The number has to be between 30 and 40")

except ValueError as er:
    print(f"Mistake:{er}")

#Genenrirane na sluchaini chisla a,b spored uslovieto
a = random.randint(-8800,-3300)
b=random.randint(4444,7777)
print(f"The diapason: a={a} b={b}")

#Syzdavane na spisyk first i zapylvane:

first=[]
for i in range(num):
    while True:
        try:
            number=int(input(f"Enter a whole number for list first[{i}] in the interval {a};{b}: "))
            if number>a and number<b:
                first.append(number)
                break
            else:
                print(f"The number has to be between {a} and {b}.")
        except ValueError:
            print("Enter a valid whole number.")

print(f"List: {first}")


#Da se nameri broq na polozhitelnite chisla ,
# chiqto cifra na deseticite e kratna na 4 ili e ravna na 3

count1=0 #broq
for number in first:
    cifra= (abs(number)//10)%10 #cifra na deseticite
    if cifra %4==0 or cifra ==3:
        count1+=1
print(f"Count of positive numbers % 4 or = 3 : {count1}")


#srednoaritmetichno na chetiricifrenite otricatelni chisla
negative_four_digit_numbers=[]
for number in first:
    if number < 0 and 1000<=abs(number)<=9999:
        negative_four_digit_numbers.append(number)

if len(negative_four_digit_numbers)>0:
    average=sum(negative_four_digit_numbers)/len(negative_four_digit_numbers)
    print(f"The average of the negative four-digit numbers is : {average}")
else:
    print("There are no negative four-digit numbers in the list.")

#Syzdavane na vtori spisyk
second=[]
for number in first:
    if 10<=number<=99 or number%3==0:
        second.append(number)

print(f"Second list: {second}")


#Broi na elementi s nechetna stoinost koito sa s cheten indeks v second[]
count_odd_even_index=0
for number in range(len(second)):
    if number%2==0: #cheten indeks
        if second[number] % 2 != 0: #nechetno chislo
            count_odd_even_index+=1
print(f"Odd even index numbers: {count_odd_even_index}")

#Iztrivane na otricatelni dvucifreni chisla ot second
for i in range(len(second)-1, -1, -1): #ot posledniq kum pyrviq element
    if 10<=abs(second[i]) <=99 and second[i]<0:
        del second[i]
print(f"Second list after the deleted element: {second}")

#Izravnqvane na dylzinite na dvata spisyka
len_first=len(first)
len_second=len(second)

if len(first)!=len(second):
    if len(first)<len(second):
        shorter=first
        longer=second
        print("The first list is shorter.")
    else:
        shorter=second
        longer=first
        print("The second list is shorter.")

    #chislata koito trqbwa da dobavim za da gi izravnim
    diffrence=len(longer)-len(shorter)
    print(f"We add {diffrence} numbers.")

    #namirame sredata na po-kysiq spisyk
    insert=len(shorter)//2

    #dobavqme chislata
    for i in range(diffrence):
        new_number=random.randint(a+1, b-1)
        shorter.insert(insert, new_number)

    print(f"The length of the first list: {len(first)}")
    print(f"The length of the second list: {len(second)}")
else:
    print("Both lists are with the same length.")

print(f"First list:{first}")
print(f"Second list:{second}")



