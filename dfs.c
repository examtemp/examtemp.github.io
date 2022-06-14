#include<stdio.h>
int V=0;

void dfs(int i, int a[][V], int visited[]){
    printf("%d ",i);
    visited[i] = 1;
    int j;
    for(j=0; j<V; j++){
        if(a[i][j]==1 && visited[j]==0){
            dfs(j,a,visited);
        }
    }
}

int main(){
    int v,e,i,j,g,h,src;

    printf("Enter the number of vertex and edge : ");
    scanf("%d%d",&v,&e);

    int a[v][v];
    int visited[v];
    V = v;

    for(i=0; i<v; i++){
        for(j=0; j<v; j++){
            a[i][j] = 0;
        }
        visited[i] = 0;
    }

    for(i=0; i<e; i++){
        scanf("%d%d",&g,&h);
        a[g][h] = 1;
        a[h][g] = 1;
    }

    printf("Enter the source node : ");
    scanf("%d",&src);
    
    dfs(src,a,visited);

    return 0;
}