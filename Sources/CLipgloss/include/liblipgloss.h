// Sources/CLipgloss/include/lipgloss.h
/* Code generated by cmd/cgo; DO NOT EDIT. */

/* package command-line-arguments */


#line 1 "cgo-builtin-export-prolog"

#include <stddef.h>

#ifndef GO_CGO_EXPORT_PROLOGUE_H
#define GO_CGO_EXPORT_PROLOGUE_H

#ifndef GO_CGO_GOSTRING_TYPEDEF
typedef struct { const char *p; ptrdiff_t n; } _GoString_;
#endif

#endif

/* Start of preamble from import "C" comments.  */


#line 3 "lipgloss_wrapper.go"

#include <stdbool.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "position_wrapper.go"

#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "border_wrapper.go"

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "color_wrapper.go"

#include <stdbool.h>
#include <stdlib.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "renderer_wrapper.go"

#include <stdio.h>
#include <stdbool.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_alignment.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_color.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_layout.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_registry.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_render.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_text.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "style_border.go"

#include <stdlib.h>
#include <stdint.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"

#line 3 "utils.go"

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include "lipgloss_types.h"

#line 1 "cgo-generated-wrapper"


/* End of preamble from import "C" comments.  */


/* Start of boilerplate cgo prologue.  */
#line 1 "cgo-gcc-export-header-prolog"

#ifndef GO_CGO_PROLOGUE_H
#define GO_CGO_PROLOGUE_H

typedef signed char GoInt8;
typedef unsigned char GoUint8;
typedef short GoInt16;
typedef unsigned short GoUint16;
typedef int GoInt32;
typedef unsigned int GoUint32;
typedef long long GoInt64;
typedef unsigned long long GoUint64;
typedef GoInt64 GoInt;
typedef GoUint64 GoUint;
typedef size_t GoUintptr;
typedef float GoFloat32;
typedef double GoFloat64;
#ifdef _MSC_VER
#include <complex.h>
typedef _Fcomplex GoComplex64;
typedef _Dcomplex GoComplex128;
#else
typedef float _Complex GoComplex64;
typedef double _Complex GoComplex128;
#endif

/*
  static assertion to make sure the file is being used on architecture
  at least with matching size of GoInt.
*/
typedef char _check_for_64_bit_pointer_matching_GoInt[sizeof(void*)==64/8 ? 1:-1];

#ifndef GO_CGO_GOSTRING_TYPEDEF
typedef _GoString_ GoString;
#endif
typedef void *GoMap;
typedef void *GoChan;
typedef struct { void *t; void *v; } GoInterface;
typedef struct { void *data; GoInt len; GoInt cap; } GoSlice;

#endif

/* End of boilerplate cgo prologue.  */

