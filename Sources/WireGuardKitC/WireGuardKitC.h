// // SPDX-License-Identifier: MIT
// // Copyright © 2018-2023 WireGuard LLC. All Rights Reserved.


#include "key.h"
#include "x25519.h"



#include "key.h"
#include "x25519.h"

#include <sys/types.h>

#if MACOS_NE
#include <sys/kern_control.h>
#else
/* From <sys/kern_control.h> */
struct ctl_info {
    u_int32_t   ctl_id;
    char        ctl_name[96];
};
struct sockaddr_ctl {
    u_char      sc_len;
    u_char      sc_family;
    u_int16_t   ss_sysaddr;
    u_int32_t   sc_id;
    u_int32_t   sc_unit;
    u_int32_t   sc_reserved[5];
};
#endif

#define CTLIOCGINFO 0xc0644e03UL
