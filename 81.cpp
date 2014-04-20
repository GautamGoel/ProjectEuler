#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <algorithm>
using namespace std; 

//given an m x n array, return the min sum along all 
//paths that begin at (0, 0) and end at (m, n), while 
//going only down and to the right.
int getMinSum(int arr[80][80], int m, int n){

	//dyn has the property that dyn[i][j] is the cost of
	//"least expensive" way to get from arr[0][0] to
	//arr[i, j]. It includes the cost of arr[i][j]
	int dyn [m][n];

	//take care of left-most column and topmost row
	dyn[0][0] = arr[0][0];
	for(int i = 1; i < m; i++){
		dyn[i][0] = arr[i][0] + dyn[i-1][0];
	}
	for(int j = 1; j < n; j++){
		dyn[0][j] = arr[0][j] + dyn[0][j-1];
	}

	//fill in the rest
	for(int i = 1; i < m; i++){
		for(int j = 1; j < n; j++){
			dyn[i][j] = arr[i][j] + min(dyn[i][j-1], dyn[i-1][j]);
		}
	}

	for(int i = 0; i < m; i++){
		for(int j = 0; j < n; j++){
			cout << dyn[i][j] << " ";
		}
		cout << '\n';
	}
	return dyn[m - 1][n - 1]; //lower right entry
}

int main(){

	//read in file 
	fstream file;
	file.open("matrix.txt", ios::in);
	string text [80];
	int i = 0;
	string line;
	while ( getline (file,line) )
    {	
      text[i] = line;
      i++;
    }
	file.close();

	/*
	for(int i = 0; i < 80; i++){
		cout << text[i] << '\n';
	}
*/

	//convert to ints
	int data[80][80];
	for(int i = 0; i < 80; i++){
		stringstream ss(text[i]);
		int value; 

		int j = 0;
		while(ss){
			ss >> value;
			data[i][j] = value;
			//cout << value << '\n';
			ss.ignore(80, ',');
			j++;
		}
	}

	int testData [3][3] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

	int answer = getMinSum(data, 80, 80);
	cout << answer << '\n';
}