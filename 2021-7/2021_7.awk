#! /usr/bin/gawk -f

function absoluteValue(n){if (n<0) {return -n} else{return n}}
function getMedian(arr){if (length(arr)%2==1) {return int(arr[(length(arr)+1)/2])} else{return int((arr[length(arr)/2]+arr[(length(arr)/2)+1])/2)}}
function getEulerSum(n){return int((n*(n+1))/2)}

{n = split($0, positions, ",")}

END{asort(positions); medianValue = getMedian(positions); for (i in positions) {sum += absoluteValue(positions[i]-medianValue)}; print "Solution_1: " sum;
    for (j=position[1]; j<=positions[length(positions)]; j++){sum = 0; for (k in positions) {sum += getEulerSum(absoluteValue(positions[k]-j))}; 
      if (j==1){minSum = sum}; if (sum < minSum) {minSum = sum}}; print "Solution_2: " minSum}
