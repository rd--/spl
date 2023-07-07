import Data.Char {- base -}

{- | Count opening and closing parentheses, brackets and braces.

>>> countOpenAndClose "("
(1, 0)

>>> countOpenAndClose "]"
(0, 1)

>>> countOpenAndClose "{}"
(1, 1)
-}
countOpenAndClose :: String -> (Int, Int)
countOpenAndClose =
  let f (l,r) c =
        if c `elem` "([{"
        then (l + 1, r)
        else if c `elem` ")]}"
             then (l, r + 1)
             else (l, r)
  in last . scanl f (0, 0)

{- | Count leading closing characters.

>>> countLeadingClosing "}"
1

>>> countLeadingClosing "})"
2
-}
countLeadingClosing :: String -> Int
countLeadingClosing = length . takeWhile (`elem` ")]}")

{- | Difference between opening and closing counts.
A positive value indicates an increase in indentation for the following line,
a negative value indicates a decrease, and zero indicates equal indentation.

>>> inOrOutDent "("
1

>>> inOrOutDent "]"
-1

>>> inOrOutDent "{}"
0
-}
inOrOutDent :: String -> Int
inOrOutDent = uncurry (-) . countOpenAndClose

{- | Indent line by indicated amount and return indent for next line and indented line.

>>> indentLine 1 "f("
(2, "\tf(")
-}
indentLine :: Int -> String -> (Int, String)
indentLine i s =
  let o = i + inOrOutDent s
  in (o, replicate (i - countLeadingClosing s) '\t' ++ s)

{- | Indent sequence of non-indented lines.

>>> unlines $ indentRegion 0 ["f(","x,","y",")"]
"f(\n\tx,\n\ty\n)\n"
-}
indentRegion :: Int -> [String] -> [String]
indentRegion k = map snd . tail . scanl (\(i, _) s -> indentLine i s) (k, "")

{- | Remove indentation from line. -}
clearIndent :: String -> String
clearIndent = dropWhile isSpace

{- | Indent text starting at left (indent 0). -}
indentText :: String -> String
indentText = unlines . indentRegion 0 . map clearIndent . lines

main :: IO ()
main = interact indentText
