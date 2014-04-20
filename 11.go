package main

import (
	"fmt"
	"strconv"
	"strings"
	)

func main(){
	var grid [][]int64 = toGrid(parse(numbers))
	//listUpProd(grid)
	fmt.Println(maxProd(grid));
	
}

var numbers = `08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48`

func toGrid(intSlice []int64) [][]int64{
	var grid = make([][]int64, 20)
	for i := 0; i < 20; i++ {  //iterate over rows
		var row = make([]int64, 20)
		row = intSlice[i*20:i*20 + 20]
		grid[i] = row
	}
	return grid
}


func seperateOn(r rune) bool{
	return r == ' ' || r == '\t' || r == '\n' || r == '\r'
}

func parse(s string) []int64{
	var intStrings = strings.FieldsFunc(s, seperateOn)	
	var l = len(intStrings)
	var intSlice = make([]int64, l)
	for i := 0; i < l; i += 1{
		intSlice[i], _ = strconv.ParseInt(intStrings[i], 10, 64)
	}
	return intSlice
}
		
func prod(intSlice []int64) int64 {
	var prod int64 = 1
	for i := 0; i < len(intSlice); i++{
		prod *= intSlice[i]
	}
	return prod
}

func max(nums ...int64) int64{
	var max int64 = 0
	for i := 0; i < len(nums); i++{
		if nums[i] > max{
			max = nums[i]
		}
	}
	return max
}


func rightProd(intSlice [][]int64, i, j int) int64{
	return prod(intSlice[i][j:j+4])
}

func leftProd(intSlice [][]int64, i, j int) int64{
	return prod(intSlice[i][j-3:j+1])
}



func downProd(intSlice [][]int64, i, j int) int64{
	v1 := intSlice[i+3][j]
	v2 := intSlice[i+2][j]
	v3 := intSlice[i+1][j]
	v4 := intSlice[i][j]
	return v1*v2*v3*v4
}

func upProd(intSlice [][]int64, i, j int) int64{
	v1 := intSlice[i-3][j]
	v2 := intSlice[i-2][j]
	v3 := intSlice[i-1][j]
	v4 := intSlice[i][j]
	return v1*v2*v3*v4
} 

func diagDownRightProd(intSlice [][]int64, i, j int) int64{
	var v1 int64 = intSlice[i][j]
	var v2 int64 = intSlice[i+1][j+1]
	var v3 int64 = intSlice[i+2][j+2]
	var v4 int64 = intSlice[i+3][j+3]
	return v1*v2*v3*v4
}

func diagUpRightProd(intSlice [][]int64, i, j int) int64{
	var v1 int64 = intSlice[i][j]
	var v2 int64 = intSlice[i-1][j+1]
	var v3 int64 = intSlice[i-2][j+2]
	var v4 int64 = intSlice[i-3][j+3]
	return v1*v2*v3*v4
}

func diagDownLeftProd(intSlice [][]int64, i, j int) int64{
	var v1 int64 = intSlice[i][j]
	var v2 int64 = intSlice[i+1][j-1]
	var v3 int64 = intSlice[i+2][j-2]
	var v4 int64 = intSlice[i+3][j-3]
	return v1*v2*v3*v4
}

func diagUpLeftProd(intSlice [][]int64, i, j int) int64{
	var v1 int64 = intSlice[i][j]
	var v2 int64 = intSlice[i-1][j-1]
	var v3 int64 = intSlice[i-2][j-2]
	var v4 int64 = intSlice[i-3][j-3]
	return v1*v2*v3*v4
}

func maxDownProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 0; i < 16; i++{
		for j := 0; j < 20; j++{
			var x = downProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}

func listUpProd(intSlice [][]int64) int64{
	//var max int64 = 0
	for i := 16; i < 20; i++{
		for j := 0; j < 20; j++{
			fmt.Println(intSlice[i][j], upProd(intSlice, i, j))
		}
	}
	return 3
}

func maxUpProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 16; i < 20; i++{
		for j := 0; j < 20; j++{
			var x = upProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}

func maxRightProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 0; i < 20; i++{
		for j := 0; j < 16; j++{
			var x = rightProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}

func maxLeftProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 0; i < 20; i++{
		for j := 16; j < 20; j++{
			var x = leftProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}

func maxDiagUpLeftProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 3; i < 20; i++{
		for j := 3; j < 20; j++{
			var x = diagUpLeftProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}

func maxDiagUpRightProd(intSlice [][]int64) int64{
	var max int64 = 0
	for i := 3; i < 20; i++{
		for j := 0; j < 17; j++{
			var x = diagUpRightProd(intSlice, i, j)
			if x > max{
				max = x
			}
		}
	}
	return max
}


	
func maxProd(intSlice [][]int64) int64{
	v1 := maxUpProd(intSlice)
	v2 := maxDownProd(intSlice)
	v3 := maxRightProd(intSlice)
	v4 := maxLeftProd(intSlice)
	v5 := maxDiagUpRightProd(intSlice)
	v6 := maxDiagUpLeftProd(intSlice)

	return max(v1, v2, v3, v4, v5, v6)
}

/*

[[8 2 22 97 38 15 0 40 0 75 4 5 7 78 52 12 50 77 91 8]
 [49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 4 56 62 0]
 [81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 3 49 13 36 65]
 [52 70 95 23 4 60 11 42 69 24 68 56 1 32 56 71 37 2 36 91] 
 [22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80]
 [24 47 32 60 99 3 45 2 44 75 33 53 78 36 84 20 35 17 12 50] 
 [32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70] 
 [67 26 20 68 2 62 12 20 95 63 94 39 63 8 40 91 66 49 94 21] 
 [24 55 58 5 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72] 
 [21 36 23 9 75 0 76 44 20 45 35 14 0 61 33 97 34 31 33 95] 
 [78 17 53 28 22 75 31 67 15 94 3 80 4 62 16 14 9 53 56 92] 
 [16 39 5 42 96 35 31 47 55 58 88 24 0 17 54 24 36 29 85 57] 
 [86 56 0 48 35 71 89 7 5 44 44 37 44 60 21 58 51 54 17 58] 
 [19 80 81 68 5 94 47 69 28 73 92 13 86 52 17 77 4 89 55 40] 
 [4 52 8 83 97 35 99 16 7 97 57 32 16 26 26 79 33 27 98 66] 
 [88 36 68 87 57 62 20 72 3 46 33 67 46 55 12 32 63 93 53 69] 
 [4 42 16 73 38 25 39 11 24 94 72 18 8 46 29 32 40 62 76 36] 
 [20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 4 36 16] 
 [20 73 35 29 78 31 90 1 74 31 49 71 48 86 81 16 23 57 5 54] 
 [1 70 54 71 83 51 54 69 16 92 33 48 61 43 52 1 89 19 67 48]] */
