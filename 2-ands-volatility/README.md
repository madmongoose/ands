ands-volatility

This script parse https://yandex.ru/news/quotes/graph_2000.json file and calculates volatility from March 2015 to March 2020.

Execution progress

1. Downloading json file ;
2. Parse .prices[] array and write text to file;
3. Change data format and write it to another file;
4. Retrieve amount values and write it to another file;
5. Concatinate two files with dates and amounts;
6. Start a loop and retrieve necessary information for each march from 2015;
7. Create associative array for holding volatility data for each year;
8. Declare function for calculating volatility;
9. Start new loop and execute function for each year, save data to volatility array;
10. Retrieve data from array in two colums and write it ro result file;
11. Sort array from min to max and display the first row;
12. Result is 2018 0.865.
