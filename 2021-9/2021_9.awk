#! /usr/bin/gawk -f
function checkElementArr(tempArr, j, k){for (i in tempArr){if (tempArr[i] == j k){return 1}}{return 0}}

function arrLength(inputArr){len = 0; for (i in inputArr){len++}; return len}

function getLow(arr){
	cumSum = 0
	for (j=1; j<=NR; j++){
		for (k=1; k<=NF; k++){
			north = arr[j-1][k]; if (north == ""){north = 9}
			south = arr[j+1][k]; if (south == ""){south = 9}
			west = arr[j][k-1]; if (west == ""){west = 9}
			east = arr[j][k+1]; if (east == ""){east = 9}
			if (arr[j][k] < west &&  arr[j][k] < east  && arr[j][k] < north && arr[j][k] < south){cumSum += (arr[j][k]+1)}}}
	return cumSum} 

function populateBasin(arr, tempArr, j, k, counter){
	if (checkElementArr(tempArr, j, k) == 0 && k>0 && j>0 && j<=NR && k<=NF){
		tempArr[arrLength(tempArr)+1] = j k
		if(arr[j][k-1] != 9){populateBasin(arr, tempArr, j, k-1, counter)}
		if(arr[j][k+1] != 9){populateBasin(arr, tempArr, j, k+1, counter)}
		if(arr[j-1][k] != 9){populateBasin(arr, tempArr, j-1, k, counter)} 
		if(arr[j+1][k] != 9){populateBasin(arr, tempArr, j+1, k, counter)}}}
	
function getBasin(arr){
	counter = 1
	for (j=1; j<=NR; j++){
		for (k=1; k<=NF; k++){
			north = arr[j-1][k]; if (north == ""){north = 9}
			south = arr[j+1][k]; if (south == ""){south = 9}
			west = arr[j][k-1]; if (west == ""){west = 9}
			east = arr[j][k+1]; if (east == ""){east = 9}
			if (arr[j][k] < west &&  arr[j][k] < east  && arr[j][k] < north && arr[j][k] < south){
				populateBasin(arr, tempArr, j, k, 0);basinArr[counter] = arrLength(tempArr); counter += 1; delete tempArr}}}
	n = asort(basinArr) 
	return basinArr[n]*basinArr[n-1]*basinArr[n-2]}
	

BEGIN {FS = ""}
{for (i = 1; i <=NF; i++){field[NR][i] = $(i)}}
END {print "Solution_1: " getLow(field); print "Solution_2: " getBasin(field)}
