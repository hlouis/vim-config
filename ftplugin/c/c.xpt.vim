"overwrite the XPTemplate default snippets.
XPTemplate priority=lang-1


XPT main hint=main\ (argc,\ argv)
int main(int argc, char **argv)`$BRfun^{
    `cursor^
    return 0;
}
..XPT

XPT fun wrap=curosr	hint=func..\ (\ ..\ )\ {...
XSET param|def=$CL no parameters $CR
XSET param|post=Echo( V() == $CL . " no parameters " . $CR ? '' : V() )
`int^ `name^(`param^)`$BRfun^{
    `cursor^
}

XPT once wrap	" #ifndef .. #define ..
XSET symbol=headerSymbol()
XSET symbol|post=UpperCase(V())
#ifndef `symbol^
#define `symbol^

`cursor^
#endif `$CL^ `symbol^ `$CR^

XPT filehead
XSET cursor|pre=CURSOR
/****************************************************************//**
 * @file	`file()^ `cursor^
 * @date	`strftime("%Y/%m/%d")^
 * @author	`$author^ | `$email^
 *
 * This software is supplied under the terms of a license
 * agreement or nondisclosure agreement with YQIdea and may
 * not be copied or disclosed except in accordance with the
 * terms of that agreement.
 *
 * `strftime("%Y")^ YQidea.com All Rights Reserved.
 *******************************************************************/

..XPT

XPT /*-
