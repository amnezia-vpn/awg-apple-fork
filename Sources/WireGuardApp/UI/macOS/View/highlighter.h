/* SPDX-License-Identifier: MIT */
/*
 * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 * Copyright (C) 2024 Amnezia VPN. All Rights Reserved.
 */

#include <sys/types.h>
#define MOBILE_WGQUICK_SUBSET

enum highlight_type {
	HighlightSection,
	HighlightField,
	HighlightPrivateKey,
	HighlightPublicKey,
	HighlightPresharedKey,
	HighlightIP,
	HighlightCidr,
	HighlightHost,
	HighlightPort,
	HighlightMTU,
	HighlightKeepalive,
	HighlightComment,
	HighlightJc,
	HighlightJmin,
	HighlightJmax,
	HighlightS1,
	HighlightS2,
	HighlightH1,
	HighlightH2,
	HighlightH3,
	HighlightH4,
	HighlightDelimiter,
#ifndef MOBILE_WGQUICK_SUBSET
	HighlightTable,
	HighlightFwMark,
	HighlightSaveConfig,
	HighlightCmd,
#endif
	HighlightError,
	HighlightEnd
};

struct highlight_span {
	enum highlight_type type;
	size_t start, len;
};

struct highlight_span *highlight_config(const char *config);
