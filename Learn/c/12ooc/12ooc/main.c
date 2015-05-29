//
//  main.c
//  12ooc
//
//  Created by WangChao on 6/20/14.
//  Copyright (c) 2014 WangChao. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#define ObjectField \
void(*ondelete)(struct Object*);


typedef struct Object
{
    ObjectField
} Object;

#define ObjectCreate(Type) malloc(sizeof(Type))

void ObjectDelete(Object *obj)
{
    obj->ondelete(obj);
    free(obj);
}

void ObjectOnDelete(Object *obj)
{
    printf("object on delete\n");
}

Object* ObjectInit(Object *obj)
{
    obj->ondelete = ObjectOnDelete;
    return obj;
}


typedef struct
{
    ObjectField

    int age;
    void (*sayhello)();

} People;
/*
People *createPeople()
{
    return malloc(sizeof(People));
}

void deletePeople(People *p)
{
    free(p);
}
*/
void sayHelloPeople()
{
    printf("say hello people\n");
}


void PeopleOnDelete(Object *p)
{
    ObjectOnDelete(p);
    printf(" people on delete\n");

}


People * peopleInit(People *p ,int age)
{
    ObjectInit((Object*)p);
    p->age = age;
    p->sayhello = sayHelloPeople;
    p->ondelete = PeopleOnDelete;
    return p;
}

int main(int argc, const char * argv[])
{
    People *p = peopleInit(ObjectCreate(People), 20);
    p->sayhello();
    ObjectDelete(p);
    return 0;
}

