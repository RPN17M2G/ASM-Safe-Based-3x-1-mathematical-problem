# ASM-Safe-Based-3x-1-mathematical-problem
A safe for a game of safes that is based on the mathematical problem 3x + 1.

## The problem
Let's play a game - Choose a number, any number. 
If the number is odd multiplie it by 3 and add 1.
If the number is even divide it by 2.
Continue iterating the function until reaching a loop - Did you stop on the loop 4,2,1?
The odds say you did(and if you stopped on a different loop - Congratulations! You solved one of the most difficult problems in our current world of mathematics(Jan 2024)).
Mathematicians brute forced the problem until the number 2^60 and each one of the numbers reached this loop.

## The safe
The safe is built on the assumption that the attacker does not know the 3x + 1 problem.
The safe implements the problem simulation and running the two pointers technique to determine when to stop(When reaching the final loop).
The attacker needs to input 3 numbers - The 3 results of the loop. 
But because 1,2 and 4 are small and common enought that a potential attacker would try them blindly we will multiplie the results(1,2 and 4) by 53 and add 12.
So the results the attacker has to input are: 65, 118 and 224. 
Not all the results have to be correct for breaking the safe, but all of them are needed to break the safe consistency.

### Limitations
Because we are using 8-bit registers, the maximum value they can hold is 256.
Due to this small limit, the maximum number to input to the problem is 26.
*If you want to contribute and implement a larger maximum value, you are more than welcome.
