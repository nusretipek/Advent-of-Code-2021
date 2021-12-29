#! /usr/bin/awk -f

function checkLength(combination){
	lenCombination = length(combination)
	if (lenCombination == 2  || lenCombination == 3 || lenCombination == 4 || lenCombination == 7){return 1}
	else{return 0}}

function getUniqueNumbers(combinationArr, len){
	for (i = 1; i <= 10; i++){if (length(combinationArr[i]) == len){return combinationArr[i]}}}

function deductZero(combinationArr, numberOne, numberFour){
	split(numberFour, fourArr, "")
	split(numberOne, oneArr, "")
	uniqueLetters = ""
	for (letterFour in fourArr){
		inArr = 0
		for (letterOne in oneArr){if (oneArr[letterOne] == fourArr[letterFour]){inArr = 1}}
		if (inArr == 0) {uniqueLetters = uniqueLetters fourArr[letterFour]}}
	split(uniqueLetters, missingLetters, "")
	for (i = 1; i <= 10; i++){
		if (length(combinationArr[i]) == 6){
			split(combinationArr[i], letterArr, "")
			score = 0
			for (j in letterArr){if (letterArr[j] == missingLetters[1] || letterArr[j] == missingLetters[2]){score += 1}}
			if (score == 1){return combinationArr[i]}}}}	

function deductNineSix(combinationArr, numberOne, numberZero, scoreLen){
	split(numberOne, oneArr, "")
	for (i = 1; i <= 10; i++){
		if (length(combinationArr[i]) == 6 && checkCombinations(combinationArr[i], numberZero) == 0){
			split(combinationArr[i], letterArr, "")
			score = 0
			for (j in letterArr){if (letterArr[j] == oneArr[1] || letterArr[j] == oneArr[2]){score += 1}}
			if (score == scoreLen) {return combinationArr[i]}}}}	

function deductThree(combinationArr, numberOne){
	split(numberOne, oneArr, "")
	for (i = 1; i <= 10; i++){
		if (length(combinationArr[i]) == 5){
			split(combinationArr[i], letterArr, "")
			score = 0
			for (j in letterArr){if (letterArr[j] == oneArr[1] || letterArr[j] == oneArr[2]){score += 1}}
			if (score == 2) {return combinationArr[i]}}}}
	
function deductFiveTwo(combinationArr, numberFour, numberThree, scoreLen){
	split(numberFour, fourArr, "")
	for (i = 1; i <= 10; i++){
		if (length(combinationArr[i]) == 5 && checkCombinations(combinationArr[i], numberThree) == 0){
			split(combinationArr[i], letterArr, "")
			score = 0
			for (j in letterArr){if (letterArr[j] == fourArr[1] || letterArr[j] == fourArr[2] || letterArr[j] == fourArr[3] || letterArr[j] == fourArr[4]){score += 1}}
			if (score == scoreLen) {return combinationArr[i]}}}}

function checkCombinations(numberArr, PassArr){
	similarityScore = 0
	if(length(numberArr) == length(PassArr)){
		split(numberArr, numbers, "")
		split(PassArr, passes, "")
		for (j in numbers){for (k in passes){if (numbers[j] == passes[k]) {similarityScore += 1}}}
		if (similarityScore == length(numberArr)) {return 1}}
	return 0}
		
function getNumericCombination(line){
	split(line, combinationArr, " ");
	one = getUniqueNumbers(combinationArr, 2)
	four = getUniqueNumbers(combinationArr, 4)
	seven = getUniqueNumbers(combinationArr, 3)
	eight = getUniqueNumbers(combinationArr, 7)
	zero = deductZero(combinationArr, one, four)
	nine = deductNineSix(combinationArr, one, zero, 2)
	six = deductNineSix(combinationArr, one, zero, 1)
	three = deductThree(combinationArr, one)
	two = deductFiveTwo(combinationArr, four, three, 2)
	five = deductFiveTwo(combinationArr, four, three, 3)
	finalNumber = ""
	for (i=12; i<=15; i++){	
		if(checkCombinations(combinationArr[i], zero) == 1){finalNumber = finalNumber 0}
		if(checkCombinations(combinationArr[i], one) == 1){finalNumber = finalNumber 1}
		if(checkCombinations(combinationArr[i], two) == 1){finalNumber = finalNumber 2}
		if(checkCombinations(combinationArr[i], three) == 1){finalNumber = finalNumber 3}
		if(checkCombinations(combinationArr[i], four) == 1){finalNumber = finalNumber 4}
		if(checkCombinations(combinationArr[i], five) == 1){finalNumber = finalNumber 5}
		if(checkCombinations(combinationArr[i], six) == 1){finalNumber = finalNumber 6}
		if(checkCombinations(combinationArr[i], seven) == 1){finalNumber = finalNumber 7}
		if(checkCombinations(combinationArr[i], eight) == 1){finalNumber = finalNumber 8}
		if(checkCombinations(combinationArr[i], nine) == 1){finalNumber = finalNumber 9}}
	return finalNumber}

BEGIN {FS = " "; countUnique = 0; combinationSum = 0}
{countUnique += (checkLength($12) + checkLength($13) + checkLength($14) + checkLength($15)); combinationSum += getNumericCombination($0)}
END {print "Solution_1: " countUnique; print "Solution_2: " combinationSum}
