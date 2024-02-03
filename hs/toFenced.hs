import Data.List

type State = (String, Bool)

toFenced :: State -> String -> (State, String)
toFenced (previous, inBlock) current =
  if previous == "" && not inBlock && "\t" `isPrefixOf` current
  then ((current, True), "```\n" ++ tail current)
  else if inBlock && current == ""
       then ((current, False), "```\n")
       else ((current, inBlock), if inBlock then tail current else current)

main :: IO ()
main = interact (unlines . snd . mapAccumL toFenced ("", False) . lines)
