import qualified Music.Theory.Markdown {- hmt-base -}

main :: IO ()
main = interact (unlines . Music.Theory.Markdown.indentedToFencedCodeBlocks . lines)
