#include <iostream>
#define N 36
using namespace std;

void disp(char pos, char* sol, char* valid,char k);
char checkAll(char* sol, char* valid);
char check1(char a,  char b,  char ris);
char check2(char a,  char b, char c, char ris);
char check1N(char a, char b, char ris);


char c[N+1]="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

int main() {
    char sol[16]={0};
    char valid[16]={0};
    disp(0,sol,valid,16);
    return 0;
}

void disp(char pos, char* sol, char* valid, char k){
    char i;
    if(pos==k){
        for (int q =0 ;q<k;q++){
            cout <<c[sol[q]];
        }
        cout<<endl;
        exit(0);
    }

    for(i=0;i<N;i++){

        valid[pos]=1;
        sol[pos]=i;
        if(checkAll(sol, valid)){
            disp(pos+1, sol, valid,k);
        }
        valid[pos]=0;
    }
}

char checkAll(char* sol, char* valid){
    if(valid[0]&&valid[1]){
        if(!check1(sol[0],sol[1],14)){
            return 0;
        }
    }
    if(valid[2]&&valid[3]){
        if(!check1(sol[2],sol[3],24)){
            return 0;
        }
    }
    if(valid[2]&&valid[0]){
        if(!check1N(sol[2],sol[0],6)){
            return 0;
        }
    }
    if(valid[3]&&valid[1]&&valid[5]){
        if(!check2(sol[3],sol[1],sol[5],4)){
            return 0;
        }
    }
    if(valid[2]&&valid[4]&&valid[6]){
        if(!check2(sol[2],sol[4],sol[6],13)){
            return 0;
        }
    }
    if(valid[3]&&valid[4]&&valid[5]){
        if(!check2(sol[3],sol[4],sol[5],22)){
            return 0;
        }
    }
    if(valid[6]&&valid[8]&&valid[10]){
        if(!check2(sol[6],sol[8],sol[10],31)){
            return 0;
        }
    }
    if(valid[1]&&valid[4]&&valid[7]){
        if(!check2(sol[1],sol[4],sol[7],7)){
            return 0;
        }
    }
    if(valid[9]&&valid[12]&&valid[15]){
        if(!check2(sol[9],sol[12],sol[15],20)){
            return 0;
        }
    }
    if(valid[13]&&valid[14]&&valid[15]){
        if(!check2(sol[13],sol[14],sol[15],12)){
            return 0;
        }
    }
    if(valid[8]&&valid[9]&&valid[10]){
        if(!check2(sol[8],sol[9],sol[10],27)){
            return 0;
        }
    }
    if(valid[7]&&valid[12]&&valid[13]){
        if(!check2(sol[7],sol[12],sol[13],23)){
            return 0;
        }
    }
    return 1;
}
char check1(const char a,const char b,const char ris){
    return ((a+b)%36)==ris;
};
char check1N(const char a, const char b,const char ris){
    return ((a-b)%36)==ris;
}
char check2(const char a,const char b,const char c, const char ris){
    return ((a+b+c)%36)==ris;
};
