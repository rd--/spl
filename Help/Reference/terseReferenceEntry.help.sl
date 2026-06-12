# terseReferenceEntry

- _terseReferenceEntry(g, d)_

Evaluate document tests at the help file _h_, reading options from the dictionary _d_.

~~~
>>> let topic = 'Markdown';
>>> let helpFile = topic.helpFileName;
>>> let fileName = system.splFileName(helpFile);
>>> let text = system.readTextFile(fileName);
>>> HelpFile(
>>> 	fileName.asFileUrl,
>>> 	text
>>> ).terseReferenceEntry(
>>> 	(verbose: false)
>>> )
[4, 4, 0]
~~~

* * *

See also: HelpFile, terseGuideSummary, terseReferenceSummary

Guides: Documentation Tests

Categories: Help
