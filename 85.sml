
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

(* clearly numRects is a strictly increasing function of i and j 
fun search (i, j, best) target = let 
			         val iUp = abs((numRects (i - 1) j) - target)
			         val jUp = abs((numRects i (j - 1)) - target)
				 val ijUp = abs((numRects (i - 1) (j - 1)) - target)
			      in 
				if iUp < best then search ((i - 1), j, iUp) target
				else if jUp < best then search (i, (j - 1), jUp) target
				     else if ijUp < best then search ((i - 1), (j - 1), ijUp) target
					  else i*j	
			       end    *)

(* Clearly numRects is a strictly increasing function of i and j. Key idea: if a rectangle has corners (iNW, jNW) (iNE, jNE) (iSE, jSE) (iSW, jSW) with values vNW, vNE, vSE, vSW, then every point (i, j) in the rectangle (edges included) satisfies numRects iNW jNW <= numRects i j <= numRects iSE jSE *)

(* Invariant: arguments form a rectangle *)
(*
local 
   fun evalRectangle (iNW, jNW) (iSE, jSE) = (numRects iNW jNW, numRects iSE jNW, numRects iSE jSE, numRects iNW jSE)
in       
fun binarySearch (iNW, jNW) (iSE, jSE) target = (*(iNW, jNW, vNW) (iNE, jNE, vNE) (iSE, jSE, vSE) (iSW, jSW, vSW) target = *)
		if iNW = iSE and jNW = jSE then iNW*jNW 
		else let 
			val iMid (iNW + iSE) div 2
			val jMid (jNW + jSE) div 2
			val vMid = numRects iMid jMid
			val mid = (iMid, jMid, vMid)
			val vDown = numRects iMid jSE
			val down = (iMid, jSE, vDown)
			val vRight = numRects iNE jMid
			val right = (iNE, jMid, vRight)
		     in if vMid > target and vRight > target and vDown > targetthen
				 binarySearch  (iNW, jNW, vNW) (iNE, jNE, vNE) (iSE, jSE, vSE) (iSW, jSW, vSW) target *)

(*

fun walkSearch (i, j) eval = let 
			      val current = eval (i, j)
			      val up = if j - 1 >= 1 then eval (i, (j-1)) else eval (i, j)
			      val left = if i - 1 >= 1 then eval ((i- 1), j) else eval (i, j)
			    in if up < current then
					if left < up then walkSearch (i - 1, j) eval else walkSearch (i, j -1) eval
				else if left < current then walkSearch (i - 1, j) eval else (i, j) 
				end *)

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





