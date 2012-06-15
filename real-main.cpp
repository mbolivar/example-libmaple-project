// Here's a wirish include:
#include <wirish.h>

// And some local includes:
#include "getter.h"
#include "randomizer.h"

// setup() and loop():

void setup(void) {
    Getter.begin();
    randomizer_init(Getter.getValue());
}

void loop(void) {
    SerialUSB.print("The value is: ");
    SerialUSB.println(randomizer_get_value());
}

// Standard libmaple init() and main.
//
// The init() part makes sure your board gets set up correctly. It's
// best to leave that alone unless you know what you're doing. main()
// is the usual "call setup(), then loop() forever", but of course can
// be whatever you want.

__attribute__((constructor)) void premain() {
    init();
}

int main(void) {
    setup();

    while (true) {
        loop();
    }

    return 0;
}
