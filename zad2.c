#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//1zad
typedef struct{
    long long uniqueId;
    char name[128];
    char teacher[64];
    char startDate[11];
    int enrolledStudents;
}Course;

typedef struct{
    char fullName[64];
    long long facultyNumber;
    int courseCount;
    long long courseIds[10];
}Student;

//zad2
int GenerateCourseInfo(Course* courses, int courseCount, char* teacherName, char* startDate, char* endDate,){
    FILE* file=fopen("course_info.txt","w");
    if(file==NULL){
        return -1;
    }

    int written=0
    for(int i=0;i<courseCount;i++){
        if(strcmp(courses[i].teacher,teacherName)==0 && strcmp(courses[i].startDate,startDate)>=0 && strcmp(courses[i].startDate,endDate)<=0){
            fprintf(file,"%lld: %s: %s: %d\n", courses[i].uniqueId,courses[i].name,courses[i].startDate,courses[i].enrolledStudents);
            written++;
        }
    }

    fclose(file);
    return written;
}

//zad3
int enrollStudents(Course* courses, int courseCount, Student* students, int studentCount, long long facultyNumber, long long courseId){
    //Търсим студента
    int studentIndex=-1;
    for(int i=0;i<studentCount;i++){
        if(courses[i].facultyNumber==faculty number){
            studentIndex=i;
            break;
        }
    }

    if(studentIndex == -1){
        return 0;
    }

    //tyrsim kursa
    int courseIndex=-1;
    for(int i=0;i<courseCount;i++){
        if(courses[i].uniqueId==courseId){
            courseIndex=i;
            break;
        }
    }

    if(courseIndex==-1){
        return -1;
    }

    // Проверка 1: Студентът да не е вече записан за този курс
    for(int i=0;i<students[studentIndex].courseCount;i++){
        if(students[studentIndex].courseIds[i]==courseId){
            return 0;
        }
    }

    // Проверка 2: Курсът да има свободно място (макс 30)
     if(courses[courseIndex].enrolledStudents>=30){
        return 0;
    }

    // Проверка 3: Студентът да няма повече от 10 курса
     if(students[studentIndex].courseCount>=10){
        return 0;
    }

    // Записване в двоичен файл
      FILE* file=fopen("course_student.bin","ab");
      if(file==NULL){
        return -1;
    }

      fwrite(&courseId,sizeof(long long),1,file);
      fwrite(&facultyNumber,sizeof(long long),1,file);
      fclose(file);

    // Актуализираме данните
    courses[courseIndex].enrolledStudents++;
    students[studentIndex].courseIds[students[studentIndex].courseCount]=courseId;
    students[studentIndex].courseCount++;

    return 1;
}

//zad4
void DeleteCourse(Course** courses, int* count, char* date){
    // Първо преброяваме колко курса ще останат
    int newCount=0;
    for(int i=0;i<*count;i++){
        if(strcmp((*courses)[i].startDate,date)>=0){
            newCount++;  //broim tezi, koito ne triem
        }
    }

    //ako nqma kakvo da se trie
    if(newCount==*count){
        printf("Nqma kursove za iztrivane");
        return;
    }

    //syzdavame masiv samo s ostanalite kursove
    Course* newCourses=(*Course)malloc(newCount*sizeof(Course));
    if(newCourses==NULL){
        printf("Greshka pri zadelqne na pamet!");
        return;
    }

    //Копираме само курсовете, които остават (започват след датата)
    int index=0;
    for(int i=0;i<*course;i++){
        if(strcmp((*courses)[i].startDate,date)>=0){
            newCourses[index]=(*courses)[i];
            index++;
        }
    }

    //osvobozdavame starata pamet i prenasochvame ukazatelq
    free(*courses);
    *courses=newCourses;
    *count=newCount

    printf("Iztriti sa kursovete predi datata %s",date);
}


