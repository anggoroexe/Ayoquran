list=$(curl -s https://al-quran-8d642.firebaseio.com/data.json?print=pretty | jq -r '.[] | "\(.nomor) : \(.nama)"')
quran=$(curl -s https://al-quran-8d642.firebaseio.com/surat/${surah}.json?print=pretty | jq -r '.[] | "\(.tr) : \(.id)"' | sed -r 's/[\<][\/]?[a-zA-Z0-9\=\"\-\#\.\& ]+[\/]?[\>]//g')
rilldata=$(( $surah - 1 ))
judul=$(curl -s https://al-quran-8d642.firebaseio.com/data.json?print=pretty | jq -r '.['${rilldata}'] | "\(.nama)"')
ayat=$(curl -s https://al-quran-8d642.firebaseio.com/data.json?print=pretty | jq -r '.['${rilldata}'] | "\(.ayat)"')
banner=$(echo '''

╭━━━╮╱╱╱╱╱╱╭━━━╮
┃╭━╮┃╱╱╱╱╱╱┃╭━╮┃
┃┃╱┃┣╮╱╭┳━━┫┃╱┃┣╮╭┳━┳━━┳━╮
┃╰━╯┃┃╱┃┃╭╮┃┃╱┃┃┃┃┃╭┫╭╮┃╭╮╮
┃╭━╮┃╰━╯┃╰╯┃╰━╯┃╰╯┃┃┃╭╮┃┃┃┃
╰╯╱╰┻━╮╭┻━━┻━━╮┣━━┻╯╰╯╰┻╯╰╯
╱╱╱╱╭━╯┃╱╱╱╱╱╱╰╯  Ayo Baca Al Quran
╱╱╱╱╰━━╯

Menu :
1. List Surah 
2. Baca Surah
''')
echo "${banner}"
read -p "Pilih Menu :" pilihan
if [ $pilihan = "1" ]
then
echo "List Nomer Surah dan Nama Surah"
echo "${list}"
sleep 15s
echo "${banner}"
read -p "Pilih Menu :" pilihan
fi
if [ $pilihan = "2" ]
then
read -p "Pilih Nomer Surah :" surah 
echo "surah ${judul} jumlah ayat ${ayat}"
echo "${quran}"
fi
