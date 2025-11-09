### Introduction:

Cricket, often dubbed as a religion in some parts of the world, has evolved beyond being just a sport into a global phenomenon. Within this vast cricketing landscape, the Indian Premier League (IPL) stands out as a unique spectacle, blending athleticism, entertainment, and high-stakes competition. In this blog, we embark on a journey of Exploratory Data Analysis (EDA) on the IPL dataset to uncover insights, patterns, and stories hidden within the numbers. 
 
We,re thrilled to share the successful completion of a comprehensive data analytics project where we leveraged Power BI and MySQL to analyze and visualize cricket data. The project involved working with twenty CSV files: Batting_summary, Bowling_summary, Match_summary, and Players. Here, we’ll delve into the process and share some key insights derived from the data.
  
### Understanding the IPL Dataset:

The IPL dataset contains lots of information about different seasons, teams, players, matches, and venues. It’s like a big treasure chest waiting to be explored. With Exploratory Data Analysis (EDA), we want to dig into this data to create 5 Teams  learn more about the Data and make Analysis.

Problem-Statement - Dream 11 wants to launch a Dream Cricket League in India. This is a league for players who have played in the IPL season 9 or earlier. In this league, there will be 5 teams and each team consists of 5 batsmen, 5 bowlers, and 1 wicketkeeper. 

Here we have 20 tables of ball-by-ball data of all the IPL cricket matches till season 9 till 2016. 
Tables - 
ball_by_ball
Batsman_Scored
Batting_style
Bowling_style
city
country
extra_runs
extra_type
match
out_type
outcome
player
player_match
role
season
team
toss_decision
venue
wicket_taken
win_by

In order to create 5 New Teams according to the requirement, we added some more filtered Data in the form of tables below.
Tables -
Highest wicket takers
most four
most sixes
team1
team2
team3
team4
top25_batters
top5_wicket-keepers

Our job as a Data Analyst was to create the five teams based on the data. Each team consists of equal potential players.

### Project Workflow -

A. Data Import and Cleaning :
We imported the CSV files into Excel to understand the data structure and perform initial cleaning.
Used Pandas to handle missing values, correct data types, and perform basic transformations.

B. Data Transformation and Aggregation :
We loaded the cleaned data into a SQL database :
Used SQL queries to transform and aggregate data, generating key metrics and insights.

C. Data Visualization :
We imported the aggregated data from MySQL into Power BI.
Created interactive dashboards and visualizations to present the insights effectively.

SQL -
SQL (Structured Query Language) is a standard language for managing and manipulating relational databases. It allows for efficient querying, updating, and management of data. We worked on MySQL Workbench.

Key features include:

Data Retrieval: Write queries to fetch data from one or more tables.

Power BI- 

Power BI is a powerful business analytics tool by Microsoft which allows users to visualize data and share insights across their organizations or embed them in apps or websites. It offers a variety of features that make it an essential tool for data analysis and visualization.

- Data Connectivity: Connects to a wide range of data sources, including Excel, SQL Server, cloud services, and more.
- Data Transformation: Power Query allows users to clean, transform, and prepare data for analysis.
- Interactive Dashboards: Create visually rich, interactive dashboards that can be customized with various charts and graphs.

Data Modeling: Define relationships between different data tables and create complex calculations using DAX (Data Analysis Expressions).


“Exploring the IPL Dataset: Univariate and Bivariate Analysis Insights”

The Exploratory Data Analysis (EDA) on the IPL dataset, delving into both univariate and bivariate analysis. In the univariate analysis, we examined individual variables within the dataset, uncovering insights into each feature’s distribution, central tendency, and dispersion. This process allowed us to understand the characteristics and patterns of each variable in isolation. Moving on to bivariate analysis, we explored the relationships between pairs of variables, seeking correlations and dependencies. By visualizing these relationships, we gained deeper insights into how different aspects of the IPL dataset interact with each other, paving the way for more comprehensive analysis and informed decision-making.

Five Teams creation -

We analysed and filtered top 35 Batsman, top 30 Bowlers and top 5 wicket Keepers and distributed among 5 Teams consists of equal potential players.

Player Statistics

We’ve developed a simple function using the Dream Cricket Leage (DCL) dataset that retrieves all the basic information about an DCL player. This function allows users to input the player’s name and receive essential details such as their team, batting and bowling averages, strike rates, and other relevant stats. It’s a convenient tool for quickly accessing key information about any DCL player from the dataset.

Team-Wise-Analysis

In the “Team-Wise Analysis” section, users can explore IPL team performance through two tabs: “Analysis 1” and “Analysis 2.” These tabs offer distinct insights into various metrics and trends, enabling users to gain a comprehensive understanding of team dynamics.

