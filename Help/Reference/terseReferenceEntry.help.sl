# terseReferenceEntry

- _terseReferenceEntry(aHelpFile, aDictionary)_

Evaluate document tests at _aHelpFile_, reading options from _aDictionary_.

~~~
let fileName = [
	'/home/rohan/'
	'sw/spl/'
	'Help/Reference/Markdown.help.sl'
].join('');
let text = fileName.readTextFile;
let helpFile = HelpFile(fileName.asFileUrl, text);
helpFile.terseReferenceEntry(verbose: true)
~~~

* * *

See also: HelpFile, terseGuideSummary, terseReferenceSummary

Guides: Documentation Tests

Categories: Help
