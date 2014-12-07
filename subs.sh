s=$1;shift;
t=$1;shift;

ls=${#s}
lt=${#t}
for (( i=0; i<=$(( $ls - $lt )); i++ )); do
    if [[ ${s:i:lt} = $t ]]; then
        echo -n "$(( i + 1 )) "
    fi
done
echo
