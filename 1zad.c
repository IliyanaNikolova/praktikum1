//zad1
//Създай структура Medicine, която да съхранява информация за лекарствата:име(30 символа), дата на годност,
//код на продукта, цена, налично количество.
//данните се съхраняват в бинарен файл във формат - променливи от тип структурата Medicine
//Прочетете данните от файла и ги заредете в динамичен масив medicines, обработвайте грешки възникнали при работа 
//с бинарния файл, приеми че файла е създаден и е необходимо да се достъпи до него
#include <stdio.h>
#include <stdlib.h>
#include<string.h>

typedef struct{
    char name[30];
    char expiryDate[8];
    long long productCode;
    double price;
    int quantity;
}Medicine;

//2-ра задача:  Ф-я която връща всички лекарства,чиято дата на годност изтича преди тази дата, ако няма лекарства,
//отговарящи на тези условия се връща NULL. (ф-ята приема като параметри масив с елем. от тип структурата Medicine,
//брой елементи на масива и дата(ММ.ГГГГ).

//ф-я:
Medicine* getExpiredBefore(Medicine* medicines,int count,char* targetDate,int* resultCount){
    *resultCount=0;  //пишем със звездичка, защото достъпваме стойността, към която сочи указателят
    Medicine* result=NULL;

    for(int i=0;i<count;i++){
        if(strcmp(medicines[i].expiryDate,targetDate)<0){
            result=realloc(result,(*resultCount + 1) * sizeof(Medicine));
            result[*resultCount]=medicines[i];
            (*resultCount)++;
        }
    }
    return result;
}



// 3та задача - записва в offer.txt лекарствата в ценови диапазон, ф-ята връща броя на записаните елементи или 0,
//ако няма съвпадение
int writeOfferInPriceRange(Medicine* medicines, int count, float minPrice, float maxPrice) {
    FILE* file=fopen("offer.txt","w");
    if(file==NULL){
        return 0;
    }

    int written=0;
    for(int i=0;i<count;i++){
        if(medicines[i].price >= minPrice && medicines[i].price <= maxPrice){
            fprintf(file,"%s\n",medicines[i].name);
            fprintf(file,"%s\n",medicines[i].expiryDate);
            fprintf(file,"%lld\n",medicines[i].productCode);
            fprintf(file,"%.2f leva\n",medicines[i].price);
            written++;
        }
    }
    fclose(file);
    return written;
}

// 4та задача - изтрива лекарство по име и дата на годност
//(**) искаме да променим самия масив в main функцията
void DeleteMedicine(Medicine** medicines, int* count, char* name, char* expiryDate){
    int index=-1; //Създаваме променлива, която ще запомни позицията на лекарството, което ще трием.
                 // Започваме с -1, което означава "все още не сме намерили нищо".



    for(int i=0;i<*count;i++){
        if(strcmp((*medicines)[i].name,name)==0 && strcmp((*medicines)[i].expiryDate,expiryDate)==0){
            index=i;
            break;
        }
    }

    if(index==-1){
        printf("Няма лекарство с име %s и дата %s\n", name, expiryDate);
        return;
    }

    for (int i = index; i < *count - 1; i++) {
        (*medicines)[i] = (*medicines)[i + 1];
    }
    
    (*count)--;

    if (*count > 0) {
        *medicines = realloc(*medicines, (*count) * sizeof(Medicine));   //Взима старата памет и я преоразмерява 
                                                                        //- в случая намалява я.-  realloc
    } else {
        free(*medicines);
        *medicines = NULL;
    }
}

int main(){
    FILE* file=fopen("medicines.bin","rb");
    if(file==NULL){
        printf("Грешка при отваряне на файла\n");
        return 1;  //връщаме 1 (неуспешен край на програмата)
    }

    fseek(file,0,SEEK_END);  // fseek  премества "курсора" във файла
    //SEEK_END - от края на файла
    long fileSize=ftell(file);      //fileSize е общият размер на файла в байтове
                            //ftell  казва на коя позиция сме във файла (в байтове)
    fseek(file,0,SEEK_SET);   //SEEK_SET - от началото на файла

    int count=fileSize/sizeof(Medicine);  //count = колко лекарства има във файла,
    // sizeof(Medicine) - колко байта е една структура
    Medicine* medicines=malloc(count*sizeof(Medicine)); //count * sizeof(Medicine) - колко байта общо ни трябват
    if(medicines==NULL){
        printf("Грешка при заделяне на памет\n"); //Ако няма достатъчно памет, malloc връща NULL
        fclose(file);
        return 1;
    }

    fread(medicines, sizeof(Medicine),count,file);//чете, къде да запише прочетеното,колко байта е 1 ел.,колко са, и от кой файл да чете
    fclose(file); //затваряме

    free(medicines); //!!!!!Важно е да се освободи паметта накрая
    return 0;
}
