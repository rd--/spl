# Cache

`Cache` is both a `Trait` and a `Type`.

```
>>> system
>>> .traitDictionary['Cache']
>>> .isTrait
true

>>> system
>>> .typeDictionary['Cache']
>>> .isType
true
```

Types implementing `Cache`:

```
>>> system
>>> .traitTypes('@Cache')
>>> .sort
[
	'BezierCurve'
	'HelpFile'
	'Markdown'
	'RatioTuning'
	'System'
]
```

The required method of the `Cache` trait is `cache`, which should answer a `Dictionary`.

The trait implements the methods `cached`,
for where the initializer is synchronous,
and `whenCached`,
for where it is not.

The `System` type,
which is instantiated once as `system`,
implements `Cache`,
and is used to implement initialise-on-demand global variables.

The `primesList` method caches previous requests,
and continues any required calculations from the cached answers.

```
>>> 23.primesList
system
.cache['primesList']
.first(23)
```

`Cache` is also the `Type` of the persistent store for `fetch` results,
where the keys are `Request` or `Url` objects,
and values are `Response` objects.

~~~spl async
system
.caches
.atIfPresent(
	'SplLibrary',
	isCache:/1
)
~~~

This cache is not an ordinary dictionary type,
however it does implement:

- `atIfAbsent`
- `atIfPresentIfAbsent`
- `atIfPresent`
- `atPut`
- `removeKeyIfAbsent`

Remove items from the 'SplLibrary' cache:

~~~spl async
let keys = ['ColourGradients', 'ColourPalettes'];
system
.caches
.atIfPresent('SplLibraryItems') { :cache |
	keys.collect { :key |
		cache
		.removeKeyIfAbsent(
			system
			.library[key]
			.url
			.asUrl
		) {
			'Not present'
		}
	}
}
~~~

* * *

See also: cached, caches, CacheStorage, LibraryItem, System, whenCached

References:
_W3c_
[1](https://w3c.github.io/ServiceWorker/#cache-interface)

Categories: System, Trait
