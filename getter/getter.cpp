// getter.cpp

#include "getter.h"

GetterClass::GetterClass() {
}

void GetterClass::begin() {
    // MY_MAGIC_NUMBER is given by our CXXFLAGS. See rules.mk.
    value = MY_MAGIC_NUMBER;
}

int GetterClass::getValue() {
    return value;
}

GetterClass Getter;
