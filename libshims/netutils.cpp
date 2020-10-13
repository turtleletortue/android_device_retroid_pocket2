// Credit: From https://github.com/LineageOS-MediaTek/android_device_mediatek_common/blob/cm-14.1/libshims/netutils.c

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <linux/sockios.h>
#include <sys/socket.h>
#include <log/log.h>
#include <sys/types.h>
#include <netutils/ifc.h>
#include "../../../../bionic/libc/kernel/uapi/linux/if.h" //FIX THIS

#define SIOCSTXQSTATE (SIOCDEVPRIVATE + 0)  //start/stop ccmni tx queue
#define SIOCSCCMNICFG (SIOCDEVPRIVATE + 1)  //configure ccmni/md remapping
extern "C" {
const char ipv6_proc_path[] = "/proc/sys/net/ipv6/conf";

struct sockaddr_un {
  __kernel_sa_family_t sun_family;
  char sun_path[108];
};

static int ifc_netd_sock_init(void)
{
    int ifc_netd_sock;
    const int one = 1;
    struct sockaddr_un netd_addr;

        ifc_netd_sock = socket(AF_UNIX, SOCK_STREAM, 0);
        if (ifc_netd_sock < 0) {
            return -1;
        }

        setsockopt(ifc_netd_sock, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one));
        memset(&netd_addr, 0, sizeof(netd_addr));
        netd_addr.sun_family = AF_UNIX;
        strlcpy(netd_addr.sun_path, "/dev/socket/netd",
            sizeof(netd_addr.sun_path));
        if (TEMP_FAILURE_RETRY(connect(ifc_netd_sock,
                     (const struct sockaddr*) &netd_addr,
                     sizeof(netd_addr))) != 0) {
            close(ifc_netd_sock);
            return -1;
        }

    return ifc_netd_sock;
}

int ifc_set_throttle(const char *ifname, int rxKbps, int txKbps)
{
    FILE* fnetd = NULL;
    int ret = -1;
    int seq = 1;
    char rcv_buf[24];
    int nread = 0;
    int netd_sock = 0;

    ALOGD("enter ifc_set_throttle: ifname = %s, rx = %d kbs, tx = %d kbs", ifname, rxKbps, txKbps);

    netd_sock = ifc_netd_sock_init();
    if(netd_sock <= 0)
        goto exit;

    // Send the request.
    fnetd = fdopen(netd_sock, "r+");
	if(fnetd == NULL){
		ALOGE("open netd socket failed, err:%d(%s)", errno, strerror(errno));
		goto exit;
	}
    if (fprintf(fnetd, "%d interface setthrottle %s %d %d", seq, ifname, rxKbps, txKbps) < 0) {
        goto exit;
    }
    // literal NULL byte at end, required by FrameworkListener
    if (fputc(0, fnetd) == EOF ||
        fflush(fnetd) != 0) {
        goto exit;
    }
    ret = 0;

	//Todo: read the whole response from netd
	nread = fread(rcv_buf, 1, 20, fnetd);
	rcv_buf[23] = 0;
	ALOGD("response: %s", rcv_buf);
exit:
    if (fnetd != NULL) {
        fclose(fnetd);
    }

    return ret;
}

int ifc_set_txq_state(const char *ifname, int state)
{
    struct ifreq ifr;
    int ret, ctl_sock;

    memset(&ifr, 0, sizeof(struct ifreq));
    strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
    ifr.ifr_name[IFNAMSIZ - 1] = 0;
    ifr.ifr_ifru.ifru_ivalue = state;

    ctl_sock = socket(AF_INET, SOCK_DGRAM, 0);
    if(ctl_sock < 0){
	ALOGE("create ctl socket failed\n");
	return -1;
    }
    ret = ioctl(ctl_sock, SIOCSTXQSTATE, &ifr);
    if(ret < 0)
	ALOGE("ifc_set_txq_state failed, err:%d(%s)\n", errno, strerror(errno));
    else
	ALOGI("ifc_set_txq_state as %d, ret: %d\n", state, ret);

    close(ctl_sock);

    return ret;
}

int ifc_ccmni_md_cfg(const char *ifname, int md_id)
{
    struct ifreq ifr;
    int ret = 0;
    int ctl_sock = 0;

    memset(&ifr, 0, sizeof(struct ifreq));
    strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
    ifr.ifr_name[IFNAMSIZ - 1] = 0;
    ifr.ifr_ifru.ifru_ivalue = md_id;

    ctl_sock = socket(AF_INET, SOCK_DGRAM, 0);
    if(ctl_sock < 0){
	return -1;
    }

    if(ioctl(ctl_sock, SIOCSCCMNICFG, &ifr) < 0) {
	ret = -1;
    }

    close(ctl_sock);
    return ret;
}

static int setEnableIPv6(char* ifname, int on) {
    char *path;
    const char *value = on ? "0" : "1";
    ssize_t size = strlen(value);

    //full path: proc/sys/net/ipv6/conf/ifname/disalbe_ipv6
    asprintf(&path, "%s/%s/%s", ipv6_proc_path, ifname, "disable_ipv6");
    ALOGE("setEnableIPv6: set path %s to %s", path, value);
    int fd = open(path, O_WRONLY);
    if (fd < 0) {
        ALOGE("Failed to open %s: %s", path, strerror(errno));
        return -1;
    }

    if (write(fd, value, size) != size) {
        ALOGE("Failed to write %s: %s", path, strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    free(path);
    return 0;
}

static int setIPv6DefaultRoute(char* ifname, int on) {
    char *path;
    const char *value = on ? "1" : "0";
    ssize_t size = strlen(value);

    //full path: /proc/sys/net/ipv6/conf/ccmni0/accept_ra_defrtr
    asprintf(&path, "%s/%s/%s", ipv6_proc_path, ifname, "accept_ra_defrtr");
    ALOGE("setIPv6DefaultRoute: set path %s to %s", path, value);
    int fd = open(path, O_WRONLY);
    if (fd < 0) {
        ALOGE("Failed to open %s: %s", path, strerror(errno));
        return -1;
    }

    if (write(fd, value, size) != size) {
        ALOGE("Failed to write %s: %s", path, strerror(errno));
        close(fd);
        return -1;
    }
    close(fd);
    free(path);
    return 0;
}

int ifc_ipv6_trigger_rs(char *ifname){
    int errNo = setEnableIPv6(ifname, 0);
     if (errNo < 0) {
         ALOGE("ifc_ipv6_irat_triger_rs disable interface %s IPv6 fail %d",ifname, errNo);
     }
     errNo = setEnableIPv6(ifname, 1);
     if (errNo < 0) {
         ALOGE("ifc_ipv6_irat_triger_rs enalbe interface %s IPv6 fail %d",ifname, errNo);
     }

    //set accept_ra_defrtr 1
    errNo = setIPv6DefaultRoute(ifname,1);
    if (errNo < 0) {
         ALOGE("ifc_ipv6_irat_triger_rs enalbe interface %s accept_ra_defrtr fail %d",ifname, errNo);
     }

    return 0;
}
}
