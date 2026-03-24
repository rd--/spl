# HelpProgram

A `Type` holding a program from the Sᴘʟ help files.

Print Oeis programs:

~~~spl console
let oeisPrograms = system.helpProgramsSelect(isOeisProgram:/1);
oeisPrograms.sortOn(oeisIdentifier:/1);
oeisPrograms.collect { :p |
	p.markdownText (
		programText: false,
		imageProgramText: true
	)
}.unparagraphs.postLine
~~~

* * *

See also: HelpFile
