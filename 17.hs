pieces :: Int -> [Int]
pieces n =  let revDigits = map (`mod` 10) . takeWhile (> 0) . iterate (`div` 10)
				in filter (/= 0) $ map (\(x, y) -> x*y) $ zip (map (10^) [0 ..]) (revDigits n)
				
--pieces 647 = [7, 40, 600], pieces 8041 = [1, 40, 8000]

word :: Int -> String
word 0 = ""
word 1 = "one"
word 2 = "two"
word 3 = "three"
word 4 = "four"
word 5 = "five"
word 6 = "six"
word 7 = "seven"
word 8 = "eight"
word 9 = "nine"
word 10 = "ten"
word 11 = "eleven"
word 12 = "twelve"
word 13 = "thirteen"
word 14 = "fourteen"
word 15 = "fifteen"
word 16 = "sixteen"
word 17 = "seventeen"
word 18 = "eighteen"
word 19 = "nineteen"
word 20 = "twenty"
word 30 = "thirty"
word 40 = "forty" 
word 50 = "fifty"
word 60 = "sixty"
word 70 = "seventy"
word 80 = "eighty"
word 90 = "ninety"
word 100 = "hundred"
word 1000 = "thousand"

{-
pieceToWord :: Int -> String 
pieceToWord n = let power = 10^(floor $ logBase 10 n)
			        digit = n/power
			        in -}
			        
strConcat :: (Int, Int) -> String			        
strConcat (a, b) = if b == 0 then word a else (word a) ++ "-" ++ (word b)


--only works with integers between 1 and 1000, inclusive
toWord :: Int -> String
toWord n = let tens = mod n 100;
			   tensWords = if tens == 0 then "" else 
		       		if tens < 21 then word tens else strConcat (10*(div tens 10), tens `mod` 10);
		       hundreds = n `div` 100;
		       hundredsWords = if hundreds == 0 then "" else 
		       		if hundreds < 10 then 
		       			(word hundreds) ++ " hundred" ++ (if tens == 0 then "" else " and ")
		       		else "one thousand" ++ (if tens == 0 then "" else " and ")
		       in hundredsWords ++ tensWords
		     
countLetters :: [Char] -> Int
countLetters s = (length s) - (length $ filter (== ' ') s) - (length $ filter (== '-') s)

main = do
		print $ sum $ map (countLetters . toWord) [1 .. 1000]