# HelpProgram

A `Type` holding a program from the Sᴘʟ help files.

Print the `Integer Sequence Image Index`:

~~~spl console
let oeisPrograms = system.helpProgramsSelect(isOeisProgram:/1);
let oeisIdentifiers = oeisPrograms.collect(oeisIdentifier:/1).unique;
oeisIdentifiers.collect { :i |
	[
		'- [%](https://oeis.org/%/)'.format([i, i]),
		oeisPrograms.select { :p |
			p.oeisIdentifier = i
		}.withIndexCollect { :p :j |
			'  %. %'.format([j, p.markdownImageReference])
		}.unlines
	].unlines
}.unlines.postLine
~~~

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
