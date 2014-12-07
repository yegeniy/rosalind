rm xa*
split -p '^>' ~/Downloads/rosalind_grph.txt

for i in $(ls x*); do
    sl=$(head -n 1 $i | cut -c 2-)
    s=$(tail -n +2 $i | paste -s -d \0 -)
    # TODO: Might speed it up by saving just the suffix and prefix to a file
    # Would need to also do a check for s != t, but at least could 
    # avoid processing O(n^2)-ish times. 2*n I guess?
    # Only need to do a check that s!=t if suffix == prefix
    # echo -e `head -n 1 $i`"\n"`tail -n +2 $i | paste -s -d \0 - | rev | cut -c 1-3 | rev`
    # echo "$sl($i)": $s
    for j in $(ls x*); do
        tl=$(head -n 1 $j | cut -c 2-)
        t=$(tail -n +2 $j | paste -s -d \0 -)
        # echo suffix of s: $(echo $s | rev | cut -c 1-3 | rev)
        # echo prefix of t: $(echo $t | cut -c 1-3)
        if [[ $s != $t && \
            `echo $s | rev | cut -c 1-3 | rev` = `echo $t | cut -c 1-3` ]]; then
            echo $sl $tl
        fi
    done
done
