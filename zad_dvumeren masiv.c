//daden e dvumeren masiv NxM zapylnen s chisla.Proveri dali vseki red sydyrza chisla, podredeni v narastvasht red, 
//a vsqka kolona sydyrza chisla v namalqvasht red
#include <stdio.h>
int main(){
    int n, m;
    print("Enter NxM matrix");
    scanf("%d %d", &n, &m);
    int arr[n][m];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            scanf("%d", &arr[i][j]);
        }
    }

    int isSort = 1; //yes/no
    //proverka za narastvashti stoinosti na redove
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m - 1; j++) {
            if (arr[i][j] >= arr[i][j + 1]) {
                isSort = 0;
                break;
            }
        }
        if (!isSort) {
            break;
        }
    
    //proverka za namaliavashti stoinosti na koloni
    if (isSort) { 
        for (int j = 0; j < m; j++) {
            for (int i = 0; i < n - 1; i++) {
                if (arr[i][j] <= arr[i + 1][j]) {
                    isSort = 0;
                    break;
                }
            }
            if (!isSort) {
                break;
            }
        }
    }
    if (isSort) {
        printf("YES\n");
    } else {
        printf("NO\n");
    }
    return 0;
}
}