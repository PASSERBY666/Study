/*
	显示所选动物的叫声
*/

#include <stdio.h>

enum animal { Dog, Cat, Monkey, Invalid };

/*--- 狗叫 ---*/
void dog(void)
{
	puts("wolf!!");
}

/*--- 猫叫 ---*/
void cat(void)
{
	puts("miao~!!");
}

/*--- 猴叫 ---*/
void monkey(void)
{
	puts("qiqi!!");
}

/*--- 选择动物 ---*/
enum animal select(void)
{
	int tmp;

	do {
		printf("0···dog  1···cat  2···monkey   3···end：");
		scanf("%d", &tmp);
	} while (tmp < Dog || tmp > Invalid);
	return tmp;
}

int main(void)
{
	enum animal selected;

	do {
		switch (selected = select()) {
		 case Dog	 : dog();	 break;
		 case Cat	 : cat();	 break;
		 case Monkey : monkey(); break;
		}
	} while (selected != Invalid);

	return 0;
}