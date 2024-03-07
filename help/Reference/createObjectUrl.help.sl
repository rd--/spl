# createObjectUrl

- _createObjectUrl(aFile | aBlob)_

Answer an Url that represents the data at _aFile_ or _aBlob_.

~~~
let url = 'https://rohandrape.net/sw/stsc3/lib/png/smalltalk-balloon.png';
url.fetchBlob.then { :answer |
	answer.createObjectUrl.postLine
}
~~~

* * *

See also: revokeObjectUrl

References:
_W3c_
[1](https://w3c.github.io/FileAPI/#dfn-createObjectURL)
