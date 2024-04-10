// Beau Tse
#include <stdint.h>

static const char table[] = "0123456789ABCDEF";

//radix 8
void Bits2OctalString(uint8_t bits, char string[])
    {
    //Needs implementation
    int quotient = bits;
    int remainder = 0;
    for (int i=2; i>=0; i--) {
        remainder = quotient % 8;
        quotient = quotient / 8;
        string[i] = table[remainder];
    }
    string[3] = '\0';
    }

//radix 10
void Bits2UnsignedString(uint8_t bits, char string[])
    {
    //Needs implementation
    int quotient = bits;
    int remainder = 0;
    for (int i=2; i>=0; i--) {
        remainder = quotient % 10;
        quotient = quotient / 10;
        string[i] = table[remainder];
    }
    string[3] = '\0';
    }

//radix 16
void Bits2HexString(uint8_t bits, char string[])
    {
    //Needs implementation
    int quotient = bits;
    int remainder = 0;
    for (int i=2; i>=0; i--) {
        remainder = quotient % 16;
        quotient = quotient / 16;
        string[i] = table[remainder];
    }
    string[3] = '\0';
    }


void Bits2TwosCompString(uint8_t bits, char string[])
    {
    //Needs implementation
    if ((bits & 0b10000000) != 0) {
        string[0] = '-';
        bits = ~bits + 1;
    } 
    else 
        string[0] = '+';
    Bits2UnsignedString(bits, &string[1]);
    }

void Bits2SignMagString(uint8_t bits, char string[])
    {
    //Needs implementation
    char sign = (bits & (1 << 7)) != 0 ? '-' : '+';
    unsigned mag = bits & ~(1 << 7);
    string[0] = sign;
    Bits2UnsignedString(mag, &string[1]);
    }


//Alternative: create magnitude to string conversion function
//and use it in Bits2OctalString, Bits2UnsignedString and Bits2HexString
