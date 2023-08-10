import qualified Data.Hash.Murmur
import qualified Data.ByteString
import qualified Data.Dish.Murmur3

fromString :: String -> Data.ByteString.ByteString
fromString = Data.ByteString.pack . map (fromIntegral . fromEnum)

stringInput :: Data.ByteString.ByteString
stringInput = fromString "String Input"

{-

Data.ByteString.unpack stringInput == [83,116,114,105,110,103,32,73,110,112,117,116]

Data.Dish.Murmur3.murmur3 stringInput 2166136261 Data.Dish.Murmur3.X86_32 == [1240342483,32736,0,0]
Data.Dish.Murmur3.murmur3 stringInput 2166136261 Data.Dish.Murmur3.X86_128
Data.Dish.Murmur3.murmur3 stringInput 2166136261 Data.Dish.Murmur3.X64_128

Data.Hash.Murmur.murmur3 2166136261 stringInput == 1240342483

'String Input'.murmur3Hash(2166136261) = [2006581733, 2651545595, 2673830536, 2103835251]

-}
