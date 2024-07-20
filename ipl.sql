use ipl;

SELECT * FROM match_;
SELECT * FROM win_by;

SELECT 
    Match_ID,
    Match_Winner,
    CASE 
        WHEN W.Win_Type = 'runs' THEN M.Win_Margin
        WHEN W.Win_Type = 'wickets' THEN M.Win_Margin
        ELSE NULL
    END AS WinMargin
FROM 
    win_by W
JOIN match_ M
ON W.Win_Id = M.Win_Type
WHERE 
    W.Win_Type IN ('Runs', 'Wickets');


SELECT * FROM season;
SELECT * FROM batsman_scored;

SELECT Season_Year , 
    SUM(Runs_Scored) / SUM(Over_Id) AS AverageRunRate
FROM 
    batsman_scored B
JOIN match_ M
ON B.Match_Id = M.Match_Id
JOIN season S
ON M.Season_Id = S.Season_Id
GROUP BY 
    Season_Year
ORDER BY 
    Season_Year;

SELECT * FROM win_by;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;

SELECT 
    Win_Type,
    COUNT(*) AS DismissalCount
FROM 
    win_by

GROUP BY 
    Win_Type
ORDER BY 
    DismissalCount DESC;

SELECT * FROM win_by;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;

SELECT 
    Player_Name,
    Season_Year,
    AVG(Runs_Scored) AS AverageRuns
FROM 
    player P
JOIN player_match PM
ON P.Player_Id = PM.Player_Id
JOIN match_ M
ON PM.Match_Id = M.Match_Id
JOIN season S
ON S.Season_Id = M.Season_Id
JOIN batsman_scored BS
ON BS.Match_Id = M.Match_Id

GROUP BY 
    Player_Name,
    Season_Year
ORDER BY 
    Player_Name,
    Season_Year;

SELECT * FROM batsman_scored;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;


SELECT 
    Venue_Name,
    AVG(Runs_Scored) AS AverageRuns
FROM 
    venue V
JOIN match_ M
ON M.Venue_Id = V.Venue_Id
JOIN batsman_scored B
ON  M.Match_Id = B.Match_Id
GROUP BY 
    Venue_Name
ORDER BY 
    AverageRuns DESC;


SELECT * FROM batsman_scored;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;


SELECT 
    W.Over_Id,
    COUNT(DISTINCT M.Match_Id) AS TotalOvers,
    SUM(Runs_Scored) AS TotalRuns,
    AVG(Runs_Scored) AS AverageRunsPerOver
FROM 
    wicket_taken W
JOIN match_ M
ON W.Match_Id = M.Match_Id
JOIN batsman_scored BS
ON BS.Match_Id =M.Match_Id

GROUP BY 
    W.Over_Id
ORDER BY 
    W.Over_Id;


SELECT * FROM ball_by_ball;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;

SELECT 
    Bowling_skill,
    COUNT(DISTINCT BowlerName) AS NumberOfBowlers,
    SUM(RunsConceded) AS TotalRunsConceded,
    SUM(WicketsTaken) AS TotalWicketsTaken,
    SUM(OversBowled) AS TotalOversBowled,
    (SUM(RunsConceded) / SUM(OversBowled)) AS EconomyRate,
    (SUM(WicketsTaken) / SUM(OversBowled)) AS StrikeRate
FROM 
    bowling_style
GROUP BY 
    Bowling_skill;

SELECT BS.Bowling_skill , SUM(ER.Extra_Runs) AS EXTRARUN , SUM(BS.Runs_Scored)
FROM bowling_style BS
JOIN extra_runs ER
ON BS.Bowling_Id = ER.Ball_Id
JOIN batsman_scored BS
ON BS.Ball_Id  = ER.Ball_Id
;


SELECT  Match_Id , Innings_No , SUM(Runs_Scored) AS TOTAL_RUN
FROM batsman_scored
GROUP BY  Match_Id , Innings_No
ORDER BY TOTAL_RUN DESC;

SELECT * FROM ball_by_ball;
SELECT * FROM player;
SELECT * FROM player_match;
SELECT * FROM match_;


SELECT 
    Team_1 AS Team,
    Team_2 AS Opponent,
    COUNT(*) AS MatchesPlayed,
    SUM(CASE WHEN Match_Winner = Team_1 THEN 1 ELSE 0 END) AS WinsForTeam,
    SUM(CASE WHEN Match_Winner = Team_2 THEN 1 ELSE 0 END) AS WinsForOpponent
