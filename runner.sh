for f in *
do
    cat $f | pbcopy
    echo $f
    f_name=$(echo -n $f | cut -d "." -f1)
    f_ext=$(echo -n $f | cut -d "." -f2)
    if [[ $f_ext == "c" ]]
    then
        clang -w $f_name.c -o $f_name.obj 
        ./$f_name.obj
    elif [[ $f_ext == "cpp" ]]
    then
        g++ -Wall -Wextra -Wpedantic -w -std=c++11 -o $fname.obj $f
        ./$fname.obj
    fi

    echo -n "NEXT (y/n): "
    read next

    if [[ $next == "y" ]]
    then
        continue
    elif [[ $next == "n" ]]
    then
        exit
    fi
done