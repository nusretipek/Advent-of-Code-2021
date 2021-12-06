#! /usr/bin/awk -f

function dailyUpdate(arr){newBirth = arr[0]; for(j=1; j<=8; j++){arr[j-1] = arr[j]}; arr[8] = newBirth; arr[6] += newBirth}	
BEGIN { FS="," }
{for(i=1; i<=NF; i++){fishes[$i]++;fishes2[$i]++}}
END {{for (k=1; k<= 80; k++) {dailyUpdate(fishes)}; for(i in fishes) {l += fishes[i]}; print "Solution_2: " l};
     {for (k=1; k<= 256; k++) {dailyUpdate(fishes2)}; for(i in fishes2) {l2 += fishes2[i]}; print "Solution_2: " l2}}
