-- 1. Create new user
INSERT INTO Users (u_user_id, u_username, u_password, u_elo, u_countryname) VALUES
(5, 'NewPlayer', 'newpassword', 1200, 'France');

-- 2. Update user elo
UPDATE Users SET u_elo = 1550 WHERE u_user_id = 2;

-- 3. Remove user
DELETE FROM Users WHERE u_user_id = 5;

-- 4. Display all users whose elo is over 1400
SELECT * FROM Users WHERE u_elo > 1400;

-- 5. Display number of users per country
SELECT u_countryname, COUNT(*) as number_of_users FROM Users GROUP BY u_countryname;

-- 6. Create new match
INSERT INTO Match (m_match_id, m_tournament_id, m_date, m_player1_id, m_player2_id, m_player1_score, m_player2_score, m_elo_change) VALUES
(3, 2, '2023-11-09 10:00:00', 1, 3, 11, 9, 12);

-- 7. Modify match score
UPDATE Match SET m_player1_score = 10, m_player2_score = 12 WHERE m_match_id = 3;

-- 8. Remove match using match id
DELETE FROM Match WHERE m_match_id = 3;

-- 9. Display all matches in a tournament given the id
SELECT * FROM Match WHERE m_tournament_id = 1;

-- 10. Display top 3 users by elo
SELECT * FROM Users ORDER BY u_elo DESC LIMIT 3;

-- 11. Display all equipment from user
SELECT e_name FROM Equipment WHERE e_user_id = 1;

-- 12. Modify all equipment spin levels by 1
UPDATE Equipment SET e_spin = e_spin + 1;

-- 13. Remove equipment that has a spin level below 5
DELETE FROM Equipment WHERE e_spin < 5;

-- 14. Display all tournaments and their prize pools
SELECT t_name, t_prize_pool FROM Tournament;

-- 15. Create new team
INSERT INTO Team (t_team_id, t_name, t_date) VALUES
(3, 'VR Challengers', '2023-08-01');

-- 16. Modify team name given team id
UPDATE Team SET t_name = 'VR Legends' WHERE t_team_id = 3;

-- 17. Remove team with id of 3
DELETE FROM Team WHERE t_team_id = 3;

-- 18. Display all team memberships for a user
SELECT * FROM TeamMembership WHERE tm_user_id = 1;

-- 19. Create a new participation record
INSERT INTO Participation (p_user_id, p_tournament_id, p_position, p_prize_won) VALUES
(4, 2, 4, 100);

-- 20. Modify the prize won by a user in a tournament
UPDATE Participation SET p_prize_won = 600 WHERE p_user_id = 1 AND p_tournament_id = 1;

-- 21. Remove a participation record
DELETE FROM Participation WHERE p_user_id = 4 AND p_tournament_id = 2;

-- 22. Display all users and their participation in tournaments
SELECT u_username, t_name, p_position
FROM Users
JOIN Participation ON Users.u_user_id = Participation.p_user_id
JOIN Tournament ON Participation.p_tournament_id = Tournament.t_tournament_id;

-- 23. Display the average ELO of all users
SELECT AVG(u_elo) AS average_elo FROM Users;

-- 24. Transfer equipment from one user to another
BEGIN TRANSACTION;
UPDATE Equipment SET e_user_id = 2 WHERE e_equipment_id = 1 AND e_user_id = 1;
COMMIT;
