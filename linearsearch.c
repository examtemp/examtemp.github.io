#include<stdio.h>

int linear_search(int arr[], int n, int item){
    int i;
    for(i=0; i<n; i++){
        if(arr[i]==item) return i;
    }
    return -1;
}

int main() {
    int n,item,i,loc=-1;

    printf("Enter size of the array : ");
    scanf("%d", &n);

    int arr[n];
    printf("Enter the elements of the array : \n");
    for(i=0; i<n; i++){
        scanf("%d",&arr[i]);
    }

    printf("Enter the item to search : ");
    scanf("%d",&item);

    loc = linear_search(arr,n,item);

    if(loc==-1)
        printf("Item not found\n");
    else
        printf("%d is the position of %d in array\n",loc,item);

    return 0;
}