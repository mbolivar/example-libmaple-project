/* randomizer.c */

#include <stdlib.h>
#include "randomizer.h"

void randomizer_init(int value) {
    srand((unsigned)value);
}

long randomizer_get_value(void) {
    return rand();
}
