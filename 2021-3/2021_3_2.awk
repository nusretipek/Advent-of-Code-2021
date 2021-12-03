#! /usr/bin/awk -f

function binary2decimal(input){
  result = 0;
  if (input~/[^01]/){return input}
  for (i=length(input); i; i--) {result += 2^(length(input)-i) * substr(input,i,1)}
  return result}	

function arrLength(inputArr){len = 0; for (i in inputArr){len++}; return len}

function getWinnerBit(inputArr, position){
  count = 0;
  for (i in inputArr){split(inputArr[i], digits, ""); if(digits[position] == 1) count++}
  if (count >= arrLength(inputArr)/2){return 1} else{return 0}}

function getLoserBit(inputArr, position){
  count = 0;
  for (i in inputArr){split(inputArr[i], digits, ""); if(digits[position] == 1) count++}
  if (count >= arrLength(inputArr)/2){return 0} else{return 1}}

function searchArrayOxygen(inputArr){
  while(arrLength(inputArr) > 1){
    for (c=1; c<=12; c++){
      winnerBit = getWinnerBit(inputArr, c); 
      for(i in inputArr){
        split(inputArr[i], digits, ""); 
	if (digits[c] != winnerBit){delete inputArr[i]}}
      if(arrLength(inputArr) == 1){for (i in inputArr){return inputArr[i]}}}}}

function searchArrayCO2(inputArr){
  while(arrLength(inputArr) > 1){
    for (c=1; c<=12; c++){
      winnerBit = getLoserBit(inputArr, c); 
      for(i in inputArr){
        split(inputArr[i], digits, ""); 
        if (digits[c] != winnerBit){delete inputArr[i]}} 
      if(arrLength(inputArr) == 1){for (i in inputArr){return inputArr[i]}}}}}

{arr[NR] = $1;arr_2[NR] = $1}
END{print "Solution_2: " binary2decimal(searchArrayOxygen(arr))*binary2decimal(searchArrayCO2(arr_2))}
