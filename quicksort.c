#include<stdio.h>

void printArray(int *A, int n) {
    for (int i = 0; i < n; i++) {
        printf("%d ", A[i]);
    }
    printf("\n");
}


int partition(int A[], int low, int high){
    int pivot = A[low];
    int i = low+1;
    int j = high;

    do{
        while(A[i]<=pivot) i++;
        while(A[j]>pivot) j--;
        if(i<j){
            int temp = A[i];
            A[i] = A[j];
            A[j] = temp;
        }
    }while(i<j);

    int temp = A[low];
    A[low] = A[j];
    A[j] = temp;

    return j;
}

void quickSort(int A[], int low, int high){
    int pivot;
    if(low<high){
        pivot = partition(A,low,high);
        quickSort(A,low,pivot-1);
        quickSort(A,pivot+1,high);
    }
}


int main(){
    int n,i;

    printf("Enter size of the array : ");
    scanf("%d", &n);

    int A[n];
    printf("Enter the elements of the array : \n");
    for(i=0; i<n; i++){
        scanf("%d",&A[i]);
    }

    printf("Before Sorting : ");
    printArray(A,n);

    quickSort(A, 0, n-1);

    printf("After Sorting : ");
    printArray(A, n);

    return 0;
}