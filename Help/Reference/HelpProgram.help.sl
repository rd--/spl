# HelpProgram

A `Type` holding a program from the Sᴘʟ help files.

Print help image programs document:

~~~spl console
system.helpImageProgramsText (
	programText: true,
	imageProgramText: false
).unparagraphs.postLine
~~~

Print help image programs document,
with the programs given in condensed form as image titles:

~~~spl console
system.helpImageProgramsText (
	programText: false,
	imageProgramText: true
).unparagraphs.postLine
~~~

Print integer sequence image programs document:

~~~spl console
system.oeisImageProgramsText (
	programText: true,
	imageProgramText: false
).unparagraphs.postLine
~~~

Print integer sequence image programs document,
with the programs given in condensed form as image titles:

~~~spl console
system.oeisImageProgramsText (
	programText: false,
	imageProgramText: true
).unparagraphs.postLine
~~~

* * *

See also: HelpFile
