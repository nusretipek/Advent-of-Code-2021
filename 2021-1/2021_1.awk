#! /usr/bin/awk -f

{
 if (prev_sum < current_sum && prev3 != "") c2 += 1;
 if (prev < $0 && prev != "") c1 +=1;
 prev_sum = prev+prev2+prev3;
 current_sum = $0+prev+prev2; 
 prev3 = prev2; prev2 = prev; prev = $0
}
END{print "Solution_1: " c1; print "Solution_2: " c2}
