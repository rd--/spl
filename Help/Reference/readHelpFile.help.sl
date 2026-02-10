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
>>> system.readHelpFile('binomial')
>>> .oeisReferences
[
	'A000125'
	'A000127'
	'A000262'
	'A000332'
	'A000984'
	'A001405'
	'A002260'
	'A004736'
	'A006004'
	'A006542'
	'A007318'
	'A027907'
	'A052509'
	'A053121'
	'A053202'
	'A059678'
	'A059797'
	'A060693'
	'A105278'
	'A108838'
	'A109449'
	'A166556'
	'A182309'
]
```

* * *

See also: HelpFile

Guides: Help Functions
