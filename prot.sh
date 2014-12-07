rna=$1
translate=false

for (( i=0; i<${#rna}; )); do
    case ${rna:i:3} in
        UUU | UUC )
            aa=F
            ;;
        CUU | CUC | UUA | CUA | UUG | CUG )
            aa=L
            ;;
        AUU | AUC | AUA )
            aa=I
            ;;
        GUU | GUC | GUA | GUG )
            aa=V
            ;;
        AUG )
            aa=M
            translate=true
            ;;
        UCU | UCC | UCA | UCG | AGU | AGC )
            aa=S
            ;;
        CCU | CCC | CCA | CCG )
            aa=P
            ;;
        ACU | ACC | ACA | ACG )
            aa=T
            ;;
        GCU | GCC | GCA | GCG )
            aa=A
            ;;
        UAU | UAC )
            aa=Y
            ;;
        CAU | CAC )
            aa=H
            ;;
        AAU | AAC )
            aa=N
            ;;
        GAU | GAC )
            aa=D
            ;;
        UAA | UAG | UGA )
            unset aa;
            translate=false;
           ;;
        CAA | CAG )
            aa=Q
            ;;
        AAA | AAG )
            aa=K
            ;;
        GAA | GAG )
            aa=E
            ;;
        UGU | UGC )
            aa=C
            ;;
        CGU | CGC | CGA | AGA | CGG | AGG )
            aa=R
            ;;
        GGU | GGC | GGA | GGG )
            aa=G
            ;;
        UGG )
            aa=W
            ;;
    esac
    # echo ${rna:i:3} = $aa $translate
    if [[ $translate = true || -z $aa ]]; then
        echo -n $aa
        i=$(( $i + 3 ))
    else
        i=$(( $i + 1 ))
    fi
done
echo
