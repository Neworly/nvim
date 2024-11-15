#include<stdio.h>
#include<stdbool.h>
#include<unistd.h>
#include<string.h>

struct block{
  ssize_t size;
  bool free;
};

struct blinkage{
  struct block*data;
  struct blinkage*next;
};

struct blinkage*cpbrk=NULL;
void*bpbrk=NULL;

void init_block(struct block*b,ssize_t size)
{
  b->size=size;
  b->free=false;
}

void link_block(void*block)
{
  struct block*data=(struct block*)block;
  if(cpbrk)
    cpbrk->next=(struct blinkage*)block;
    
  cpbrk=(struct blinkage*)((char*)((struct block*)block)+sizeof(struct block)+data->size);
  cpbrk->data=data;
  cpbrk->next=NULL;
}

void*get_free_block(ssize_t size)
{
  struct blinkage*block=(struct blinkage*)((char*)bpbrk+sizeof(struct blinkage));
  while(block)
  {
    bool isfree=block->data->free;
    ssize_t bsize=block->data->size;
    if(isfree&&bsize>=size)
      return block;

    block=block->next;
  }

  return NULL;
}

void*nalloc(ssize_t size)
{
  void*block;
  if(bpbrk){
    block=get_free_block(size);
    if(block!=NULL)
      return block;
  }

  block=sbrk(sizeof(struct blinkage)+sizeof(struct block)+size);
  if((void*)-1==block){
    return get_free_block(size)==NULL?(void*)-1:block;
  }
  
  init_block((struct block*)block,size);
  if(!bpbrk)
    bpbrk=block;
  link_block(block);
  
  block=((char*)block)+sizeof(struct block)+sizeof(struct blinkage);
  return((void*)block);
}

void reusable_block(struct block*block)
{
  block->free=true;
  memset(((char*)block)+sizeof(struct blinkage),0,block->size);
}

void shrink(struct block*block)
{
  sbrk(-(block->size+sizeof(struct block)+sizeof(struct blinkage)));
}

void nfree(void*block)
{
  block=((char*)block)-sizeof(struct block)-sizeof(struct blinkage);
  if(NULL==block)
    return;
  
  if(cpbrk->data!=block){
    reusable_block((struct block*)block);
    return;
  }

  if(block==cpbrk->data)
    shrink((struct block*)block);
}

int test(void){
  ssize_t s=20;
  char*t=(char*)nalloc(s);
  for(int i=0;i<s-1;i++){
      t[i]='a';
  }

  nfree(t);
  printf("%s",t);
  return 0;
}
