package main

import "fmt"

//uses DP to calculate number of ways to tile a
//segment of cells of length s with tiles of lengths in t
func numWays(s int, ts []int) int64 {
	var arr = make([]int64, s+1) //automatically initiallized to be all zeroes

	t := ts[0]
	for i := 0; i < len(ts); i++ {
		if ts[0] < t {
			t = ts[0]
		}
	} //now t is the length of the smallest tile

	var helper func(int) int64
	helper = func(sl int) int64 {
		if sl < t { //if segment is less then length of tile
			return 0
		} else if arr[sl] != 0 { //if we already computed the value, return it
			return arr[sl]
		} else {
			var x int64
			var t int
			for j := 0; j < len(ts); j++ {
				t = ts[j]
				for i := 0; i <= sl-t; i++ {
					x += 1 + helper(sl-t-i)
				}
				arr[sl] = x
			}
			return x
		}
	}

	return helper(s)

}

func main() {
	ts := []int{2, 3, 4}
	fmt.Println(1 + numWays(5, ts)) //add 1 because empty segment is allowed
}
