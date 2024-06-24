-- ╔════════════════════════════╗
-- ║         Chapter            ║
-- ╚════════════════════════════╝
-- 4.1.のプレリュード関数を自分で定義
even2 :: (Integral a) => a -> Bool
even2 n = n `mod` 2 == 0

splitAt2 :: Int -> [a] -> ([a], [a])
splitAt2 n xs = (take n xs, drop n xs)

recip2 :: (Fractional a) => a -> a
recip2 n = 1 / n

ch4_1 :: IO ()
ch4_1 = do
  print (even2 (2 :: Int))
  print (splitAt2 3 [1, 2, 3, 4 :: Int])
  print (recip2 3 :: Double)
  print (recip2 0.3 :: Double)

abs2 :: Int -> Int
abs2 n = if n >= 0 then n else -n

signum2 :: Int -> Int
signum2 n =
  if n < 0
    then -1
    else if n == 0 then 0 else 1

ch4_2 :: IO ()
ch4_2 = do
  putStrLn "---ch4_2---"
  print (abs2 3 :: Int)
  print (signum2 4)

abs3 :: Int -> Int
abs3 n
  | n > 0 = n
  | otherwise = -n

signum3 :: Int -> Int
signum3 n
  | n < 0 = -1
  | n == 0 = 0
  | otherwise = 1

ch4_3 :: IO ()
ch4_3 = do
  putStrLn "---ch4_3---"
  print (abs3 3)
  print (signum3 3)

not2 :: Bool -> Bool
not2 False = True
not2 True = False

-- &&というプレリュード関数があるらしいが、andandで定義できるか試す
andand :: Bool -> Bool -> Bool
True `andand` True = True
True `andand` False = False
False `andand` True = False
False `andand` False = False

andand2 :: Bool -> Bool -> Bool
True `andand2` True = True
_ `andand2` _ = False

andand3 :: Bool -> String -> String
True `andand3` b = b
False `andand3` _ = "match2"

-- コンパイルエラー(1つの等式で2つ以上引数が同じ名前を持つことが許されない)
-- Conflicting definitions for ‘b’
-- andand4 :: Bool -> Bool -> Bool
-- b `andand4` b = b
-- _ `andand4` _ = False

andand4 :: Bool -> Bool -> Bool
b `andand4` c
  | b == c = b -- ガード式で1つめ2つめの引数が同じ場合、1つ目を返すようにしている
  | otherwise = False

ch4_4 :: IO ()
ch4_4 = do
  putStrLn "---ch4_4---"
  print (not2 True)
  print (andand False False)
  print (andand2 False False)
  print (andand3 True "match1")
  print (andand3 False "match1")
  print (andand4 False False)

--- 4.4.1に関係ないけど...
-- test1 :: Int -> Int
-- test1 a = a
-- 型引数あり
test1 :: (Integral x) => x -> x
test1 a = a

ch4_4_1 :: IO ()
ch4_4_1 = do
  print (test1 3 :: Int)

test :: [Char] -> Bool
test ['a', _, _] = True
test _ = False

test3 :: IO ()
test3 = do
  -- :は既存のリストの先頭に新しい要素を追加して、新しいリストを生成する演算子
  -- 作成する(construct)という意味で、cons(コンス)演算子と呼ばれる
  print (1 : (2 : (3 : [])))

test4 :: [Char] -> Bool
test4 ('a' : _) = True
test4 _ = False

-- コンス演算子はパターンマッチングの文脈では、リストを「先頭の要素」と「残りのリスト」に分解するために利用される
head2 :: [a] -> a
head2 (x : _) = x

tail2 :: [a] -> [a]
tail2 (_ : xs) = xs

ch4_4_2 :: IO ()
ch4_4_2 = do
  putStrLn "--- ch4_4_2 ---"
  putStrLn "--- test ---"
  print (test ['a', 'b', 'c'])
  print (test ['b', 'c'])
  putStrLn "--- test3 ---"
  test3
  putStrLn "--- test4 ---"
  print (test4 ['a', 'b', 'c'])
  print (test4 ['b', 'c'])
  putStrLn "--- head2 ---"
  print (head2 ['a', 'b', 'c']) -- a
  putStrLn "--- tail2 ---"
  print (tail2 ['a', 'b', 'c']) -- bc

ch4_5 :: IO ()
ch4_5 = do
  putStrLn "--- ch4_5 ---"

main :: IO ()
main = do
  ch4_1
  ch4_2
  ch4_3
  ch4_4
  ch4_4_1
  ch4_4_2
  ch4_5
