split -p '^>' $1 cons_

for fasta in $(ls cons_*); do
  seq=`tail -n +2 $fasta | paste -s -d '\0' -`
  for (( i = 0; i < ${#seq}; i++ )); do
    profile_a[$i]=0
    profile_c[$i]=0
    profile_g[$i]=0
    profile_t[$i]=0
  done
  break
done
for fasta in $(ls cons_*); do
  seq=`tail -n +2 $fasta | paste -s -d '\0' -`
  for (( i = 0; i < ${#seq}; i++ )); do
    base=${seq:i:1}
    case $base in
      A )
        (( profile_a[$i]++ ))
      ;;
      C )
        (( profile_c[$i]++ ))
      ;;
      G )
        (( profile_g[$i]++ ))
      ;;
      T )
        (( profile_t[$i]++ ))
      ;;
    esac
  done
done

for (( i = 0; i < ${#profile_t[@]}; i++ )); do
  max=0
  if [[ ${profile_a[$i]} > $max ]]; then
    max=${profile_a[$i]}
    cons='A'
  fi
  if [[ ${profile_c[$i]} > $max ]]; then
    max=${profile_c[$i]}
    cons='C'
  fi
  if [[ ${profile_g[$i]} > $max ]]; then
    max=${profile_g[$i]}
    cons='G'
  fi
  if [[ ${profile_t[$i]} > $max ]]; then
    max=${profile_t[$i]}
    cons='T'
  fi
  echo -n $cons
done
echo
echo A: ${profile_a[*]}
echo C: ${profile_c[*]}
echo G: ${profile_g[*]}
echo T: ${profile_t[*]}
