#!/bin/bash

num=$1

case $num in
''|*[!0-9]*) echo $num "is NOT a NUMBER" ;;
*)
    case $(($num % 2)) in
    1 | -1) echo $num "is ODD" ;;
    0) echo $num "is EVEN" ;;
    esac;;
esac