FROM 
    match_
GROUP BY 
    Team_1, Team_2

UNION ALL

SELECT 
    Team_2 AS Team,
    Team_1 AS Opponent,
    COUNT(*) AS MatchesPlayed,
    SUM(CASE WHEN Match_Winner = Team_2 THEN 1 ELSE 0 END) AS WinsForTeam,
    SUM(CASE WHEN Match_Winner = Team_1 THEN 1 ELSE 0 END) AS WinsForOpponent
FROM 
    match_
GROUP BY 
    Team_2, Team_1;




SELECT 
    Country_Name AS COUNTRY_CODE,
    COUNT(Player_Id) AS NumberOfPlayers
FROM 
    player P
GROUP BY 
    Country_Name
ORDER BY 
    NumberOfPlayers DESC;
    
    
    
SELECT 
    Batting_hand,
	Player_Name,
	Runs_Scored,
	Match_Id
FROM 
    (SELECT 
        P.Batting_hand,
        P.Player_Name,
        BS.Runs_Scored,
        M.Match_Id,
        ROW_NUMBER() OVER (PARTITION BY P.Batting_hand ORDER BY BS.Runs_Scored DESC) AS rank_
     FROM 
        player P
	JOIN player_match PM
    ON P.Player_Id = PM.Player_Id
    JOIN match_ M
    ON M.Match_Id = PM.Match_Id
    JOIN batsman_scored BS
    ON M.Match_Id = BS.Match_Id
    
     ) ranked
WHERE 
    rank_ = 1
ORDER BY 
    Batting_hand;
    
    
    
 SELECT 
    P.Player_Name,
    T.Team_Name,
    SUM(BS.Runs_Scored) AS TotalRuns,
    SUM(Player_Out) AS TotalWickets
FROM 
    player P
JOIN player_match PM
ON P.Player_Id = PM.Player_Id
JOIN team T
ON T.Team_Id = PM.Team_Id
JOIN batsman_scored BS
ON PM.Match_Id = BS.Match_Id
JOIN wicket_taken W
ON W.Match_Id = PM.Match_Id
GROUP BY 
    P.Player_Name,
    T.Team_Name
ORDER BY 
    TotalRuns DESC;
   
  --  out_type
--    player_match
   
SELECT * FROM outcome;
    
    
    
    

WITH RankedMatches AS (
    SELECT 
        P.Player_Id,
        Player_Name,
        M.Match_Id,
        Match_Date,
        ROW_NUMBER() OVER (PARTITION BY Player_Id ORDER BY Match_Date) AS MatchNumber
    FROM 
        player P
	JOIN player_match PM
    ON P.Player_Id = PM.Player_Id
    JOIN match_ M
    ON PM.Match_Id = M.Match_Id
)
SELECT 
    Player_Id,
    Player_Name,
    Match_Id,
    Match_Date,
    MatchNumber
FROM 
    RankedMatches
WHERE 
    MatchNumber IN (50, 100)
ORDER BY 
    Player_Name, MatchNumber;




