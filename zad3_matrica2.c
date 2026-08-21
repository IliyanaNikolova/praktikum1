//Попълнете масив NxN елемента и го попълнете с числа.
//Изведете елементите над главния диагонал
#include <stdio.h>

int main() {
    int N;
    printf("Enter the size of the matrix (N): ");
    scanf("%d", &N);

    int matrix[N][N];
    printf("Enter the elements of the matrix:\n");
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            scanf("%d", &matrix[i][j]);
        }
    }

    printf("Elements above the main diagonal:\n");
    for (int i = 0; i < N; i++) {
        for (int j = i + 1; j < N; j++) {
            printf("%d ", matrix[i][j]);
        }
    }
    printf("\n");

    return 0;
}