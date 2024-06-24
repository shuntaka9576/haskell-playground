module Main (main) where

-- ╔════════════════════════════╗
-- ║         Chapter            ║
-- ╚════════════════════════════╝
double :: Int -> Int
double x = x + x

qsort :: (Ord a) => [a] -> [a]
qsort [] = []
qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]

ch1_1 :: IO ()
ch1_1 = do
  putStrLn "--- 1.1. ---"
  let result = double (double 2)
  print result
  let result2 = double 2 + double 2
  print result2

ch1_2 :: IO ()
ch1_2 = do
  putStrLn "--- 1.2. ---"
  let result3 = sum [1, 2, 3 :: Int]
  print result3

-- 関数mysumは任意の数値(Num)型aに対し、型aのリストを型aの数値(Num)に変化する関数である
mysum :: (Num a) => [a] -> a
{-# ANN mysum "HLint: ignore Use foldr" #-}
mysum [] = 0
-- 空でないリストに対して最初の要素をn、残りのリストをnsと表す
mysum (n : ns) = n + mysum ns

ch1_5_1 :: IO ()
ch1_5_1 = do
  putStrLn "--- 1.5.1 ---"
  let result = mysum [1, 2, 3 :: Int]
  print result

ch1_5_2 :: IO ()
ch1_5_2 = do
  putStrLn "--- 1.5.2 ---"
  -- ++は配列同士の演算
  let a = [1, 2 :: Int] ++ [2, 3 :: Int]
  print a
  let result = qsort [3, 5, 1, 4, 2 :: Int]
  print result

-- ╔════════════════════════════╗
-- ║          Exercises         ║
-- ╚════════════════════════════╝
double2 :: Int -> Int
double2 x = x * 2

ch1_7__1 :: IO ()
ch1_7__1 = do
  putStrLn "--- 1.7__1 ---"
  let a = double2 (double2 2)
  print a

ch1_7__2 :: IO ()
ch1_7__2 = do
  putStrLn "--- 1.7__2 ---"
  let a = sum [1, 2, 3 :: Int]
  print a

produc :: (Num a) => [a] -> a
{-# ANN produc "HLint: ignore Use foldr" #-}
produc [] = 1 -- 空リストのとき0を返すと乗算結果が0になってしまう..
produc (x : xs) = x * produc xs

ch1_7__3 :: IO ()
ch1_7__3 = do
  putStrLn "--- 1.7__3 ---"
  let a = produc [2, 2, 3 :: Int]
  print a

qsort2 :: (Ord a) => [a] -> [a]
qsort2 [] = []
qsort2 (x : xs) = qsort2 larger ++ [x] ++ qsort2 smaller
  where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]

ch1_7__4 :: IO ()
ch1_7__4 = do
  putStrLn "--- 1.7__4 ---"
  let a = qsort2 [1, 2, 3, 4 :: Int]
  print a

qsort3 :: (Ord a) => [a] -> [a]
qsort3 [] = []
qsort3 (x : xs) = qsort3 larger ++ [x] ++ qsort3 smaller
  where
    smaller = [a | a <- xs, a < x]
    larger = [b | b <- xs, b > x]

ch1_7__5 :: IO ()
ch1_7__5 = do
  putStrLn "--- 1.7__5 ---"
  let a = qsort3 [2, 2, 3, 1, 1 :: Int]
  print a

{-
[1, 1] [2] [3]
[1] [2] [3]
2がsmallerにもlargerに所属しないため、配列の中から2が消える
-}

-- ╔════════════════════════════╗
-- ║          main              ║
-- ╚════════════════════════════╝
main :: IO ()
main = do
  ch1_1
  ch1_2
  ch1_5_1
  ch1_5_2
  ch1_7__1
  ch1_7__2
  ch1_7__3
  ch1_7__4
  ch1_7__5
