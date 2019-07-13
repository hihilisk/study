ar1 = [3, 2, 'a', :sym]

# BEGIN (write your solution here)
ar1 << 10
# END

assert { ar1.last == 10 }

ar2 = [3, 2, 'a', :sym]
ar3 = [:sym, 2, 'b']

# BEGIN (write your solution here)
ar4 = ar2 & ar3
# END

assert { ar4 == [2, :sym] }

ar5 = [3, 2, 'a', :sym, 10, 11]

# BEGIN (write your solution here)
ar6 = ar5[2..4]
# END

assert { ar6 == ['a', :sym, 10] }