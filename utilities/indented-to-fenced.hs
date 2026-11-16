import qualified Music.Theory.Markdown as Markdown {- hmt-base -}

main :: IO ()
main = interact (unlines . Markdown.indentedToFencedCodeBlocks . lines)
