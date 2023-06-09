/*
 *
 *  Copyright (c) 2016, Red Hat, Inc.
 *  Copyright (c) 2016, Masatake YAMATO
 *
 *  Author: Masatake YAMATO <yamato@redhat.com>
 *
 *   This source code is released for free distribution under the terms of the
 *   GNU General Public License version 2 or (at your option) any later version.
 *
 */
#ifndef CTAGS_MAIN_PARAM_H
#define CTAGS_MAIN_PARAM_H

/*
*   INCLUDE FILES
*/
#include "general.h"

#include "types.h"


/*
*   DATA DECLARATIONS
*/
struct sParamDefinition {
	const char *name;
	const char *desc;
	bool  (* handleParam) (langType lang, const char *name, const char *arg);
};

/*
*   FUNCTION PROTOTYPES
*/
extern bool paramParserBool (const char *value, bool fallback,
							 const char *errWhat, const char *errCategory);

#endif	/* CTAGS_MAIN_PARAM_H */
