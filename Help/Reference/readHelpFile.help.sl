# readHelpFile

- _readHelpFile(system, topic)_

Answer the `HelpFile` for _topic_.

Read the `add` help file:

```
>>> let h = system.readHelpFile('add');
>>> let t = h.documentationTests;
>>> (
>>> 	h.name,
>>> 	h.origin.isUrl,
>>> 	h.isReferenceFile,
>>> 	h.isGuideFile,
>>> 	h.signatures,
>>> 	h.synopsis.isString,
>>> 	h.description.elementType,
>>> 	h.markdown.isMarkdown,
>>> 	t.elementType,
>>> 	h.codeBlocks.elementType,
>>> 	h.rationale.isList,
>>> 	h.seeAlso.elementType,
>>> 	h.references.elementType,
>>> 	h.unicode.isList,
>>> 	h.categories.elementType
>>> )
(
	'add',
	true,
	true,
	false,
	['- _add(c, x)_'],
	true,
	'String',
	true,
	'DocumentationTest',
	'Record',
	true,
	'String',
	'String',
	true,
	'String'
)
```

Read the _OEIS_ references at the `binomial` help file:

```
>>> system.readHelpFile('ramanujansSum')
>>> .oeisReferences
['A054532' 'A054533' 'A054534' 'A054535']
```

* * *

See also: HelpFile

Guides: Help Functions
