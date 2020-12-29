#if (__GNUC__ > 2) || (__GNUC__ == 2 && __GNUC_MINOR__ > 4)
#       define PGM_GNUC_UNUSED         __attribute__((__unused__))
#else
#       define PGM_GNUC_UNUSED
#endif
