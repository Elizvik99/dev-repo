
#!/bin/bash


function quitWrong {
               #cho $1             
               echo -e "\e[1;31m$1\e[0m"
               exit 1
           }

function PrintPass {
               echo -e "\e[1;32m$1\e[0m"
               exit 0
           }

pass="$1"
exitcode=0

if [[ $pass= =~ [[:alpha:]] && $pass =~ [[:digit:]] ]]; then
   exitcode=0
else echo "password should contains both digit and letter"
      quitWrong $pass
fi

if [[ "$pass" =~ ^[A-Z] ]]
then
   exitcode=0
else echo "password should contains Upper case letters"
   quitWrong $pass
fi

check=${#pass}
    #cho $check
if [ $check -le 9 ];
then echo "error - password length is less then 10" ;
    quitWrong $pass
else PrintPass $pass
   fi

