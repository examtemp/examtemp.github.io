#include<stdio.h>
#include<stdlib.h>

struct queue {
    int size;
    int f;
    int r;
    int* arr;
};

int isEmpty(struct queue *q){
    if(q->f == q->r)
        return 1;
    return 0;
}

int isFull(struct queue *q){
    if(q->r == q->size-1)
        return 1;
    return 0;
}

void enqueue(struct queue *q, int val){
    if(isFull(q)){
        printf("Queue is Full\n");
    }else{
        q->r++;
        q->arr[q->r] = val;
    }
}

int dequeue(struct queue *q){
    int a = -1;
    if(isEmpty(q)){
        printf("Queue is Empty\n");
    }else{
        q->f++;
        a = q->arr[q->f];
    }

    return a;
}

int main(){
    struct queue q;
    q.size = 400;
    q.f = q.r = 0;
    q.arr = (int*) malloc(q.size*sizeof(int));

    int i,j,v,e,ii,g,h;

    printf("Enter the number of vertex and edge : ");
    scanf("%d%d", &v, &e);

    int a[v][v];
    int visited[v];

    for(g=0; g<v; g++){
        for(h=0; h<v; h++){
            a[g][h] = 0;
        }
        visited[g] = 0;
    }

    for(ii=0; ii<e; ii++){
        scanf("%d%d",&g,&h);
        a[g][h] = 1;
        a[h][g] = 1;
    }

    printf("Enter the source node : ");
    scanf("%d", &i);


    printf("%d ", i);
    visited[i] = 1;
    enqueue(&q,i);

    while(!isEmpty(&q)){
        int node = dequeue(&q);
        for(j=0; j<v; j++){
            if(a[node][j]==1 && visited[j]==0){
                printf("%d ", j);
                visited[j]=1;
                enqueue(&q,j);
            }
        }
    }

    return 0;
}