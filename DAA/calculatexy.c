#include<stdio.h>

int power(int x, int n){
    if(n==0) return 1;
    if(x==0) return 0;
    
    return x * power(x,n-1);
}

int main(){
    int n,x;

    printf("Enter the number and power : ");
    scanf("%d %d",&x,&n);

    printf("%d^%d is %d",x,n,power(x,n));

    return 0;
}