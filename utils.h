//
// Created by Yifan Yang on 5/30/22.
//

#ifndef POOP_MASTER_UTILS_H
#define POOP_MASTER_UTILS_H

#include <chrono>

#define hex(x) ((x) <= 9 ? '0' + (x) : 'a' + (x)-10)
#define digit(x, i) ((x) >> (4 * (7 - (i))) & 0xF)

// add a int to a 256-bit integer
void add_nonce(unsigned int *nonce, unsigned int v)
{
    nonce[7] += v;
    v = nonce[7] < v;
    nonce[6] += v;
    v = nonce[6] < v;
    nonce[5] += v;
    v = nonce[5] < v;
    nonce[4] += v;
    v = nonce[4] < v;
    nonce[3] += v;
    v = nonce[3] < v;
    nonce[2] += v;
    v = nonce[2] < v;
    nonce[1] += v;
    v = nonce[1] < v;
    nonce[0] += v;
}

void write_nonce(unsigned int *nonce, char *dst)
{
    for (int i = 7; i >= 0; i--)
    {
        unsigned int v = nonce[i];
        dst[i * 8 + 0] = hex(digit(v, 0));
        dst[i * 8 + 1] = hex(digit(v, 1));
        dst[i * 8 + 2] = hex(digit(v, 2));
        dst[i * 8 + 3] = hex(digit(v, 3));
        dst[i * 8 + 4] = hex(digit(v, 4));
        dst[i * 8 + 5] = hex(digit(v, 5));
        dst[i * 8 + 6] = hex(digit(v, 6));
        dst[i * 8 + 7] = hex(digit(v, 7));
    }
}

uint64_t milliseconds_since_epoch() {
    return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count();
}

#undef hex
#undef digit

#endif //POOP_MASTER_UTILS_H
