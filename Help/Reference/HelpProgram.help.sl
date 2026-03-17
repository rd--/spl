# HelpProgram

A `Type` holding a program from the SPL help files.

Print the `Integer Sequence Image Index`:

~~~spl console
let oeisPrograms = system.helpProgramsSelect(isOeisProgram:/1);
oeisPrograms.sortOn(oeisIdentifier:/1);
oeisPrograms.collect(markdownText:/1).unparagraphs.postLine
~~~

* * *

See also: HelpFile
