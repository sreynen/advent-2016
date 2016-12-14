#include <stdio.h>

int binones(int number);

int main () {
  int x, y, value;
  char bin[80];
  for (y=0; y<52; y++) {
    for (x=0; x<52; x++) {
      value = (x*x + 3*x + 2*x*y + y + y*y) + 1362;
      if (binones(value) % 2 == 0) {
        printf(".");
      }
      else {
        printf("#");
      }
    }
    printf("\n");
  }
}

int binones(int number)
{
  int k = 0, n = 0, ones = 0;
  int remain;

  do
  {
    remain = number % 2;
    number = number / 2;
    ones += remain;
  } while (number > 0);

  return ones;
}
