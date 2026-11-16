module Hash where

import qualified Data.Word {- base -}

import qualified Data.ByteString {- bytestring -}

import qualified Data.Dish.Murmur3 {- Dish -}
import qualified Data.Hash.Murmur {- murmur3 -}

fromString :: String -> Data.ByteString.ByteString
fromString = Data.ByteString.pack . map (fromIntegral . fromEnum)

{- | String input

>>> Data.ByteString.unpack stringInput
[83,116,114,105,110,103,32,73,110,112,117,116]
-}
stringInput :: Data.ByteString.ByteString
stringInput = fromString "String Input"

seed :: Num n => n
seed = 2166136261

{- | Dish murmur

>>> dishMurmur3 2166136261 stringInput
1240342483
-}
dishMurmur3 :: Data.Dish.Murmur3.Murmur3Hashable a => Int -> a -> Int
dishMurmur3 k x =
  case Data.Dish.Murmur3.murmur3 x k Data.Dish.Murmur3.X86_32 of
    [r, _, _, _] -> r
    _ -> error "dishMurmur3"

{- | Murmer3

>>> murmur3 2166136261 stringInput
1240342483
-}
murmur3 :: Data.Word.Word32 -> Data.ByteString.ByteString -> Data.Word.Word32
murmur3 k x = Data.Hash.Murmur.murmur3 k x

{-

'String Input'.murmur3Hash(2166136261) = [2006581733, 2651545595, 2673830536, 2103835251]

-}
