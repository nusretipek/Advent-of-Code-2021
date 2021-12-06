#! /usr/bin/gawk -f

function dailyUpdate(arr, l){for (i in arr){if (arr[i] > 0) {arr[i] = arr[i]-1} else {arr[i] = 6; arr[l+1] = 8; l++}}; return l}
BEGIN{ FS = "," }
{ for (i=1; i <= NF; i++) {fishes[i] = $(i)} }
END {l = length(fishes); for (j=1; j <= 80; j++) {l = dailyUpdate(fishes, l)}; print "Solution_1: " l}
