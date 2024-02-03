# readTextFile -- file system

- _readTextFile(aString | aUrl)_

Answer a Promise that will either resolve to a String holding the contents of the named file,
or reject with an Error value.

```
'/etc/passwd'.readTextFile.then { :answer |
	answer.postLine
}.catch { :reason |
	reason.postLine
}
```

* * *

See also: Promise, readFile, writeTextFile
