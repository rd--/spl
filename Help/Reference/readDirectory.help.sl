# readDirectory

- _readDirectory(system, path)_

Answer a `List` of the entries in the directory specified at _p_.

The entries are given as `Record` values.
Keys are _name_, _isFile_, _isDirectory_ and _isSymlink_.
The name is given relative to the specified directory.

Print only the names of sub-directories:

~~~
>>> system.readDirectory(
>>> 	system.splFileName('Help')
>>> ).select { :each |
>>> 	each['isDirectory']
>>> }.collect { :each |
>>> 	each['name']
>>> }.sort
[
	'Definitions'
	'Guide'
	'Image'
	'Index'
	'Reference'
	'Terse'
]
~~~

There is also an asychronous variant that answers a `Promise`,
that will either resolve to a `List` of the entries in the specified directory,
or reject with an `Error` value.

~~~spl async
system
.readDirectoryAsync('/etc')
.then { :answer |
	answer.select { :each |
		each['isDirectory']
	}.collect { :each |
		each['name']
	}
}
~~~

* * *

See also: Promise, readBinaryFile, readDirectoryFileNames, readTextFile

Guides: File Functions

Categories: Files
