cd .. && make && cd -
for num in {1..2}; do
    rm -f tmp.out
    echo run test "$num"
    ../a.out ./test"$num".in 1>./tmp.out 2>./tmp.out
    cmp tmp.out ./test"$num".out
done