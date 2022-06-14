#include<stdio.h>

int binary_search(int arr[], int lb, int ub, int item){
    int loc=-1;

    while(lb <= ub){
        int mid = (lb+ub)/2;

        if(item == arr[mid]){
            loc = mid;
            break;
        }
        else if(item < arr[mid])
            ub = mid - 1;
        else
            lb = mid + 1;
    }

    return loc;
}


int main(){
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

    loc = binary_search(arr,0,n-1,item);

    if(loc==-1)
        printf("Item not found\n");
    else
        printf("%d is the position of %d in array\n",loc,item);

    return 0;
}