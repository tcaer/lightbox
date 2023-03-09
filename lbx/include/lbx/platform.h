#ifndef LBX_PLATFORM_H
#define LBX_PLATFORM_H

/* Platform Detection */
#ifdef __APPLE__
  #define LBX_PLATFORM_APPLE 1
  #include <TargetConditionals.h>
  #if TARGET_OS_MAC
    #define LBX_PLATFORM_MAC 1
  #endif
#endif

#endif
