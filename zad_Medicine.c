#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
    char name;
    char expDate[8];
    long long productCode;
    float price;
    int quantity;
}
Medicine;

//zad1
int loadMedicines(Medicine **medicines){
    FILE *file=fopen("medicines.bin","rb");
    if(file==NULL){
        printf("The file can't be open.")
        return -1;
    }

    //namirane na razmera na faila
    fseek(file,0,SEEK_END);
    long fileSize=ftell(file);
    fseek(file,0,SEEK_SET);

    int count=fileSize/sizeof(Medicine);
    if(count==0){
        fclose(file);
        *medicines=NULL;
        return 0;
    }

    //zadelqme dinamichna pamet
    *medicines=(Medicine*)malloc(count*sizeof(Medicine));
    if(*medicines==NULL){
        printf("Not enough memory!");
        fclose(file);
        return -1;
    }

    //chetene na dannite ot faila
    size_t readCount=fread(*medicines,sizeof(Medicine), count,file);
    if(readCount!=count){
        printf("Mistake.");
        free(*medicines);
        fclose(file);
        return -1;
    }

    fclose(file);
    return count;
}
//zad2
Medicine* findExpiredBefore(zmedicine *medicines,int count,char *date){
    if(medicines==0 || count<=0){
        return NULL;
    }

    //sravnqvane na mesec s godina kato nizove
    for(int i;i<count;i++){
        if(strcmp(medicines[i].expDate,date)<0){
            return &medicines[i];
        }
    }
    return NULL;
}

//zad3
int saveByPriceRange(Medicine *medicines,int count,float price,float minPrice,float maxPrice){
    if(medicines==NULL || count<=0){
        return 0;
    }

    FILE *file=fopen("offer.txt","w");
    if(file==NULL){
        printf("The file can't be open!");
        return 0;
    }

    int writtenCount=0;
    for(int i=0;i<count;i++){
        if(medicines[i].price>=minPrice && medicines[i]<=maxPrice){
            fprintf(file,"%s\n",medicines[i].name);
            fprintf(file,"%s\n",medicines[i].expDate);
            fprintf(file,"%s\n",medicines[i].productCode);
            fprintf(file,"%s\n",medicines[i].price);
            writtenCount++;
        }
    }

    fclose(file);
    return writtenCount;
}
