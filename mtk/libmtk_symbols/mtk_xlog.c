#include <log/log.h>
#include <cutils/log.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <string.h>

#define XLOG_DEVICE "/proc/xlog/setfil"

#define XLOG_NAME_MAX_LEN 64

#define XLOG_SET_LEVEL       12
#define XLOG_GET_LEVEL       13
#define XLOG_SET_TAG_LEVEL   14

#define XLOG_FILTER_DEFAULT_LEVEL 0x00223222

#define LOG_TAG "xlog"

struct xlog_entry {
	char name[XLOG_NAME_MAX_LEN];
	uint32_t level;
};

int xlogf_set_level(uint32_t level)
{
    int ret = -1;
    int fd = open(XLOG_DEVICE, O_RDONLY);
    if (fd >= 0) {
        if (ioctl(fd, XLOG_SET_LEVEL, level) == 0) {
            ret = 0;
        }
        close(fd);
    }
    return ret;
}

uint32_t xlogf_get_level(void)
{
    uint32_t level = XLOG_FILTER_DEFAULT_LEVEL;
    int fd = open(XLOG_DEVICE, O_RDONLY);
    if (fd >= 0) {
        ioctl(fd,XLOG_GET_LEVEL, &level);
        close(fd);
    }

    return level;
}

int xlogf_tag_set_level(const char *name, uint32_t level)
{
    int ret = -1;
    int fd = open(XLOG_DEVICE, O_RDONLY);
    if (fd >= 0) {
        struct xlog_entry ent;

        memset(&ent, 0, sizeof(sizeof(struct xlog_entry)));
        strlcpy(ent.name, name, XLOG_NAME_MAX_LEN);
        ent.level = level;
        if (ioctl(fd, XLOG_SET_TAG_LEVEL, &ent) == 0) {
            ret = 0;
        }
        close(fd);
    }
    return ret;
}

struct xlog_record {
    const char *tag_str;
    const char *fmt_str;
    int prio;
};

void __attribute__((weak)) __xlog_buf_printf(__unused int bufid, const struct xlog_record *xlog_record, ...) {
    va_list args;
    va_start(args, xlog_record);
#if    HAVE_LIBC_SYSTEM_PROPERTIES
    int len = 0;
    int do_xlog = 0;
    char results[PROP_VALUE_MAX];


    // MobileLog
    len = __system_property_get ("debug.MB.running", results);
    if (len && atoi(results))
        do_xlog = 1;

    // ModemLog
    len = __system_property_get ("debug.mdlogger.Running", results);
    if (len && atoi(results))
        do_xlog = 1;

    // Manual
    len = __system_property_get ("persist.debug.xlog.enable", results);
    if (len && atoi(results))
        do_xlog = 1;

    if (do_xlog > 0)
#endif
        __android_log_vprint(xlog_record->prio, xlog_record->tag_str, xlog_record->fmt_str, args);

    return;
}