#ifdef __cplusplus
extern "C" {
#endif

extern char* ColorProfile();
extern _Bool HasDarkBackground();
extern int Height(char* str);
extern char* JoinHorizontal(double pos, char* str1, char* str2);
extern char* JoinVertical(double pos, char* str1, char* str2);
extern char* Place(int width, int height, double hPos, double vPos, char* str);
extern char* PlaceHorizontal(int width, double pos, char* str);
extern char* PlaceVertical(int height, double pos, char* str);
extern void SetColorProfile(char* profile);
extern void SetHasDarkBackground(_Bool b);

/* Return type for Size */
struct Size_return {
	int r0;
	int r1;
};
extern struct Size_return Size(char* str);
extern char* StyleRunes(char* str, int* indices, int indicesLen, void* matchedHandle, void* unmatchedHandle);
extern int Width(char* str);
extern float PositionTop();
extern float PositionBottom();
extern float PositionCenter();
extern float PositionLeft();
extern float PositionRight();
extern CBorder BlockBorder();
extern CBorder DoubleBorder();
extern CBorder HiddenBorder();
extern CBorder InnerHalfBlockBorder();
extern CBorder NormalBorder();
extern CBorder OuterHalfBlockBorder();
extern CBorder RoundedBorder();
extern CBorder ThickBorder();
extern void FreeBorder(CBorder b);
extern int GetBottomSize(CBorder b);
extern int GetLeftSize(CBorder b);
extern int GetRightSize(CBorder b);
extern int GetTopSize(CBorder b);
extern CBorder CreateCustomBorder(char* top, char* bottom, char* left, char* right, char* topLeft, char* topRight, char* bottomLeft, char* bottomRight, char* middleLeft, char* middleRight, char* middle, char* middleTop, char* middleBottom);
extern char* MapTerminalColor(void* tcHandle);

/* Return type for GetTerminalColorRGBA */
struct GetTerminalColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct GetTerminalColorRGBA_return GetTerminalColorRGBA(void* tcHandle);

/* Return type for ColorRGBA */
struct ColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct ColorRGBA_return ColorRGBA(char* c);

/* Return type for ANSIColorRGBA */
struct ANSIColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct ANSIColorRGBA_return ANSIColorRGBA(unsigned int value);

/* Return type for AdaptiveColorRGBA */
struct AdaptiveColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct AdaptiveColorRGBA_return AdaptiveColorRGBA(char* light, char* dark);

/* Return type for CompleteColorRGBA */
struct CompleteColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct CompleteColorRGBA_return CompleteColorRGBA(char* trueColor, char* ansi256, char* ansi);

/* Return type for CompleteAdaptiveColorRGBA */
struct CompleteAdaptiveColorRGBA_return {
	uint32_t r0; /* r */
	uint32_t r1; /* g */
	uint32_t r2; /* b */
	uint32_t r3; /* a */
};
extern struct CompleteAdaptiveColorRGBA_return CompleteAdaptiveColorRGBA(char* lightTrue, char* lightANSI256, char* lightANSI, char* darkTrue, char* darkANSI256, char* darkANSI);
extern void DefaultRenderer();
extern void NewRenderer(FILE* w);
extern char* RendererColorProfile();
extern _Bool RendererHasDarkBackground();
extern void* RendererNewStyle();
extern char* RendererPlace(int width, int height, double hPos, double vPos, char* str);
extern char* RendererPlaceHorizontal(int width, double pos, char* str);
extern char* RendererPlaceVertical(int height, double pos, char* str);
extern void RendererSetColorProfile(char* p);
extern void RendererSetHasDarkBackground(_Bool b);
extern void RendererSetOutput(FILE* o);
extern uint64_t StyleAlignHorizontal(uint64_t id, double position);
extern uint64_t StyleAlignVertical(uint64_t id, double position);
extern uint64_t StylePadding(uint64_t id, int top, int right, int bottom, int left);
extern uint64_t StylePaddingTop(uint64_t id, int v);
extern uint64_t StylePaddingRight(uint64_t id, int v);
extern uint64_t StylePaddingBottom(uint64_t id, int v);
extern uint64_t StylePaddingLeft(uint64_t id, int v);
extern uint64_t StyleMargin(uint64_t id, int top, int right, int bottom, int left);
extern uint64_t StyleMarginTop(uint64_t id, int v);
extern uint64_t StyleMarginRight(uint64_t id, int v);
extern uint64_t StyleMarginBottom(uint64_t id, int v);
extern uint64_t StyleMarginLeft(uint64_t id, int v);
extern uint64_t StyleForeground(uint64_t id, char* color);
extern uint64_t StyleBackground(uint64_t id, char* color);
extern uint64_t StyleColorWhitespace(uint64_t id, int v);
extern uint64_t StyleMarginBackground(uint64_t id, char* color);
extern uint64_t StyleWidth(uint64_t id, int width);
extern uint64_t StyleHeight(uint64_t id, int height);
extern uint64_t StyleMaxWidth(uint64_t id, int width);
extern uint64_t StyleMaxHeight(uint64_t id, int height);
extern uint64_t StyleInline(uint64_t id, int v);
extern uint64_t StyleTabWidth(uint64_t id, int width);
extern uint64_t NewStyle();
extern uint64_t CopyStyle(uint64_t id);
extern void FreeStyle(uint64_t id);
extern void FreeString(char* str);
extern char* GetStyleStats();
extern char* StyleRender(uint64_t id, char* str);
extern int StyleInherited(uint64_t id);
extern char* StyleString(uint64_t id);
extern uint64_t StyleInherit(uint64_t baseID, uint64_t inheritID);

// Cleanup helper
//
extern char* StyleCleanup();
extern uint64_t StyleSetString(uint64_t id, char* str);
extern char* StyleGetValue(uint64_t id);
extern uint64_t StyleBold(uint64_t id, int v);
extern uint64_t StyleItalic(uint64_t id, int v);
extern uint64_t StyleUnderline(uint64_t id, int v);
extern uint64_t StyleStrikethrough(uint64_t id, int v);
extern uint64_t StyleReverse(uint64_t id, int v);
extern uint64_t StyleBlink(uint64_t id, int v);
extern uint64_t StyleFaint(uint64_t id, int v);
extern char* GetTextStyleInfo(uint64_t id);
extern uint64_t StyleBorder(uint64_t id, CBorder border);
extern uint64_t StyleBorderStyle(uint64_t id, CBorder border);
extern uint64_t StyleBorderBackground(uint64_t id, char* color);
extern uint64_t StyleBorderForeground(uint64_t id, char* color);
extern CBorder StyleGetBorderStyle(uint64_t id);
extern void SetLogLevel(int level);
extern char* GetMemoryLeaks();

#ifdef __cplusplus
}
#endif
