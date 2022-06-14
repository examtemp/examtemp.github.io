#include<stdio.h>

typedef struct Edge{
    int source;
    int destination;
    int weight;
}Edge;

int cmp(Edge a, Edge b){
    return a.weight < b.weight;
}

void merge(Edge A[], int mid, int low, int high){
    int i,j,k;
    Edge B[100];
    i = low;
    j = mid+1;
    k = low;

    while(i<=mid && j<=high){
        if(cmp(A[i],A[j])){
            B[k] = A[i];
            i++;
            k++;
        }
        else{
            B[k] = A[j];
            j++;
            k++;
        }
    }

    while(i<=mid){
        B[k] = A[i];
        i++;
        k++;
    }

    while(j<=high){
        B[k] = A[j];
        j++;
        k++;
    }

    for(i=low; i<=high; i++){
        A[i] = B[i];
    }
}

void sort(Edge A[], int low, int high){
    int mid;
    if(low<high){
        mid = (low+high)/2;
        sort(A,low,mid);
        sort(A,mid+1,high);
        merge(A,mid,low,high);
    }
}

int findParent(int v, int *parent){
    if(parent[v]==v) return v;
    return findParent(parent[v],parent);
}

void krushkal(Edge *input, int n, int E){
    sort(input,0,E-1);

    int parent[n+1];
    Edge output[n+1];

    int i;
    for(i=1; i<=n; i++){
        parent[i] = i;
    }

    int count=1;
    int j=0;

    while(count!=n){
        Edge currEdge = input[j];

        int sourceParent = findParent(currEdge.source,parent);
        int destParent = findParent(currEdge.destination,parent);

        if(sourceParent != destParent){
            output[count] = currEdge;
            count++;
            parent[sourceParent] = destParent;
        }
        j++;
    }

    int totalwt=0;
    for(i=1; i<n; i++){
        if(output[i].source < output[i].destination){
            printf("%d - %d  ==>  %d\n", output[i].source, output[i].destination, output[i].weight);
        }else{
            printf("%d - %d  ==>  %d\n", output[i].destination, output[i].source, output[i].weight);
        }
        totalwt += output[i].weight;
    }

    printf("Total weight of the MST : %d\n",totalwt);
}

int main(){
    int n,E,i,j,val;

    printf("Enter the number of vertex and edge : ");
    scanf("%d%d", &n, &E);

    int mat[n+1][n+1];
    Edge input[E];

    for(i=1; i<=n; i++){
        for(j=1; j<=n; j++){
            scanf("%d",&val);
            mat[i][j] = val;
        }
    }

    int count=0;
    for(i=1; i<=n; i++){
        for(j=i+1; j<=n; j++){
            if(mat[i][j]!=0) {
                input[count].source = i;
                input[count].destination = j;
                input[count].weight = mat[i][j];
                count++;
            }
        }
    }

    krushkal(input,n,E);

    return 0;
}