even2 :: (Integral a) => a -> Bool
even2 n = n `mod` 2 == 0

splitAt2 :: Int -> [a] -> ([a], [a])
splitAt2 n xs = (take n xs, drop n xs)

recip2 :: (Fractional a) => a -> a
recip2 n = 1 / n

ch1_re :: IO ()
ch1_re = do
  print (even2 4)
  print (splitAt2 1 [3, 2, 4])

test :: IO ()
test = do
  print ("hell")

main :: IO ()
main = do
  ch1_re
  test
