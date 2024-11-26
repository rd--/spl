# terseReferenceEntry

- _terseReferenceEntry(aHelpFile, aDictionary)_

Evaluate document tests at _aHelpFile_, reading options from _aDictionary_.

~~~
let fileName = '/home/rohan/sw/spl/Help/Reference/UgenGraph.help.sl';
let text = fileName.readTextFile;
let helpFile = HelpFile(fileName.asFileUrl, text);
helpFile.terseReferenceEntry(verbose: true)
~~~

* * *

See also: HelpFile, terseReferenceSummary

Guides: Documentation Tests

Categories: Help
