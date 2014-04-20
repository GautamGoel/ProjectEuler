val limit = 1000
val memopad : int Array2.array = Array2.array (limit, limit, 0)


fun numRects' 1 1 = 1
   |numRects' i 1 = (i + 1)*i div 2
   |numRects' i j = if i >= j then numRects i (j - 1) + j*(numRects i 1) else numRects j i
and 
    numRects i j = if i < limit andalso j < limit then 
				if Array2.sub (memopad, i, j) > 0 then Array2.sub (memopad, i, j) 
				else let 
					val r = numRects' i j
				     in
					Array2.update (memopad, i, j, r);
					Array2.update (memopad, j, i, r);
					r
				     end
		   else numRects' i j

fun walkSearch (i, j) eval = let 
 			        val current = eval (i, j)
			        val up = if j - 1 >= 1 then eval (i, (j-1)) else eval (i, j)
 			        val left = if i - 1 >= 1 then eval ((i- 1), j) else eval (i, j)
 			      in if up < current then
 					if left < up then walkSearch (i - 1, j) eval else walkSearch (i, j -1) eval
 				else if left < current then walkSearch (i - 1, j) eval else (i, j) 
 			      end 


fun makeEval target = (fn (i, j) => abs ((numRects i j) - target))

 
local
	fun findStartHelper i target = if (numRects i i) > target then (i, i) else findStartHelper (i + 1) target
in
	fun findStart target = findStartHelper 1 target
end    


val target = 2000000 
val eval = makeEval target
val closest = walkSearch (findStart target) eval 
fun area (i, j) = i*j
val answer = area closest 





