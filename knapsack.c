#include<stdio.h>
#include<stdlib.h>
#include<string.h>

typedef struct Item {
    int value;
    int weight;
    int ind;
}Item;


int cmp(Item a, Item b){
    double r1 = (double) a.value / (double) a.weight;
    double r2 = (double) b.value / (double) b.weight;
    return r1 > r2;
}

void merge(Item A[], int mid, int low, int high){
    int i,j,k;
    Item B[100];

    i = low;
    j = mid + 1;
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
        i++;
        k++;
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

void sort(Item A[], int low, int high){
    int mid;
    if(low<high){
        mid = (low+high)/2;
        sort(A,low,mid);
        sort(A,mid+1,high);
        merge(A,mid,low,high);
    }
}

double* fracknapsack(int W, Item arr[], int n){
    sort(arr,0,n-1);

    int i;
    int currWeight = 0;
    double finalValue = 0.0;

    double *x = (double*) malloc(n * sizeof(double));
    memset(x,0,sizeof(double)*n);

    for(i=0; i<n; i++){
        if(currWeight + arr[i].weight <= W){
            currWeight += arr[i].weight;
            x[arr[i].ind] = 1.0;
            finalValue += arr[i].value;
        }
        else{
            double rem = (W - currWeight);
            x[arr[i].ind] = (double)rem/(double)arr[i].weight;
            finalValue += arr[i].value * ( (double)rem/(double)arr[i].weight );
            break;
        }
    }

    printf("Max value we can put : %lf\n",finalValue);

    return x;
}

int main(){
    int W,n,i;

    printf("Enter total weight : ");
    scanf("%d",&W);

    printf("Enter size of the array : ");
    scanf("%d",&n);

    Item arr[n];
    printf("Enter <Value,Weight> for array : \n");
    for(i=0; i<n; i++){
        scanf("%d%d",&arr[i].value,&arr[i].weight);
        arr[i].ind = i;
    }

    double *result = fracknapsack(W,arr,n);
    for(i=0; i<n; i++){
        printf("%.3lf ", result[i]);
    }

    return 0;
}