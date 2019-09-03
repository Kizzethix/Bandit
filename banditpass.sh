#!/bin/sh
passlib="../bandit/passlib.txt"

# confirm connection to Bandit wargame
read -r -p "Connect to Bandit? (Y/N) " connect
case $connect in
 [yY][eE][sS]|[yY])
echo "Sweet "
 ;;
 [nN][oO]|[nN])
echo "Lame, c'ya nerd"; exit 1
  ;;
 *)
echo "I AM ERROR"; exit 1
 ;;
esac

# Confirm level number and find password from passlib
read -r -p  "Now which level? " level
passcode="$(($level *2 +3))"

echo "\n The password for level ${level} is:"; sed -n"${passcode}p" < $passlib; echo ""

# Connect to server
ssh -p 2220 bandit$level@bandit.labs.overthewire.org
