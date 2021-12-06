#! /usr/bin/awk -f 

function getFirstBingoNumber(card, numbers){
  count = 0;
  for (number in numbers){
    count++;	
    for (j=1; j<=25; j++){
      if (card[j] == numbers[number]){card[j] = -1}
      for (k=0; k<=4; k++){
        row = card[5*k+1]+card[5*k+2]+card[5*k+3]+card[5*k+4]+card[5*k+5]
	column = card[k+1]+card[k+1+5]+card[k+1+10]+card[k+1+15]+card[k+1+20]
	if(row == -5 || column == -5){return count}
	row = 0; column = 0}}}}

function getCardMarkedSum(card){sum=0; for (i=1; i<=25; i++){if (card[i] != -1){sum+=card[i]}};return sum}
	
BEGIN {RS = "\n\n"; FS = " "}
NR==1{n=split($0, numbers, ",")}
NR>1{for (i=1; i<=NF; i++){bingoCard[NR-1][i] = $(i)}; cardCount++}
END {for (i=1; i<= cardCount; i++) {bingoSequence[i] = getFirstBingoNumber(bingoCard[i], numbers)};
     tempMin = n; tempMax = 0; 
     for (j in bingoSequence){
	     if(bingoSequence[j] < tempMin) {winnerCard = j; tempMin = bingoSequence[j]};
	     if(bingoSequence[j] > tempMax) {loserCard = j; tempMax = bingoSequence[j]}}; 
     print "Winner Card: " getCardMarkedSum(bingoCard[winnerCard]) * numbers[bingoSequence[winnerCard]] 
     print "Loser Card:  " getCardMarkedSum(bingoCard[loserCard]) * numbers[bingoSequence[loserCard]]}	
