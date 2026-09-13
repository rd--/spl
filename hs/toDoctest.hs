import qualified Data.Char {- base -}
import qualified Data.List {- base -}

import qualified Data.List.Split {- base -}

import qualified Music.Theory.Markdown as Markdown {- hmt-base -}

rewriteTest :: String -> String
rewriteTest string =
  let trim =
        reverse
        . dropWhile Data.Char.isSpace
        . reverse
        . dropWhile Data.Char.isSpace
  in case Data.List.Split.splitOneOf "=~" string of
      [lhs, ' ' : rhs] -> unlines [">>> " ++ trim lhs, rhs]
      _ -> unlines [">>> " ++ string, "true"]

toDoctestAccum :: Markdown.BlockState -> String -> (Markdown.BlockState, String)
toDoctestAccum state current =
  let (_, inBlock) = state
      (state', indent) = Markdown.indentedCodeBlockBoundariesAccum state current
  in case indent of
      Markdown.Minus -> (state', "```\n")
      Markdown.Zero -> (state', if inBlock then rewriteTest (tail current) else current)
      Markdown.Plus -> (state', "```\n" ++ rewriteTest (tail current))

tidyPost :: [String] -> [String]
tidyPost l =
  case l of
    "" : "```" : "" : l' -> "```" : "" : tidyPost l'
    s : l' -> s : tidyPost l'
    [] -> []

{- | Indented to fenced code blocks

> s <- readFile "/home/rohan/sw/spl/Help/Reference/abs.help.sl"
> putStr $ unlines $ toDoctest (lines s)
-}
toDoctest :: [String] -> [String]
toDoctest =
  tidyPost
  . lines
  . unlines
  . snd
  . Data.List.mapAccumL toDoctestAccum ("", False)

main :: IO ()
main = interact (unlines . toDoctest . lines)
