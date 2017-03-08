#include<stdio.h>
#define NUM 100
int main(){
	int x,y,max;
	int num;
	int stu[NUM];
	int how[11]={0};
	
	do {
		printf("input the number of student ");
		scanf("%d",&num);
		if (num < 1 || num > NUM)
			printf("input error\n");
	}while (num < 1 || num > NUM);
	
	printf("input the score\n");
	
	for (x =0 ;x < num; x++){
		printf("NO.%d ",x+1);
		do{scanf("%d",&stu[x]);
		if (stu[x]<0||stu[x]>100)
			printf("input error");
		}while (stu[x]<0||stu[x]>100);
		how[stu[x]/10]++;
	}
	
	max=how[0];
	
	for(x=0;x<10;x++){
		if (how[x]>max)
			max=how[x];
	}
	
	for (x=max;x>0;x--){
		for(y=0;y<=10;y++){
			if (how[y]>=x)
				printf("  *  ");
			else
				printf("     ");
		}
		printf("\n");
	}
	
	printf("--------------------------------------------------------\n  0   10   20   30   40   50   60   70   80   90   100\n");
	
	return 0;
}
