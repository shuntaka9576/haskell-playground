module Main (main) where

-- ╔════════════════════════════╗
-- ║         Chapter            ║
-- ╚════════════════════════════╝
ch3_1 :: IO ()
ch3_1 = do
  print (not False)
  print (True)

add :: (Int, Int) -> Int
add (x, y) = x + y

-- カリー化された関数は、部分適用が可能な分柔軟性が高い
add' :: Int -> Int -> Int
-- add' :: Int -> (Int -> Int)
add' x y = x + y

multi :: Int -> Int -> Int -> Int
multi x y z = x * y * z

multi2 :: (Int, Int, Int) -> Int
multi2 (x, y, z) = x * y * z

ch3_6 :: IO ()
ch3_6 = do
  print (add (3, 4))
  print (add' 3 4) -- (3 + y)(4) という形でカリー化されている
  print (multi 3 3 4)
  print (multi2 (3, 3, 4))

ch3_7 :: IO ()
ch3_7 = do
  print (length [1, 3, 5, 7 :: Int])

ch3_8 :: IO ()
ch3_8 = do
  print "aa"

-- ╔════════════════════════════╗
-- ║          Exercises         ║
-- ╚════════════════════════════╝

a :: [Char]
a = ['a', 'b', 'c']

b :: (Char, Char, Char)
b = ('a', 'b', 'c')

c :: [(Bool, Char)]
c = [(False, '0'), (True, '1')]

-- Q: わからん
-- d :: a -> [(a, Char)]
-- d = [(False, '0'), ('0', '1')]

-- Q: わからん
-- e :: a -> [(a, Char)]
-- e = ([False, True], ['0', '1'])

f :: [[a] -> [a]]
f = [tail, init, reverse]

ch3_11__1 :: IO ()
ch3_11__1 = do
  print a
  print b
  print c

-- print d
-- print e

bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1], [2, 3]]

add2 :: Int -> Int -> Int -> Int
add2 x y z = x * y * z

add3 :: (Int, Int) -> Int
add3 (x, y) = x * y

copy :: a -> (a, a)
copy x = (x, x)

ch3_11__2 :: IO ()
ch3_11__2 = do
  print bools
  print nums
  print (add2 1 2 3)
  print (add3 (1, 2))
  print (copy 1)

-- ╔════════════════════════════╗
-- ║          main              ║
-- ╚════════════════════════════╝
main :: IO ()
main = do
  ch3_1
  ch3_6
  ch3_7
  ch3_8
  ch3_11__1
  ch3_11__2
