#test
curl -s https://yandex.ru/news/quotes/graph_2000.json > ./quotes.json
jq -r '.prices[] | "\(.[0])\t\(.[1])"' quotes.json > jsonValue.txt
cut -c 1-10 jsonValue.txt | jq 'todate' | cut -c 2-11 > dates.txt
cut -c 15-20 jsonValue.txt > amounts.txt
paste -d"\ n"   dates.txt  amounts.txt| awk '{ print $1,$2}' > parseData.txt

for ((i=2015; i < 2021; i++))
do
  sed -n '/'"$i"'-03/p' parseData.txt > $i.txt
  done

declare -A volatility

volatilityCalculation(){
  file=$1
  year=$(basename "$file" | cut -d. -f1)

  lines=$(wc -l < $file)
  mean=$(cut -c 12-16 $file | awk -v mean=0 -v days="${lines}" '{mean+=$1} END {print mean/days}')
  min=$(cut -c 12-16  $file | awk 'min=="" || $1 < min {min=$1} END {print min}')
  max=$(cut -c 12-16  $file | awk -v max=0 '$1>max  {max=$1} END {print max}')

  value=$(echo "$mean $min $max" | awk '{print (($1 - $2) + ($3 - $1))/2}')

  volatility[$year]=$value
}
for ((i=2015; i < 2021; i++))
do
  volatilityCalculation $i.txt
  done

for key in ${!volatility[@]};
 do
    echo ${key} ${volatility[${key}]}
done > result.txt

sort -nk2 result.txt | head -1
