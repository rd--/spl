import Data.Char {- base -}

isOpening :: Char -> Bool
isOpening = flip elem "({["

isClosing :: Char -> Bool
isClosing = flip elem ")}]"

{- | Count opening and closing parentheses, brackets and braces.

>>> countOpeningAndClosing "("
(1,0)

>>> countOpeningAndClosing "]"
(0,1)

>>> countOpeningAndClosing "{}"
(1,1)
-}
countOpeningAndClosing :: String -> (Int, Int)
countOpeningAndClosing =
  let f (l,r) c =
        if isOpening c
        then (l + 1, r)
        else if isClosing c
             then (l, r + 1)
             else (l, r)
  in last . scanl f (0, 0)

{- | Count leading closing characters.

>>> countLeadingClosing "}"
1

>>> countLeadingClosing "})]"
3
-}
countLeadingClosing :: String -> Int
countLeadingClosing = length . takeWhile isClosing

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
inOrOutDent = signum . uncurry (-) . countOpeningAndClosing

leadingClosing :: String -> Int
leadingClosing = signum . countLeadingClosing

{- | Indent line by indicated amount and return indent for next line and indented line.

>>> indentLine 1 "f("
(2,"\tf(")

>>> indentLine 1 ""
(1,"")
-}
indentLine :: Int -> String -> (Int, String)
indentLine i s =
  let o = i + inOrOutDent s
  in (o, if null s then s else replicate (i - leadingClosing s) '\t' ++ s)

{- | Indent sequence of non-indented lines. -}
indentRegion :: Int -> [String] -> [String]
indentRegion k = map snd . tail . scanl (\(i, _) s -> indentLine i s) (k, "")

{- | Remove indentation from line. -}
clearIndent :: String -> String
clearIndent = dropWhile isSpace

{- | Indent text starting at left (indent 0).

>>> indentText "f(\nx,\ny\n)"
"f(\n\tx,\n\ty\n)\n"
-}
indentText :: String -> String
indentText = unlines . indentRegion 0 . map clearIndent . lines

main :: IO ()
main = interact indentText
