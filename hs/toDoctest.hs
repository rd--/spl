import Data.Char {- base -}
import Data.List {- base -}
import Data.List.Split {- base -}

import Music.Theory.Markdown {- hmt-base -}

rewriteTest :: String -> String
rewriteTest string =
  let trim = reverse . dropWhile isSpace . reverse . dropWhile isSpace
  in case splitOneOf "=~" string of
       [lhs, ' ' : rhs] -> unlines [">>> " ++ trim lhs, rhs]
       _ -> unlines [">>> " ++ string, "true"]

toDoctestAccum :: BlockState -> String -> (BlockState, String)
toDoctestAccum state current =
  let (_, inBlock) = state
      (state', indent) = indentedCodeBlockBoundariesAccum state current
  in case indent of
      Minus -> (state', "```\n")
      Zero -> (state', if inBlock then rewriteTest (tail current) else current)
      Plus -> (state', "```\n" ++ rewriteTest (tail current))

tidyPost :: [String] -> [String]
tidyPost l =
  case l of
    "" : "```" : "" : l' -> "```" : "" : tidyPost l'
    s : l' -> s : tidyPost l'
    [] -> []

{- | Indented to fenced code blocks

> s <- readFile "/home/rohan/sw/spl/help/Reference/abs.help.sl"
> putStr $ unlines $ toDoctest (lines s)
-}
toDoctest :: [String] -> [String]
toDoctest = tidyPost . lines . unlines . snd . mapAccumL toDoctestAccum ("", False)

main :: IO ()
main = interact (unlines . toDoctest . lines)