1. Total Runs by Dream Cricket Leage (DCL) Teams
In the “Team-Wise Analysis” section, this visualization provides a clear comparison of each team’s performance in terms of total runs scored.

2. Total Matches win by the Teams
A pie chart depicts total match wins by DCL teams. The visualization provides a succinct overview of each team’s share of match victories.

3. Type of Dismissals in Dream Cricket Leage (DCL)
In the pie chart illustrating the percentage of types of dismissals in the IPL. Dismissals such as catch out, run out, lbw, and stumped collectively make up the remaining portion. This visualization provides a clear overview of the distribution of dismissals in IPL cricket, highlighting the prevalence of catch outs as the most common mode of dismissal.

Players-Wise-Analysis

Discover deeper insights within the “Player-Wise Analysis” section through two specialized tabs: “Analysis 1” and “Analysis 2.” These tabs offer tailored avenues for users to explore diverse dimensions of player performance, statistics, and trends within the IPL dataset. Whether examining batting averages, bowling figures, or player contributions across seasons, each tab provides a focused platform to analyze and interpret player-centric data effectively.

Orange Cap Holders
The analysis of Orange Cap holders, showcasing the batsman’s name alongside the corresponding year and their respective runs. This analysis provides a clear overview of the batsmen who have held the Orange Cap in various IPL seasons, along with their respective run contributions.

Purple Cap Holders
Below is the analysis of Purple Cap holders, showcasing the bowler’s name alongside the corresponding year and their respective wickets. This analysis provides a clear overview of the bowlers who have held the Purple Cap in various IPL seasons, along with their respective wicket hauls.

With some additional graphs of “Analysis 1” and “Analysis 2" Tabs:

Most 6s by a Batsman in a Dream Cricket Leage Dataset

Total Matches played by each team

Total teams participating over the years

Top 35 Batsman by Runs

Top 30 Bowlers by Wickets_Taken

Top 5 Wicket-Keepers by Stumping, Player_Skills

Most Finals played by the teams

Win Toss-Win Match Analysis

Other observations:

- Most Finals played by the Teams
- Number of Matches hosted in different cities
- Win percentage as batting team and bowling team
- Matches played vs Matches Won by the teams
- Win Margin of teams Won by runs and by Wickets
- Batsman Runs and Strike rate in Death Overs
- Bowling Average of Bowlers (top 10)
- Batting Average of Batsmen (top 10)
- Most 100s by a Batsman
- Most Catches By a Player
- Top 10 Wickets Takers in IPL
- Maximum Balls faced by a Batsman
- Most 50s by a Batsman (2008–2022).
- Most 4s by a Batsman
- 5 Wicket Bowlers
- Most 3s by a Batsman
- Most Dot balls by a Batsman
- Top 10 Highest Scorers in IPL
- All Teams Sixes per over
- Batsman runs vs Strike Rate


### Project Deployment -

Key factore we focused for our project Deployement :
Project deployment involves the process of moving a project from development to a live environment where it can be used by end users. Here are some of the key steps and considerations for deploying our project:

1. *Preparation:*
   - *Code Review:* Ensure all code has been reviewed and tested.
   - *Documentation:* Prepare comprehensive documentation, including installation instructions, user guides, and API documentation.

2. *Environment Setup:*
   - *Servers:* Choose the appropriate servers and set them up.
   - *Database:* Set up the production database and migrate data if necessary.
   - *Dependencies:* Install all necessary dependencies and libraries.

3. *Version Control:*
   - Use version control systems (e.g., Git) to manage code changes and ensure that the correct version of the code is being deployed.

4. *Deployment:*
   - *Automated Deployment Tools:* Use tools like GitHub Actions to automate the deployment process.
   - *Manual Deployment:* If necessary, manually transfer files to the server and configure the environment.

5. *Configuration Management:*
   - Manage configuration settings using tools like Ansible, Chef, or Puppet.
   - Ensure that environment-specific configurations (e.g., API keys, database URLs) are correctly set.

6. *Testing:*
   - Perform thorough testing in a staging environment that mirrors the production environment.
   - Conduct final acceptance testing to ensure everything works as expected.

We have successfully deployed the IPL data analysis project using GitHub and Streamlit Cloud. The deployment made the project accessible online, allowing users to interact with the data analysis and visualizations in real time. We pushed the project code to a repository using GitHub for version control and collaboration. Streamlit Cloud provided a seamless platform for hosting and running the project, enabling easy access to the IPL data analysis web application. This deployment marks the culmination of extensive effort and signifies the project’s transition from development to a publicly accessible resource for IPL enthusiasts.
