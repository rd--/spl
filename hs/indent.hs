{- | A very simple indentation model for Spl programs.

The next line is shifted one place right if:

- there are more opening than closing tokens on the current line
- there is a trailing opening token

The current line is shifted left if:

- there is a leading closing token

-}
module Main where

import qualified Data.Char {- base -}
import Data.List {- base -}
import System.Environment {- base -}

import qualified Music.Theory.Io as Io {- hmt-base -}

{- |

>>> removeQuotedText "without 'q' and 'r'"
"without '' and ''"
-}
removeQuotedText :: String -> String
removeQuotedText s =
  let k = '\''
      f (q, r) c =
        let q' = if c == k then not q else q
        in if q
            then (q', if q' then k : r else r)
            else (q', c : r)
      (_, s') = last (scanl f (False, []) s)
  in reverse s'

-- | Is opening token.
isOpening :: Char -> Bool
isOpening = flip elem "({["

-- | Is closing token.
isClosing :: Char -> Bool
isClosing = flip elem ")}]"

firstIndexFor :: (a -> Bool) -> [a] -> Maybe Int
firstIndexFor f s =
  case findIndices f s of
    [] -> Nothing
    i : _ -> Just i

lastIndexFor :: (a -> Bool) -> [a] -> Maybe Int
lastIndexFor f s =
  case findIndices f s of
    [] -> Nothing
    i -> Just (last i)

{- | Count opening and closing parentheses, brackets and braces.

>>> countOpeningAndClosing "("
(1,0)

>>> countOpeningAndClosing "]"
(0,1)

>>> countOpeningAndClosing "{}"
(1,1)

>>> countOpeningAndClosing "} {"
(1,1)

>>> countOpeningAndClosing (removeQuotedText "'} {'")
(0,0)
-}
countOpeningAndClosing :: String -> (Int, Int)
countOpeningAndClosing =
  let f (l, r) c =
        if isOpening c
          then (l + 1, r)
          else
            if isClosing c
              then (l, r + 1)
              else (l, r)
  in last . scanl f (0, 0)

{- | Count leading closing characters.

> countLeadingClosing "}"
1

> countLeadingClosing "})]"
3
countLeadingClosing :: String -> Int
countLeadingClosing = length . takeWhile isClosing
-}

{- | Count trailing opening characters.

> countTrailingOpening "f(x) {"
1

> countTrailingOpening "f(["
2
countTrailingOpening :: String -> Int
countTrailingOpening = length . takeWhile isOpening . reverse
-}

{- | Difference between opening and closing counts.
A positive value indicates an increase in indentation for the _following_ line,
a negative value indicates a decrease, and zero indicates equal indentation.

>>> inOrOutDent "("
1

>>> inOrOutDent "]"
-1

>>> inOrOutDent "{}"
0

>>> inOrOutDent "} {"
0

>>> inOrOutDent "(["
1

>>> inOrOutDent "]) {"
-1
-}
inOrOutDent :: String -> Int
inOrOutDent = signum . uncurry (-) . countOpeningAndClosing

{- | Has leading closing

>>> hasLeadingClosing "x [] {"
False

>>> hasLeadingClosing ">>> ]} {"
True
-}
hasLeadingClosing :: String -> Bool
hasLeadingClosing s =
  case (firstIndexFor isOpening s, firstIndexFor isClosing s) of
    (Nothing, Just _) -> True
    (Just o, Just c) -> c < o
    _ -> False

{- | Has trailing opening

>>> hasTrailingOpening "x [] {"
True
-}
hasTrailingOpening :: String -> Bool
hasTrailingOpening s =
  case (lastIndexFor isOpening s, lastIndexFor isClosing s) of
    (Just _, Nothing) -> True
    (Just o, Just c) -> o > c
    _ -> False

firstNonWhiteSpaceChar :: String -> Maybe Char
firstNonWhiteSpaceChar = find (not . Data.Char.isSpace)

{- | Has leading dot

>>> hasLeadingDot "\t.x(y)"
True

>>> hasLeadingDot "\tf.x(y)"
False
hasLeadingDot :: String -> Bool
hasLeadingDot s =
  case firstNonWhiteSpaceChar s of
    Just '.' -> True
    _ -> False
-}

indentNext :: String -> Bool
indentNext s = inOrOutDent s > 0 || hasTrailingOpening s

{- | (Indent, LeadingDot?)
type StateWithDot = (Int, Bool)
-}

-- | Indent
type State = Int

splitNonIndentingPrefix :: String -> (String, String)
splitNonIndentingPrefix s =
  if ">> " `isPrefixOf` s
  then (">> ", drop 3 s)
  else if ">>> " `isPrefixOf` s
       then (">>> ", drop 4 s)
       else ("", s)

{- | Indent line by indicated amount and return:

- indent for next line
- indented line

>>> indentLine 1 ">>> f("
(2,">>> \tf(")

>>> indentLine 1 ""
(1,"")
-}
indentLine :: State -> String -> (State, String)
indentLine i s =
  let t = removeQuotedText s
      next = if indentNext t then 1 else 0
      current = if hasLeadingClosing t then -1 else 0
      (p, s') = splitNonIndentingPrefix s
      s'' = if null s' then s' else replicate (i + current) '\t' ++ s'
  in (i + next + current, p ++ s'')

-- | Indent sequence of non-indented lines.
indentRegion :: State -> [String] -> [String]
indentRegion z0 = snd . mapAccumL (\z s -> indentLine z s) z0

-- | Remove indentation from line.
clearIndent :: String -> String
clearIndent s =
  let (p, s') = splitNonIndentingPrefix s
      s'' = dropWhile Data.Char.isSpace s'
  in p ++ s''

{- | Indent text starting at left (indent 0).

>>> indentText "f(\nx,\ny\n)"
"f(\n\tx,\n\ty\n)\n"
-}
indentText :: String -> String
indentText = unlines . indentRegion 0 . map clearIndent . lines

indentFileInPlace :: FilePath -> IO ()
indentFileInPlace fn = do
  i <- Io.read_file_utf8 fn
  Io.write_file_utf8 fn (indentText i)

main :: IO ()
main = do
  a <- getArgs
  case a of
    [] -> interact indentText
    fn -> mapM_ indentFileInPlace fn
