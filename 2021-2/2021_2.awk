#! /usr/bin/awk -f

BEGIN{FS=" "}
{
 if ($1 == "forward"){f+=$2; new_d+=(d*$2)};
 if ($1 == "up") d-=$2;
 if ($1 == "down") d+=$2;
}
END{print "Solution_1: " d*f; print "Solution_2: " new_d*f}
