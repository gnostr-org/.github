/*
 * Generated by ./misc/optlib2c from optlib/qemuhx.ctags, Don't edit this manually.
 */
#include "general.h"
#include "parse.h"
#include "routines.h"
#include "field.h"
#include "xtag.h"


static void initializeQemuHXParser (const langType language CTAGS_ATTR_UNUSED)
{
}

extern parserDefinition* QemuHXParser (void)
{
	static const char *const extensions [] = {
		"hx",
		NULL
	};

	static const char *const aliases [] = {
		NULL
	};

	static const char *const patterns [] = {
		NULL
	};

	static kindDefinition QemuHXKindTable [] = {
		{
		  true, 'q', "qmp", "QEMU Management Protocol dispatch table entries",
		},
		{
		  true, 'i', "infoitem", "item in texinfo doc",
		},
	};
	static xtagDefinition QemuHXXtagTable [] = {
		{
		  .enabled     = true,
		  .name        = "funcmap",
		  .description = "Include mapping SQMP to C function name",
		},
	};
	static tagRegexTable QemuHXTagRegexTable [] = {
		{"^SQMP[[:space:]]([-a-z_0-9A-Z]+)[[:space:]]---", "\\1",
		"q", "{mgroup=1}", NULL, true},
		{"^SQMP[[:space:]]([-a-z_0-9A-Z]+)[[:space:]]---", "qmp_\\1",
		"q", "{mgroup=1}{_extra=funcmap}"
		"{{\n"
		"    . :name dup (-_) _tr!\n"
		"    . exch name:\n"
		"}}", NULL, true},
		{"^@item[[:space:]]{1,}([-.a-z_0-9A-Z]{1,})", "\\1",
		"i", NULL, NULL, false},
	};


	parserDefinition* const def = parserNew ("QemuHX");

	def->versionCurrent= 0;
	def->versionAge    = 0;
	def->enabled       = true;
	def->extensions    = extensions;
	def->patterns      = patterns;
	def->aliases       = aliases;
	def->method        = METHOD_NOT_CRAFTED|METHOD_REGEX;
	def->useCork       = CORK_QUEUE;
	def->kindTable     = QemuHXKindTable;
	def->kindCount     = ARRAY_SIZE(QemuHXKindTable);
	def->xtagTable     = QemuHXXtagTable;
	def->xtagCount     = ARRAY_SIZE(QemuHXXtagTable);
	def->tagRegexTable = QemuHXTagRegexTable;
	def->tagRegexCount = ARRAY_SIZE(QemuHXTagRegexTable);
	def->initialize    = initializeQemuHXParser;

	return def;
}
