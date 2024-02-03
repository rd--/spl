import Data.List.Split {- split -}

import qualified Music.Theory.String {- hmt-base -}

fixCategory :: String -> String
fixCategory s =
  let l = lines s
      [t, c] = splitOn " -- " (head l)
      e = ["", "Categories: " ++ Music.Theory.String.capitalise c]
  in unlines (concat [[t] ++ drop 1 l ++ e])

main :: IO ()
main = interact fixCategory
