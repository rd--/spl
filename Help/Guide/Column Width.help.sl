# Column Width

Text formatting for documents that are to be viewed in different contexts is a vexed issue.
This is particularly the case in relation to program fragments,
where line-breaks and indentation are important in indicating the program structure.

Variables that need to be considered include:
font type and size,
page or column width and height,
and interlinear spacing.

For program fragments,
the most important aspect of the font type is whether it is monospace (fixed-width),
or proportional (variable-width).

The programs below count the number of characters in four strings,
which are of equal length.
The strings are sorted by the amount of space they will likely occupy in a proportional font.
If the font is monospaced,
not only will each string will occupy the same horizontal space,
but the space required will ordinarily be greater.

```
>>> '--------------------------------'
>>> .size
32

>>> '         ^         ^         ^  '
>>> .size
32

>>> 'abcdefghijklmnopqrstuvwxabcdefgh'
>>> .size
32

>>> '12345678901234567890123456789012'
>>> .size
32
```

The font type also effects decisions about how to use letter cases.
In fixed-width fonts the distinction between lower and upper case letters is often less marked than in variable-wdith fonts.

The convention in some systems of writing constants in all upper-case,
i.e. `LINE_LENGTH` in C or `*LINE-LENGTH*` in Lisp,
can make these words particularly prominent if a variable-width font is selected.

The programs below count the number of characters in three strings,
which are of equal length.
The strings are sorted by the amount of space they will likely occupy in a proportional font.
While the strings have ten fewer characters than those in the examples above,
the shorter string of upper case letters will likely take more or less the same amount of space as the longer string of lower case letters.

```
>>> 'abcdefghijklmnopqrstuv'
>>> .size
22

>>> '1234567890123456789012'
>>> .size
22

>>> 'ABCDEFGHIJKLMNOPQRSTUV'
>>> .size
22
```

The Sᴘʟ help files are designed so that they can be viewed in a column width that allows program fragments to have line lengths of approximately fourty characters,
when viewed using a proportional font.
The programs above illustrate roughly the maximum width of program texts that can be shown in such a column when prefixed with a leading indicator of approximately one tab place.

An additional consideration is the use of tab characters for indentation.
Tab width is often set to eight characters,
however in the context of a narrow window view or two column layout a tab width of four may be preferable.
The programs below show a sequence of left brackets separated by three spaces,
then three zeroes,
then one tab:

```
>>> '[   [   [   [   [   [   [   [   [   [   [   [   '
>>> .size
48

>>> '[000[000[000[000[000[000[000[000[000'
>>> .size
36

>>> '[	[	[	[	[	[	[	['
>>> .size
15
```

The tab-indented nested list below indicates the most deeply nested list or program that can readily be printed in the column width described above where the tab size is approximately the space of four characters:

```
>>> [
>>> 	[
>>> 		[
>>> 			[
>>> 				[
>>> 					[
>>> 						[
>>> 							[0]
>>> 						]
>>> 					]
>>> 				]
>>> 			]
>>> 		]
>>> 	]
>>> ].shape
8 # [1]
```

_Rationale_:
This column width (of approximately fourty characters) can be printed in two columns on A4 paper,
and can be displayed correctly on even narrow mobile devices.
It also means that a help viewer will need only a small amount of space in the context of a program editor.

<!--
Telephone dimensions:
344×882
360×740
375×667
390×844
412×915
412×915
430×932

Tablet dimensions:
768×1024
820×1180
912×1368
1024×1366
-->

* * *

References:
_W_
[1](https://en.wikipedia.org/wiki/Monospaced_font)
[2](https://en.wikipedia.org/wiki/Line_length)

Further Reading: Dyson 2004
