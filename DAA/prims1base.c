#include<stdio.h>
#include<stdbool.h>
#include<limits.h>
int V=0;


int minKey(int key[], bool mstSet[]){
    int min = INT_MAX, min_index,v;

    for(v=1; v<=V; v++){
        if(mstSet[v]==false && key[v]<min){
            min = key[v];
            min_index = v;
        }
    }

    return min_index;
}


void printMST(int parent[], int graph[][V+1]){
    int i,totalwt=0;
    printf("\n");
    for(i=2; i<=V; i++){
        printf("%d - %d  ==>  %d\n",parent[i],i,graph[i][parent[i]]);
        totalwt += graph[i][parent[i]];
    }

    printf("Total weight of the MST : %d\n",totalwt);
}

void primMST(int graph[][V+1]){
    int i,j,v,count;
    int parent[V+1];
    int key[V+1];
    bool mstSet[V+1];

    for(i=1; i<=V; i++){
        key[i] = INT_MAX;
        mstSet[i] = false;
    }

    key[1] = 0;
    parent[1] = -1;

    for(count=1; count<=V-1; count++){
        int u = minKey(key,mstSet);
        mstSet[u] = true;

        for(v=1; v<=V; v++){
            if(graph[u][v] && mstSet[v]==false && graph[u][v]<key[v]){
                parent[v] = u;
                key[v] = graph[u][v];
            }
        }
    }

    printMST(parent,graph);
}

int main(){
    int v,i,j;

    printf("Enter the number of vertex : ");
    scanf("%d",&v);

    int graph[v+1][v+1];
    V = v;

    for(i=1; i<=v; i++){
        for(j=1; j<=v; j++){
            scanf("%d",&graph[i][j]);
        }
    }

    primMST(graph);

    return 0;
}