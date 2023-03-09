#ifndef LBX_H
#define LBX_H

#include <stdio.h>
#include <stdlib.h>

/* Type definitions */
// Unsigned ints
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

// Signed ints
typedef signed char i8;
typedef signed short i16;
typedef signed int i32;
typedef signed long long i64;

// Floats
typedef float f32;
typedef double f64;

// Booleans
typedef int b32;
typedef char b8;

#define true 1
#define false 0

/* Platform Detection */
#ifdef __APPLE__
  #define LBX_PLATFORM_APPLE 1
  #include <TargetConditionals.h>
  #if TARGET_OS_MAC
    #define LBX_PLATFORM_MAC 1
  #endif
#endif

void test_func(void);

#endif

