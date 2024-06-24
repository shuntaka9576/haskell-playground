module Main (main) where

-- ╔════════════════════════════╗
-- ║         Chapter            ║
-- ╚════════════════════════════╝
ch2_3 :: IO ()
ch2_3 = do
  putStrLn "--- 2.3 ---"
  print (head [1, 2, 3, 4, 5 :: Int]) -- 1 *先頭だけ
  print (tail [1, 2, 3, 4, 5 :: Int]) -- [2,3,4,5] *まさかの先頭以外
  print ([1, 2, 3, 4, 5 :: Int] !! 2) -- 3 *添字アクセス
  print (take 3 [1, 2, 3, 4, 5 :: Int]) -- [1,2,3] *添字をベースではない
  print (drop 3 [1, 2, 3, 4, 5 :: Int]) -- [4,5] *添字をベースではない
  print (length [1, 2, 3, 4, 5 :: Int]) -- 5
  print (sum [1, 2, 3, 4, 5 :: Int]) -- 15 *和
  print (product [1, 2, 3, 4, 5 :: Int]) -- 120 *積
  print ([1, 2, 3 :: Int] ++ [4, 5 :: Int]) -- [1,2,3,4,5] *配列結合
  print (reverse [1, 2, 3, 4, 5 :: Int]) -- [5,4,3,2,1] *逆順
  putStrLn ""

double :: Int -> Int
double x = x + x

quardruple :: Int -> Int
quardruple x = double (double x)

-- 推論結果 factorial :: (Num a, Enum a) => a -> a
factorial :: (Num a, Enum a) => a -> a
-- Q: NumとEnum型両方がaに提供されいるが、これはUnion型みたいな理解で良いのか?
-- Q: hlintがfactorialとか型定義を書かないと警告になるが、なくても実行可能。推論に頼ってもいい気がする?
factorial n = product [1 .. n]

average :: [Int] -> Int
average ns = sum ns `div` length ns

-- divは除算という意味だが、2つ引数の間にバッククォートで書くのが一般的に
-- average ns = div (sum ns) (length ns) -- こういう書き方も可能だが、一般的ではない

ch2_5_1 :: IO ()
ch2_5_1 = do
  putStrLn "--- ch2_5_1 ---"
  putStrLn "double 3"
  print (double 3) -- 3 + 3 = 6
  putStrLn "quardruple 3"
  print (quardruple 3) -- 12
  putStrLn "take (double 2) [1, 2, 3, 4, 5 :: Int]"
  print (take (double 2) [1, 2, 3, 4, 5 :: Int]) -- 4つ目(添字3まで)までとる->[1,2,3,4]
  putStrLn "factorial 10"
  print (factorial 10 :: Int)
  print (average [1, 2, 3, 4, 5])
  putStrLn ""

-- ╔════════════════════════════╗
-- ║          Exercises         ║
-- ╚════════════════════════════╝
ch_2_7__2 :: IO ()
ch_2_7__2 = do
  -- 2^3*4 -> ((2^3)*4)
  -- 2*3+4*5 -> (2*3)+(4*5)
  -- 2+3*4^5 -> (2+(3*(4^5)))
  putStrLn "--- ch_2_7__2 ---"
  print (2 ^ (3 :: Int) * 4 :: Int) -- 32
  print (2 * 3 + 4 * 5 :: Int) -- 26
  print (2 * 3 * 4 ^ (5 :: Int) :: Int) -- 6144
  -- Q: 乗算のとき、IntergerをIntに変換しないと警告が出る

a :: Int
a = value `div` length xs
  where
    value = 10
    xs = [1, 2, 3, 4, 5 :: Int]

ch_2_7__3 :: IO ()
ch_2_7__3 = do
  putStrLn "--- ch_2_7__3 ---"
  print a -- 2

mylast :: [Int] -> Int
mylast xs = xs !! (length xs - 1)

-- 思いつかなかったやつ
mylast2 :: [Int] -> Int
-- Q: lintが賢いのかlastを使えと進めてくる
{-# ANN mylast2 ("HLint: ignore Use last" :: String) #-}
mylast2 xs = head (reverse xs)

ch_2_7__4 :: IO ()
ch_2_7__4 = do
  putStrLn "--- ch_2_7__4 ---"
  print (mylast [1, 2, 3, 4, 5] :: Int)
  print (mylast2 [1, 2, 3, 4, 5] :: Int)

myinit :: [Int] -> [Int]
myinit xs = take (length xs - 1) xs

myinit2 :: [Int] -> [Int]
-- Q: lintが賢いのかinitを使えと進めてくる
{-# ANN myinit2 ("HLint: ignore Use init" :: String) #-}
myinit2 xs = reverse (tail (reverse xs))

ch_2_7__5 :: IO ()
ch_2_7__5 = do
  putStrLn "--- ch_2_7__5 ---"
  print (myinit [1, 2, 3, 4, 5])
  print (myinit2 [1, 2, 3, 4, 5])

-- ╔════════════════════════════╗
-- ║          main              ║
-- ╚════════════════════════════╝
main :: IO ()
main = do
  ch2_3
  ch2_5_1
  ch_2_7__2
  ch_2_7__3
  ch_2_7__4
  ch_2_7__5
