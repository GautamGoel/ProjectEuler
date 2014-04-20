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


fun searchLimits value = let n = ceiling ((1.0 + (Math.sqrt (Real.fromInt (1 + 8*value))))/2) 

fun search eval (i, j) =  


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





