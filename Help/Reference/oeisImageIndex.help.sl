# oeisImageIndex

- _oeisImageIndex(system)_

Answer the Oeis image index in markdown format.

Write the `Integer Sequence Image Index` file:

~~~spl console
'Help/Guide/Integer Sequence Image Index.help.sl'
.splFilePath
.writeTextFile(
	system.oeisImageIndex.unlines
)
~~~

* * *

See also: helpImageIndex

Guides: Integer Sequence Image Index
