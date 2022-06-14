#include<stdio.h>

int V = 0;

void floyd(int mat[][V]){
    int k,i,j;

    for(k=0; k<V; k++){
        for(i=0; i<V; i++){
            for(j=0; j<V; j++){
                // if(i==j) mat[i][j] = 0;
                if(mat[i][j] > mat[i][k] + mat[k][j]){
                    mat[i][j] = mat[i][k] + mat[k][j];
                }
            }
        }
    }

    printf("Resultant matrix : \n");
    for(i=0; i<V; i++){
        for(j=0; j<V; j++){
            printf("%d ",mat[i][j]);
        }
        printf("\n");
    }
}

int main(){
    int v,e,a,b,i;

    printf("Enter the number of vertex & edge : ");
    scanf("%d%d",&v,&e);

    int mat[v][v];
    V = v;

    for(a=0; a<v; a++){
        for(b=0; b<v; b++){
            if(a==b) mat[a][b]=0;
            else mat[a][b] = 999;
        }
    }

    for(i=0; i<e; i++){
        int wt;
        scanf("%d%d%d",&a,&b,&wt);
        mat[a][b] = wt;
        mat[b][a] = wt;
    }

    floyd(mat);

    return 0;
}