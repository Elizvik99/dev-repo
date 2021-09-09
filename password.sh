
#!/bin/bash

# print pass in red and exit  code 1
function quitWrong {
               #cho $1             
               echo -e "\e[1;31m$1\e[0m"
               exit 1
           }


# print pass in gree and exit  code 0
function PrintPass {
               echo -e "\e[1;32m$1\e[0m"
               exit 0
           }

pass="$1"
exitcode=0

#check -f option for "-f" flag
while getopts f: option
do 
    case "${option}"
        in
        f)file=${OPTARG};;
    esac
done

#if "file" param is not empty - read pasword from file.
#else take it from command line arg

if [ -z "$file" ] 
then
      pass="$1"
else
   filename="$2"
   while read -r line; do
      pass="$line"
   done < "$filename"
fi

#validate pass contains both letters and digits 
if [[ $pass= =~ [[:alpha:]] && $pass =~ [[:digit:]] ]]; then
   exitcode=0
else echo "password should contains both digit and letter"
      quitWrong $pass
fi

#validate password contains upper case letters
if [[ $pass =~ [A-Z] ]]
then
   exitcode=0
else echo "password should contains Upper case letters"
   quitWrong $pass
fi

#validate password length
check=${#pass}
if [ $check -le 9 ];
then echo "error - password length is less then 10" ;
    quitWrong $pass
else PrintPass $pass
   fi

