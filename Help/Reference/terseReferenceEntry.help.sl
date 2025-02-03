# terseReferenceEntry

- _terseReferenceEntry(aHelpFile, aDictionary)_

Evaluate document tests at _aHelpFile_, reading options from _aDictionary_.

~~~
>>> let topic = 'Markdown';
>>> let helpFile = topic.helpFileName;
>>> let fileName = system.splFile(helpFile);
>>> let text = fileName.readTextFile;
>>> HelpFile(
>>> 	fileName.asFileUrl,
>>> 	text
>>> ).terseReferenceEntry(verbose: false)
[4, 4, 0]
~~~

* * *

See also: HelpFile, terseGuideSummary, terseReferenceSummary

Guides: Documentation Tests

Categories: Help