SELECT 
    TD.Toss_Name,
    COUNT(*) AS TotalMatches,
    SUM(CASE WHEN M.Match_Winner = Toss_Winner THEN 1 ELSE 0 END) AS WinsAfterWinningToss,
    SUM(CASE WHEN M.Match_Winner != Toss_Winner THEN 1 ELSE 0 END) AS LossesAfterWinningToss,
    SUM(CASE WHEN M.Match_Winner = Toss_Winner THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS WinPercentage
FROM 
    toss_decision TD
JOIN match_ M 
ON TD.Toss_Id = M.Toss_Decide
GROUP BY 
    TD.Toss_Name
ORDER BY 
    TD.Toss_Name;




SELECT 
    Venue_Name,
    City_Name,
    COUNT(*) AS TotalMatches,
    COUNT(DISTINCT Season_Year) AS SeasonsHosted,
    COUNT(DISTINCT Team_1) + COUNT(DISTINCT Team_2) AS TeamsPlayed,
    COUNT(DISTINCT Match_Winner) AS UniqueWinners
FROM 
    venue V
JOIN city C
ON V.City_Id = C.City_Id
JOIN match_ M 
ON M.Venue_Id = V.Venue_Id
JOIN season S
ON M.Season_Id = S.Season_Id
GROUP BY 
    Venue_Name,
    City_Name
ORDER BY 
    TotalMatches DESC;



SELECT 
    P.Player_Name,
    C.Country_Name,
    SUM(Runs_Scored) AS TotalRuns,
    SUM(Player_Out) AS TotalWickets,
    COUNT(M.Match_Id) AS MatchesPlayed
FROM 
    player P
JOIN country C
ON P.Country_Name = C.Country_Id
JOIN player_match PM
ON P.Player_Id = PM.Player_Id
JOIN match_ M
ON M.Match_Id = PM.Match_Id
JOIN batsman_scored BS
ON M.Match_Id = BS.Match_Id
JOIN wicket_taken WT
ON M.Match_Id = WT.Match_Id

WHERE 
    C.Country_Name != 'India'
GROUP BY 
    P.Player_Name,
    C.Country_Name
ORDER BY 
    TotalRuns DESC, TotalWickets DESC;




SELECT 
    M.Match_Id,
    WT.Innings_No,
    SUM(Runs_Scored) AS TotalRuns,
    COUNT(WT.Ball_Id) AS TotalBalls,
    ROUND(SUM(Runs_Scored) * 6.0 / COUNT(WT.Ball_Id), 2) AS PowerplayRunRate
FROM 
    match_ M
JOIN wicket_taken WT
ON M.Match_Id = WT.Match_Id
JOIN batsman_scored BS
ON M.Match_Id = BS.Match_Id
WHERE 
    WT.Over_Id BETWEEN 1 AND 6
GROUP BY 
    M.Match_Id,
    Innings_No
ORDER BY 
    M.Match_Id,
    Innings_No;




SELECT 
    M.Match_Id,
    WT.Innings_No,
    SUM(Runs_Scored) AS TotalRuns,
    COUNT(WT.Ball_Id) AS TotalBalls,
    ROUND(SUM(Runs_Scored) * 6.0 / COUNT(Runs_Scored), 2) AS DeathOverRunRate
FROM 
    match_ M
JOIN wicket_taken WT
ON M.Match_Id = WT.Match_Id
JOIN batsman_scored BS
ON M.Match_Id = BS.Match_Id
WHERE 
    WT.Over_Id BETWEEN 17 AND 20
GROUP BY 
    M.Match_Id,
    WT.Innings_No
ORDER BY 
    M.Match_Id,
    WT.Innings_No;
    
    
    
    
    SELECT 
    Season,
    Venue,
    COUNT(MatchID) AS TotalMatches,
    AVG(Attendance) AS AvgAttendance,
    MAX(Attendance) AS MaxAttendance,
    MIN(Attendance) AS MinAttendance
FROM 
    IPL_Matches
GROUP BY 
    Season, Venue
ORDER BY 
    Season, Venue;

    
    
    
    SELECT 
    Player_Name,
    Season_Year,
    Team_1 AS From_team,
    Team_2 AS To_team
FROM 
    player P
JOIN
	player_match PM ON P.Player_Id = PM.Player_Id
JOIN match_ M
	ON PM.Match_Id = M.Match_Id
JOIN season S
	ON S.Season_Id = M.Season_Id
	

ORDER BY 
    Season_Year, Player_Name;


select Player_Name, COUNT(b.Bowler)
from ball_by_ball b
join  player p
on p.Player_Id = b.Bowler
where p.Player_Id = b.Bowler
group by Player_Name

limit 25;


select Player_Name,  count(Role_Desc) AS Skill_Points from player p 
join player_match pm on p.Player_Id = pm.Player_Id 
join role r on r.role_id = pm.role_id 
where r.role_id = 2 or r.role_id = 4
group by Player_Name
order by Skill_Points desc limit 5;

    
    select * from (select pm.match_id, player_name, count(runs_scored) as total_sixes from batsman_scored bs join player_match pm on pm.match_id = bs.match_id join player p on p.Player_id=pm.Player_id where Runs_scored = 6 group by pm.match_id, player_name ) as A order  by total_sixes desc;

select * from (select pm.match_id, player_name, count(runs_scored) as total_four from batsman_scored bs 
join player_match pm on pm.match_id = bs.match_id 
join player p on p.Player_id=pm.Player_id 
where Runs_scored = 4 
group by pm.match_id, player_name ) as A
order by total_four desc;