int main(){
    int courseCount, studentCount;

    //broi kursove
    printf("Broi kursove: ");
    scanf("%d",&courseCount);

    Course* courses=(Course*)malloc(courseCount *sizeof(Course));
    if(courses==NULL){
        printf("Greshka pri zadelqne na pamet");
        return 1;
    }

    for(int i=0;i<courseCount;i++){
        printf("Kurs %d",i+1);
        printf("Unikalen nomer: ");
        scanf("%lld",&courses[i].uniqueNumber);
        printf("Ime na kurs: ");
        scanf("%s",&courses[i].name);
        printf("Nachalna data (mm.dd.yyyy): ");
        scanf("%s",&courses[i].startDate);
        printf("Broi zapisani studenti: ");
        scanf("%d",&courses[i].enrolledStudents);
        printf("Ime na prepodavatel: ");
        scanf("%s",&courses[i].teacher);
    }

    //vyvezdane na studenti
    printf("\nBroi studenti: ");
    scanf("%d", &studentCount);

    Student* student(Student*)malloc(studentCount*sizeof(Student));
    if(students==NULL){
        printf("Greshka pri zadelqne na pamet");
        free(courses);
        return 1;
    }

    for (int i = 0; i < studentCount; i++) {
        printf("\n--- Student %d ---\n", i + 1);
        printf("Tri imena: ");
        scanf("%s",&students[i].fullName);
        printf("Fakulteten nomer: ");
        scanf("%lld", &students[i].facultyNumber);
        printf("Broi kursove (0-10): ");
        scanf("%d", &students[i].courseCount);

        for(int j=0;j<10;j++){
            students[i].coursesIds[j]=0
        }

        for(int j=0;j<students[i].courseCount;j++){
            printf("Nomer na kurs %d: ", j + 1);
            scanf("%lld",&students[i].courseIds[j])
        }
    }

    // ========== 3. 2-РА ЗАДАЧА ==========
    printf("\n=== 2-ra zadacha ===\n");
    char teacherName[64], startDate[11], endDate[11];
    
    printf("Ime na prepodavatel: ");
    scanf(" %s", teacherName);
    printf("Nachalna data (mm.dd.yyyy): ");
    scanf("%s", startDate);
    printf("Krajna data (mm.dd.yyyy): ");
    scanf("%s", endDate);
    
    int result2 = generateCourseInfo(courses, courseCount, teacherName, startDate, endDate);
    if (result2 < 0) {
        printf("Greshka pri zapis!\n");
    } else {
        printf("Zapisani %d kursa v course_info.txt\n", result2);
    }
    
    // ========== 4. 3-ТА ЗАДАЧА ==========
    printf("\n=== 3-ta zadacha ===\n");
    long long facNum, courseId;
    
    printf("Fakulteten nomer: ");
    scanf("%lld", &facNum);
    printf("Nomer na kurs: ");
    scanf("%lld", &courseId);
    
    int result3 = enrollStudent(courses, courseCount, students, studentCount, facNum, courseId);
    if (result3 == 1) {
        printf("Uspe6no zapisvane!\n");
    } else if (result3 == 0) {
        printf("Neuspe6no zapisvane!\n");
    } else {
        printf("Sistemna greshka!\n");
    }
    
    // ========== 5. 4-ТА ЗАДАЧА ==========
    printf("\n=== 4-ta zadacha ===\n");
    char targetDate[11];
    
    printf("Data (mm.dd.yyyy): ");
    scanf("%s", targetDate);
    
    deleteCoursesBeforeDate(&courses, &courseCount, targetDate);
    
    // ========== 6. ПОКАЗВАНЕ НА ОСТАНАЛИТЕ КУРСОВЕ ==========
    printf("\n=== Ostali kursove ===\n");
    if (courseCount == 0) {
        printf("Nqma ostali kursove.\n");
    } else {
        for (int i = 0; i < courseCount; i++) {
            printf("%lld | %s | %s | %s | %d studenta\n",
                   courses[i].uniqueId,
                   courses[i].name,
                   courses[i].startDate,
                   courses[i].teacher,
                   courses[i].enrolledStudents);
        }
    }
    
    // ========== 7. ПОЧИСТВАНЕ ==========
    free(courses);
    free(students);
    
    return 0;
}