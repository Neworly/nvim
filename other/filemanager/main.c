#include<stdio.h>
struct Folder;

struct Folder{
  struct Folder*file;
  size_t size;
  size_t amount;
};


#define DEF_FV {NULL,0,0}
int main(void){

  return 0;
}
