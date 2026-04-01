# helpImageIndex

- _helpImageIndex(system)_

Answer the help image index in markdown format.

Write the `Help Image Index` file:

~~~spl console
'Help/Guide/Help Image Index.help.sl'
.splFilePath
.writeTextFile(
	system.helpImageIndex.unlines
)
~~~

* * *

See also: helpProgramDictionary, helpProgramTable

Guides: Help Image Index
