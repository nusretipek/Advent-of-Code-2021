#! /usr/bin/gawk -f

function checkCorrupt(str){
	split(str, chars, "")
	closingPattern = ""
	for (i in chars){
		if(chars[i] == "("){closingPattern = ")" closingPattern}
		else if(chars[i] == "{"){closingPattern = "}" closingPattern}
		else if(chars[i] == "["){closingPattern = "]" closingPattern}
		else if(chars[i] == "<"){closingPattern = ">" closingPattern}
		else if(chars[i] == ")"){
			if(substr(closingPattern, 1, 1) == ")"){closingPattern = substr(closingPattern,2,length(closingPattern))}
			else{return 3}}
		else if(chars[i] == "}"){
			if(substr(closingPattern, 1, 1) == "}"){closingPattern = substr(closingPattern,2,length(closingPattern))}
			else{return 1197}}
		else if(chars[i] == "]"){
			if(substr(closingPattern, 1, 1) == "]"){closingPattern = substr(closingPattern,2,length(closingPattern))}
			else{return 57}}
		else if(chars[i] == ">"){
			if(substr(closingPattern, 1, 1) == ">"){closingPattern = substr(closingPattern,2,length(closingPattern))}
			else{return 25137}}}
	return 0}
	
function checkIncomplete(str){
		split(str, chars, "")
		closingPattern = ""
		score = 0
		for (i in chars){
			if(chars[i] == "("){closingPattern = ")" closingPattern}
			else if(chars[i] == "{"){closingPattern = "}" closingPattern}
			else if(chars[i] == "["){closingPattern = "]" closingPattern}
			else if(chars[i] == "<"){closingPattern = ">" closingPattern}
			else{closingPattern = substr(closingPattern,2,length(closingPattern))}}
		split(closingPattern, incompleteChars, "")
		for (j in incompleteChars){
			score *= 5
			if (incompleteChars[j] == ")"){score += 1}
			else if (incompleteChars[j] == "]"){score += 2}
			else if (incompleteChars[j] == "}"){score += 3}
			else if(incompleteChars[j] == ">"){score += 4}}
		return score}

BEGIN {FS = ""; c = 1}
{corruptedSum += checkCorrupt($0); if(checkCorrupt($0) == 0){scoreArr[c++] = checkIncomplete($0)}}
END {print "Solution_1: " corruptedSum; n = asort(scoreArr); print "Solution_2: " scoreArr[int(n/2)+1]}
