#!/usr/bin/env bash
echo hello bash
echo hello bash > stdout.txt
echo hello bash >> stdout.txt
echo hello bash > stdout.txt 
> stdout.txt 
bad_command
bad_command > stderr.txt
bad_command 2> stderr.txt
echo hello bash 1> stdout.txt 
read NAME
echo $NAME
echo $NAME 1> stdout.txt 
echo freeCodeCamp > name.txt
read NAME < name.txt 
echo $NAME
echo fcc | read NAME
echo $NAME 
cat
cat name.txt 
cat < name.txt
echo fcc | cat
touch script.sh
chmod +x script.sh 
echo '#!/bin/bash' > script.sh 
echo 'read NAME' >> script.sh 
echo 'echo Hello $NAME' >> script.sh 
echo 'bad_command' >> script.sh 
./script.sh 
echo fcc | ./script.sh 
echo fcc | ./script.sh 2> stderr.txt
echo fcc | ./script.sh 2> stderr.txt 1> stdout.txt 
./script.sh < name.txt 
./script.sh < name.txt 2> stderr.txt 1> stdout.txt 
./script.sh < name.txt 2> stderr.txt > stdout.txt 
cat kitty_ipsum_1.txt 
cat kitty_ipsum_2.txt 
wc kitty_ipsum_1.txt 
man wc
wc -l kitty_ipsum_1.txt 
wc -w kitty_ipsum_1.txt 
wc -m kitty_ipsum_1.txt 
wc kitty_ipsum_1.txt 
cat kitty_ipsum_1.txt | wc
wc < kitty_ipsum_1.txt 
echo "~~ kitty_ipsum_1.txt info ~~" > kitty_info.txt
echo -e "\nNumber of lines:" >> kitty_info.txt 
cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt 
echo -e "\nNumber of words:" >> kitty_info.txt 
cat kitty_ipsum_1.txt | wc -w >> kitty_info.txt 
echo -e "\nNumber of characters:" >> kitty_info.txt 
wc -m < kitty_ipsum_1.txt >> kitty_info.txt 
grep 'meow' kitty_ipsum_1.txt 
man grep
grep 'meow' --color kitty_ipsum_1.txt 
grep 'meow' --color -n kitty_ipsum_1.txt 
grep 'meow[a-z]*' --color -n kitty_ipsum_1.txt 
#!/bin/bash
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt 
grep 'meow[a-z]*' --color kitty_ipsum_1.txt 
grep 'meow[a-z]*' -c kitty_ipsum_1.txt 
man grep
grep 'meow[a-z]*' -o kitty_ipsum_1.txt 
grep 'meow[a-z]*' -o kitty_ipsum_1.txt | wc -l
grep 'meow[a-z]*' -o kitty_ipsum_1.txt | wc -l >> kitty_info.txt 
echo -e "\nLines that they appear on:" >> kitty_info.txt 
man grep
cat name.txt 
sed 's/r/2/' name.txt 
sed 's/free/f233/' name.txt 
sed 's/freecodecamp/f233C0d3C@mp/' name.txt 
sed 's/freecodecamp/f233C0d3C@mp/i' name.txt 
sed 's/freecodecamp/f233C0d3C@mp/i' < name.txt 
cat name.txt | sed 's/freecodecamp/f233C0d3C@mp/i'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]/1/'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed 's/[0-9]+/1/'
man sed
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+)/\1/'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt 
grep --color 'cat[a-z]*' kitty_ipsum_1.txt 
echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt 
grep -o 'cat[a-z]*' kitty_ipsum_1.txt 
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l
grep -o 'cat[a-z]*' kitty_ipsum_1.txt | wc -l >> kitty_info.txt 
echo -e "\nLines that they appear on:" >> kitty_info.txt 
grep -n 'cat[a-z]*' kitty_ipsum_1.txt 
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/'
grep -n 'cat[a-z]*' kitty_ipsum_1.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt 
echo -e "\n\n~~ kitty_ipsum_2.txt info ~~" >> kitty_info.txt 
echo -e "\nNumber of lines:" >> kitty_info.txt 
cat kitty_ipsum_2.txt | wc -l >> kitty_info.txt 
echo -e "\nNumber of words:" >> kitty_info.txt 
wc -w < kitty_ipsum_2.txt >> kitty_info.txt 
echo -e "\nNumber of characters:" >> kitty_info.txt 
wc -m < kitty_ipsum_2.txt >> kitty_info.txt 
grep --color 'meow[a-z]*' kitty_ipsum_2.txt 
echo -e "\nNumber of times meow or meowzer appears:" >> kitty_info.txt 
grep -o 'meow[a-z]*' kitty_ipsum_2.txt | wc -l >> kitty_info.txt 
echo -e "\nLines that they appear on:" >> kitty_info.txt 
grep -n 'meow[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt 
grep --color 'cat[a-z]*' kitty_ipsum_2.txt 
echo -e "\nNumber of times cat, cats, or catnip appears:" >> kitty_info.txt 
grep -o 'cat[a-z]*' kitty_ipsum_2.txt | wc -l >> kitty_info.txt
echo -e "\nLines that they appear on:" >> kitty_info.txt 
grep -n 'cat[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt 
touch translate.sh
chmod +x translate.sh 
echo '#!/bin/bash' >> translate.sh 
echo 'cat $1' >> translate.sh 
./translate.sh kitty_ipsum_1.txt 
./translate.sh < kitty_ipsum_1.txt 
cat kitty_ipsum_1.txt | ./translate.sh 
echo "cat \$1 | sed 's/catnip/dogchow/'" >> translate.sh 
./translate.sh kitty_ipsum_1.txt 
./translate.sh kitty_ipsum_1.txt | grep --color 'dogchow'
./translate.sh kitty_ipsum_1.txt | grep --color 'catnip'
echo '#!/bin/bash' > translate.sh 
echo "cat \$1 | sed 's/catnip/dogchow/; s/cat/dog/'" >> translate.sh 
./translate.sh kitty_ipsum_1.txt | grep --color 'dog[a-z]*'
./translate.sh kitty_ipsum_1.txt | grep --color 'cat[a-z]*'
echo "cat \$1 | sed 's/catnip/dogchow/; s/cat/dog/; s/meow/woof/'" >> translate.sh 
sed -i -e '2d' translate.sh 
./translate.sh kitty_ipsum_1.txt | grep --color 'dog[a-z]*|woof[a-z]*'
./translate.sh kitty_ipsum_1.txt | grep -E --color 'dog[a-z]*|woof[a-z]*'
echo "cat \$1 | sed 's/catnip/dogchow/g; s/cat/dog/g; s/meow/woof/g;'" >> translate.sh 
sed -i -e '2d' translate.sh 
./translate.sh kitty_ipsum_1.txt | grep -E --color 'dog[a-z]*|woof[a-z]*'
echo "cat \$1 | sed -E 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g'" >> translate.sh 
sed -i -e '2d' translate.sh 
./translate.sh kitty_ipsum_1.txt | grep -E --color 'dog[a-z]*|woof[a-z]*'
./translate.sh kitty_ipsum_1.txt | grep -E --color 'meow[a-z]*|cat[a-z]*'
./translate.sh kitty_ipsum_2.txt | grep -E --color 'meow[a-z]*|cat[a-z]*'
./translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
cat doggy_ipsum_1.txt 
diff kitty_ipsum_1.txt doggy_ipsum_1.txt 
man diff
diff --color kitty_ipsum_1.txt doggy_ipsum_1.txt 
./translate.sh kitty_ipsum_2.txt > doggy_ipsum_2.txt 
cat doggy_ipsum_2.txt 
diff --color kitty_ipsum_2.txt doggy_ipsum_2.txt 


