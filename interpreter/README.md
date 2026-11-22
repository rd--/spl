# spl/interpreter

To change the interpretation of small integers:

1. interpreter/cli.ts:cacheRewriteFile
2. interpreter/load.ts:packageFileName
3. interpreter/rewrite-spl-to-core.ts:smallIntegerLiteral
4. Package/Number/Float.sl: @SmallInteger
