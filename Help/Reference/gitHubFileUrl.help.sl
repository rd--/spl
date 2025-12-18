# gitHubFileUrl

- _gitHubFileUrl(u, p, f, b='main')_

Answer a file `Url` for the file _f_ at branch _b_ of the project _p_ of the user _u_.

```
>>> let u = 'rd--'.gitHubFileUrl(
>>> 	'spl',
>>> 	'main',
>>> 	'README.md'
>>> );
>>> (
>>> 	u.protocol,
>>> 	u.host,
>>> 	u.directory,
>>> 	u.fileName
>>> )
(
	'https:',
	'raw.githubusercontent.com',
	'/rd--/spl/refs/heads/main',
	'README.md'
)
```

* * *

See also: gitLabFileUrl, Url

Guides: Network Functions
