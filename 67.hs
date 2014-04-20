import Data.Char
import Data.List.Split
import System.IO  

		

sLittle = "3 \
\ 7 4\
\ 2 4 6\
\ 8 5 9 3"

s = "75 \
\95 64 \
\17 47 82 \
\18 35 87 10 \
\20 04 82 47 65 \
\19 01 23 75 03 34 \
\88 02 77 73 07 63 67 \
\99 65 04 28 06 16 70 92 \
\41 41 26 56 83 40 80 70 33 \
\41 48 72 33 47 32 37 16 94 29 \
\53 71 44 65 25 43 91 52 97 51 14 \
\70 11 33 28 77 73 17 78 39 68 17 57 \
\91 71 52 38 17 14 91 43 58 50 27 29 48 \
\63 66 04 68 89 53 67 30 73 16 69 87 40 31 \
\04 62 98 27 23 09 70 98 73 93 38 53 60 04 23" 

makeTriangle :: String -> [[Int]] -- list of rows
makeTriangle s = Data.List.Split.splitPlaces [1 ..] $ map read $ words s


maxSum :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
maxSum lastRow currentRow = let n = length currentRow;
				getSum (val, sum) = sum;
				f (a, i) = if i == 0 then (a, a + (getSum $ lastRow !! 0)) else
					if i == n - 1 then (a, a + (getSum $ lastRow !! (n - 2))) else
					(a, a + max (getSum (lastRow !! (i - 1))) (getSum (lastRow !! i)));
				in map f currentRow
scanForMax :: [(Int, Int)] -> Int				
scanForMax = maximum . map (\(x, y) -> y)			
				
main = do
	contents <- readFile "triangle.txt"  
	let triangle = makeTriangle contents
	    first = head $ head triangle 
	print $ first + (scanForMax $ foldl1 maxSum $ map (\x -> zip x [0 ..]) triangle)

