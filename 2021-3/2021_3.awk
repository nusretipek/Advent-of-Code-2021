#! /usr/bin/awk -f

function binary2decimal(input){
  result = 0;
  if (input~/[^01]/){return input}
  for (i=length(input); i; i--) {result += 2^(length(input)-i) * substr(input,i,1)}
  return result}	
NR==1{arr = split($1, master_digits, "");
      for (i in master_digits){master_digits[i] = 0}}
{split($1, digits, "");for (i in digits){master_digits[i] += digits[i]}}
END{gamma = "";epsilon = "";
 for (i in master_digits){
	 if(master_digits[i] > int(NR/2)){gamma = (gamma)"1"; epsilon = (epsilon)"0"} 
	 else{gamma = (gamma)"0"; epsilon = (epsilon)"1"}}
 print "Solution_1: " binary2decimal(gamma)*binary2decimal(epsilon)}
