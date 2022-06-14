#include<stdio.h>

typedef struct mm {
    int min;
    int max;
}mm;


mm min_max(int arr[], int l, int r){
    mm st;

    if(l==r){
        st.min = arr[l];
        st.max = arr[l];
        return st;
    }

    int mid = (l+r)/2;
    mm m_m_l = min_max(arr, l, mid);
    mm m_m_r = min_max(arr, mid+1, r);

    if(m_m_l.min < m_m_r.min) st.min = m_m_l.min;
    else st.min = m_m_r.min;

    if(m_m_r.max > m_m_l.max) st.max = m_m_r.max;
    else st.max = m_m_l.max;

    return st;
}


int main(){
    int n,i;

    printf("Enter size of the array : ");
    scanf("%d", &n);

    int arr[n];
    printf("Enter the elements of the array : \n");
    for(i=0; i<n; i++){
        scanf("%d",&arr[i]);
    }

    mm ans = min_max(arr,0,n-1);
    printf("The max and min elements are %d,%d", ans.max, ans.min);

    return 0;
}