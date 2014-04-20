package main

import (
	"fmt"
	)
	
func main(){
	
	fmt.Println(maxIndex(chains(1000001)))
}

func maxIndex(nums []int64) int{
	var maxValue int64 = 0
	var maxIndex = 0
	for i := 0; i < len(nums); i++{
		if nums[i] > maxValue{			
			maxValue = nums[i]
			maxIndex = i
		}
		fmt.Println(i, nums[i], maxIndex, maxValue)
	}
	return maxIndex
}

func chains(m int64) []int64{
	seq := make([]int64, m)
	seq[0] = 0
	seq[1] = 0
	for i := 2; int64(i) < m; i++{ 
		var chain int64 = 0
		n := int64(i)
	N:	for n != 1{
			n = collatz(n)
			chain += 1
			if n < int64(i) {
				seq[i] = chain + seq[n] 
				break N
			}
		}
	}
	
	return seq

}

func collatz(n int64) int64{
		var result int64
		if n % 2 == 0{
			result = n/2
		}else{
			result = 3*n + 1
		}
		return result
	}