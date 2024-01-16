# SpotifyPortfolioProject
Data Cleaning. Exploration, and Visualization using a dataset from Kaggle.
Project Summary:
Questions asked and answered: 
1.	What was the most streamed song in 2023?
a.	The most streamed song was Circles by Post Malone.
2.	Who was the most streamed music artist in 2023? 
a.	The most streamed music artist ended up being Taylor Swift, which is no surprise.
3.	What was the most streamed song that came out in 2023?
a.	The most streamed song ended up being Ella Baila Sola by Eslabon Amrodo and Peso Pluma
4.	Did Jimi Hendrix make it on the most streamed list?
a.	He sadly did not make it onto the list, I will have to try harder this year. 
Conclusion: 
It was really fun exploring this data set, though it was a bit tough at first. I had to clean it using excel instead of SQL like I planned, which was not much of an issue since there are only one thousand rows. I had to research a bunch of Spanish/Brazilian music because the encoding in Excel added weird characters to their names like “¿Â½t” instead of the Spanish/Portuguese letters in the songs. It was cool seeing Latin American music come up in the spreadsheet though. I am a little disappointed with how the dashboard came out, but I will try visualizing data with a more complex data set next project. This data set was quite simple. So, in this project I cleaned and manipulated the data with Microsoft Excel, explored it with MySQL, and visualized it with Tableau Public. I will include everything I can regarding this project in the GitHub portfolio page. If you’re an employer and you enjoyed what you saw please contact me at my LinkedIn https://www.linkedin.com/in/conolyma/ , I look forward to hearing from you!

Project Intro:
I have been a huge fan of music ever since I was a kid, and ever since 2023 I have been cultivating a passion for data and data analytics. So now I am trying to build a portfolio to pursue my career in Data Analytics, I happened to stumble upon this data set of the most streamed songs in 2023 on Spotify by Nidula Elgiriyewithan on Kaggle. It is perfect for me as a fan of any musical. I want to use this data set in my first portfolio project where I explore it, clean it, and visualize it to help me answer questions I have over the data presented in the data set. If you are reading this, thank you, and please enjoy this journey I am about to embark on. 

Project Objective: 
In this project I want to answer questions I have over the data, such as:
5.	What was the most streamed song in 2023?
6.	Who was the most streamed music artist in 2023? 
7.	What was the most streamed song that came out in 2023?
8.	Did Jimi Hendrix make it on the most streamed list?
These are the three questions I want to answer using this data set. Yes, I am a fan of Jimi Hendrix. The tools I am planning to use to answer these questions are MySQL for data exploring and cleaning, and Tableau Public for visualization. I also plan to use ChatGPT for help if I get stuck because AI is revolutionizing the Data Analytics scene and I want to learn how to use it. 

Questions to answer:
1.	What was the most streamed song in 2023?
2.	Who was the most streamed music artist in 2023? 
3.	What was the most streamed song that came out in 2023?
4.	Did Jimi Hendrix make it on the most streamed list?

Hypothesis: 
1.	Knowing what I know about the music industry in 2023, my bet is either Hip-Hop, or Pop. 
2.	My best guess is going to be Taylor Swift. 
3.	I am hoping it is Cupid by Fifty Fifty. 
4.	I am going to guess that Jimi Hendrix did make it on the list. 

Data Exploration & Cleaning Diary: 
1/14/24:
11:00 AM: No problems importing the data in SQL, have not done any cleaning, or exploring just yet.
11:25 AM. encountered an error while exploring where the track name column was spelled ï»¿track_name somehow when importing the csv file into sql. Chat GPT helped me rename the column to track_name, did the same to the author(s)_name column and changed it to author_names so I would not have to keep accounting for the special characters when running queries. 
3: 54PM: I found a massive issue, there were weird characters like “Â¿Â½t” in some of the track names and artists columns. I asked Chat GPT about it and it said that there was an error during the encoding process. I tried fixing it in the suggested ways in order to avoid having to fix it all manually but sadly I had to fix it all manually. The data is less than a thousand entries long, so I figured instead of dropping this project I will just fix it anyway and it took a while. Now I am going to change the plan. Since the data is not that big, I figured I would clean it in excel and then do the data exploration in SQL, and in SQL I will set things up for visualization. 
4:02PM: Made backups of the data with the Characters fixed out, seems to be an error caused when adding Spanish letters in songs. 
4:05PM: Checked for duplicates, found none. 
:17PM: Combined the Released_Year, released_Month, and Released_Day into a single Released_Year column in Excel.
4:41PM: Made a backup of the data so far, I realized that the columns from BPM onwards have nothing to do with answering the questions I want answered. So, I will be deleting those from the excel file to streamline the data analysis process. 

11/15/2024:
11:18am: I spent the day cleaning the data in excel yesterday, had an issue where the cleaned data sheet would not import to SQL as a table, and managed to fix it by saving it as a regular csv, non UTF-8. Also had an issue where the data from the excel file would not import, I managed to fix it by not messing with the data types during the import wizard process. 
4:45pm: Forgot to keep a log of what I did, had a little too much fun exploring when the data finally was clean and imported. Managed to find the answers to my questions. The most streamed song was Circles by Post Malone, the most streamed artist was Taylor Swift, and the most streamed song published in 2023 was Ella Baila Sola by Eslabon Amrodo and Peso Pluma, released on 3/16/2023. Also, sadly Jimi Hendrix did not make it on the most streamed songs list of 2023. I also made 4-5 tables for visualization in tableau. 

11/16/2024:
11:37am: Turned four tables I made for visualizations into xlsx files and imported them into Tableau. I decided to leave one of the five tables out since it was redundant, I also decided to focus on making a top ten dashboard because I like that idea.
1:24pm: Did not have problems visualizing the data despite the dashboard looking simply. Learned today that by making a TOP 10 dashboard covering the top ten songs streamed, songs streamed released in 2023, top ten artists streamed, and the number of times artists. 

Credits: 
Dataset used found in : https://www.kaggle.com/datasets/nelgiriyewithana/top-spotify-songs-2023
