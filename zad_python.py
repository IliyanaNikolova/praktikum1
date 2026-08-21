import random
while True:
    try:
        n=int(input("Enter a number between 10 and 50: "))
        if n<10 or n>50:
            raise ValueError("You have to enter a whole number between 10 and 50!")
    except ValueError as er:
        print(f"Mistake: {er}")
    else:

        a=random.randint(-2500,-1300)
        b=random.randint(1111,4444)
        print(f"The diapason is {a}:{b}")

        mylst_1=[]
        for i in range(n):
            number=int(input(f"Enter a whole number for mylst_1[{i}] in diapason {a};{b} : "))
            while not a<number<b:
                print("Enter a valid number!")
                number = int(input(f"Enter a whole number for mylst_1[{i}] in diapason {a};{b} : "))
            mylst_1.append(number)
        print(f"The first list is: {mylst_1}")

        #a)broi otricatelni elementi ot mylst_1, chiqto cifra na deseticite e kratna na 4 ILI 5
        count1=0
        for i in mylst_1:
            if i<0:
                digit=(i//10)%10
                if digit%4==0 or digit%5==0:
                    count1+=1
            else:
                print("No negative numbers.")
        print(f"Count of the elements of mylst_1 with tens %4 or %5 is : {count1}")

        #b) srednoarit na elementi ot mylst_1, chiqto stoinost e dvucifrena i chetna
        even_2_digit_numbers=[]
        for i in mylst_1:
            if 10<=abs(i)<=99 and i%2==0:
                even_2_digit_numbers.append(i)
        if even_2_digit_numbers:
            average=sum(even_2_digit_numbers)/len(even_2_digit_numbers)
            print(f"Average of the even two-digit numbers is: {average}")
        else:
            print("There are no even two-digit numbers.")

        #v)Vtori spisak mylst_2 i da se vkluchat tezi elementi, koito sa tricifreni i sa kratni na 3
        mylst_2=[]
        for i in mylst_1:
            if 100<=abs(i)<999 and i%3==0:
                mylst_2.append(i)
        print(f"The second list is: {mylst_2}")

        #g)broi na elementi ot mylst_2 s nechetna stoinost, koito sa s cheten indeks
        count2=0
        for i in range(len(mylst_2)):
            if i%2==0:
                if mylst_2[i]%2!=0:
                    count2+=1
        print(f"Count of the odd elements on even indeks is : {count2}")

        #d) zamenqne na vsichki elementi ot spisyk mylst_2, koito sa s necheten indeks s chisloto 13
        if len(mylst_2)>0:
            for i in range(len(mylst_2)):
                if i%2!=0:
                    mylst_2[i]=13
            print(f"Mylst_2 after the raplacement: {mylst_2}")
        else:
            print("The list is empty!")

        #e) sravnenie na spisycite i ako sa razlichna dylzina mahane na 1vi 1 posleden
        # element ot po-dylgiq

        len_first=len(mylst_1)
        len_second=len(mylst_2)
        print(f"The length of mylst_1 is :{len_first}")
        print(f"The length of mylst_2 is :{len_second}")

        if len_first!=len_second:
            if len_first<len_second:
                shorter=mylst_1
                longer=mylst_2
                print(f"The longer list is : {longer}")
            else:
                shorter=mylst_2
                longer=mylst_1
                print(f"The longer list is : {longer}")

            diff=len(longer)-len(shorter)
            if len(longer)>0:
                remove_first=longer.pop(0)
                print(f"Deleted first element is : {remove_first}")
            if len(longer)>0:
                remove_last=longer.pop()
                print(f"Deleted last element is : {remove_last}")

            print(f"After the deleted elements: {longer}")
        else:
            print("Both list are with the same length.")
