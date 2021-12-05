#! /usr/bin/awk -f

BEGIN { FS = "[ ,]"}
{if ($1 == $4) {if ($2 > $5){for (i = $5; i<= $2; i++) {points[$1, i]++}} else{for (i = $2; i<= $5; i++) {points[$1, i]++}}}}
{if ($2 == $5) {if ($1 > $4){for (i = $4; i<= $1; i++) {points[i, $2]++}} else{for (i = $1; i<= $4; i++) {points[i, $2]++}}}}
{if ($1 != $4 && $2 != $5){ 
	{points[$1, $2]++;points[$4, $5]++}
	if ($1 > $4 && $2 > $5){j=$5+1; for (i=$4+1; i<$1; i++){points[i, j]++; j++}}
	if ($1 > $4 && $2 < $5){j=$5-1; for (i=$4+1; i<$1; i++){points[i, j]++; j--}}
	if ($1 < $4 && $2 > $5){j=$2-1; for (i=$1+1; i<$4; i++){points[i, j]++; j--}}
	if ($1 < $4 && $2 < $5){j=$2+1; for (i=$1+1; i<$4; i++){points[i, j]++; j++}}}}
END{for (comb in points) {split(comb, sep, SUBSEP); if (points[sep[1], sep[2]] > 1){c++}} print "Solution_2: " c} 
