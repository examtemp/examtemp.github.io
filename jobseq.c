#include<stdio.h>
#include<stdbool.h>

typedef struct Job {
    int id;
    int profit;
    int deadl;
}Job;


int min(int a, int b){
    if(a<b) return a;
    return b;
}

int cmp(Job a, Job b){
    return a.profit > b.profit;
}

void merge(Job A[], int mid, int low, int high){
    int i,j,k;
    Job B[100];
    i = low;
    j = mid+1;
    k = low;

    while(i<=mid && j<=high){
        if(cmp(A[i],A[j])){
            B[k] = A[i];
            k++;
            i++;
        }
        else{
            B[k] = A[j];
            k++;
            j++;
        }
    }

    while(i<=mid){
        B[k] = A[i];
        k++;
        i++;
    }

    while(j<=high){
        B[k] = A[j];
        k++;
        j++;
    }

    for(i=low; i<=high; i++){
        A[i] = B[i];
    }
}

void sort(Job A[], int low, int high){
    int mid;
    if(low<high){
        mid = (low+high)/2;
        sort(A,0,mid);
        sort(A,mid+1,high);
        merge(A,mid,low,high);
    }
}

void printJob(Job arr[], int n){
    sort(arr,0,n-1);
    int i,j;

    int slot[n];
    int result[n];

    for(i=0; i<n; i++){
        slot[i] = false;
    }
    
    for(i=0; i<n; i++){
        for(j = min(n, arr[i].deadl)-1; j>=0; j--){
            if(slot[j]==false){
                slot[j] = true;
                result[j] = i;
                break;
            }
        }
    }

    int finalProfit = 0;
    for(i=0; i<n; i++){
        if(slot[i]==true){
            printf("%d ", arr[result[i]].id);
            finalProfit += arr[result[i]].profit;
        }
    }
    printf("\n");

    printf("Final Total Profit is : %d\n", finalProfit);
}

int main(){
    int n,i;

    printf("Enter the size of array : ");
    scanf("%d",&n);

    Job arr[n];

    printf("Enter <Profit,Deadline> for array : ");
    for(i=0; i<n; i++){
        scanf("%d%d", &arr[i].profit, &arr[i].deadl);
        arr[i].id = i;
    }

    printJob(arr,n);

    return 0;
}