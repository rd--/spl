# writeTextFile -- file system

- _writeTextFile(aString | aUrl, aString)_

Answer a Promise that will either resolve to a String holding the contents of the named file,
or reject with an Error value.

	'/tmp/file.text'.writeTextFile('text').then { :unused | 'Write completed'.postLine }

* * *

See also: Promise, readTextFile
