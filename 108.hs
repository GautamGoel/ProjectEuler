import Data.List
import Data.Maybe
import Control.Monad.State


f n = [(x, y) | x <- [n .. n*n + n], y <- [n .. 2*n], x >= y, n*(x + y) == x*y]

smarterF :: Int -> [(Int, Int)]
smarterF n = [(x, y) | y <- [n + 1 .. 2*n], let x' = (fromIntegral (n*y)) / (fromIntegral (y - n)) :: Float, let x = round x' :: Int, x' == fromIntegral x]
	

	      

g n = length $ smarterF n

answer =  1 + (fromMaybe 0 $ findIndex (> 1000) $ map g [1 .. ])

data Status = Status { _i :: Int, _result :: Double }

class Default a where def :: a

instance Default Int    where def = 0
instance Default Double where def = 0.0
instance Default Status where def = Status def def

sum' :: [Double] -> Double
sum' xs = flip evalState def $ do
    -- i.e. foreach (double x in xs) { ... }
    forM xs $ \x ->
        modify (\a -> a + x)
    get



{-

-- key insight is that the number of solutions (x, y) is the number of divisors of n;
-- for each divisor d of n, let y = n + d and let x = ny/(y - n) = ny/d.
import Data.List
import Data.Maybe

factors :: [[Int]] -- nth item is factorization of n; factors !! 12 should return [2 2 3]. Note that factors does not begin with 1
factors = [1] : [2] : next factors 3
	where next xs i = let possibles = filter (\x -> i `mod` x == 0) [2 .. (floor $ sqrt $ realToFrac i)] -- tail to ignore 1
	      		      factorization = if null possibles then [i]
			      	   	      else let p = (head possibles) 
				       	           in p : (factors !! (div (i - 1) p)) --  -1 because of zero-indexing
			  in factorization : (next factors (i + 1))
	      
numDivisors :: Int -> Int
numDivisors n = product $ map (\xs -> 1 + length xs) $ separate $ factors !! (n - 1)


separate :: Eq a => [a] -> [[a]]
separate [] = []
separate a@(x:xs) = let (m, n) = span (== x) a
			in m : separate n
			
answer =  1 + (fromMaybe 0 $ findIndex (> 100) $ map numDivisors [1 .. ])	

where yToX y = n*y / (y - n) 
	      filterInt m = let q = round m in if m == fromInteger q then Maybe q else Nothing :: Maybe Int
	      check (Maybe a, b) = (a, b)
	      check (Nothing, b) = 


-}
