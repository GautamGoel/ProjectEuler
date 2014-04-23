package main

import
"fmt"

//uses DP to calculate number of ways to tile a 
//segment of cells of length s with tiles of length t
func numWays(s, t int) int64{
	var arr = make([]int64, s + 1) //automatically initiallized to be all zeroes

	var helper func(int) int64
	helper = func(sl int) int64{
		if sl < t { //if segment is less then length of tile
			return 0
		} else if arr[sl] != 0 { //if we already computed the value, return it
			return arr[sl]
		} else {
			var x int64
			for i := 0; i <= sl - t; i++ {
				x += 1 + helper(sl-t-i)
			}
			arr[sl] = x
			return x
		} 
	}

	return helper(s)

}

func main(){
	fmt.Println(numWays(50, 2) + numWays(50, 3) + numWays(50, 4))
}
