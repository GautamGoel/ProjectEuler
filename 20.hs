revDigits = map (`mod` 10) . takeWhile (> 0) . iterate (`div` 10)


factorial n = factorialHelper n 1

factorialHelper n acc | n == 1 = acc
					  | otherwise = factorialHelper (n-1) n*acc
						
main = do
	print $ (sum. revDigits . factorial) 100
							