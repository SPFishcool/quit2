#include <stdlib.h>
#include <ctype.h>
#include "next_pow.h"

uint64_t next_pow2(uint64_t x) {
    int bit = 64 - __builtin_clzl(x);
    return (1ULL << (bit));
}

int main(int argc, char *argv[]){
    if (argc != 2){
        printf("%s need 1 argument.\n", argv[0]);
        return 0;
    }

    char *cvalue = argv[1];
    while(*cvalue){
        if (!isdigit(*cvalue)){
            printf("flag");
            printf("%s is not an integer.\n", argv[1]);
            return 0;
        }
        cvalue++;
    }
    uint64_t input = atoll(argv[1]);
    printf("%ld's next pow2 is %ld\n", input, next_pow2(input));

}