INSERT INTO Users (u_user_id, u_username, u_password, u_elo, u_countryname) VALUES
(1, 'PlayerOne', 'password123', 1500, 'USA'),
(2, 'PlayerTwo', 'password234', 1420, 'Canada'),
(3, 'PlayerThree', 'password345', 1350, 'UK'),
(4, 'PlayerFour', 'password456', 1600, 'USA');

INSERT INTO Equipment (e_equipment_id, e_user_id, e_name, e_spin, e_bounce) VALUES
(1, 1, 'Carbon Paddle', 8, 9),
(2, 2, 'Allround Paddle', 5, 6),
(3, 3, 'Offensive Paddle', 9, 7),
(4, 1, 'Defensive Paddle', 3, 8);

INSERT INTO Match (m_match_id, m_tournament_id, m_date, m_player1_id, m_player2_id, m_player1_score, m_player2_score, m_elo_change) VALUES
(1, 1, '2023-11-08 10:00:00', 1, 2, 11, 7, 10),
(2, 1, '2023-11-08 11:00:00', 3, 4, 5, 11, 15);

INSERT INTO Tournament (t_tournament_id, t_name, t_date, t_prize_pool) VALUES
(1, 'VR Ping Pong Open', '2023-12-15 09:00:00', 1000),
(2, 'National VR Championship', '2024-01-20 09:00:00', 2000);

INSERT INTO Team (t_team_id, t_name, t_date) VALUES
(1, 'Paddle Masters', '2021-07-10'),
(2, 'VR Smashers', '2021-08-15');

INSERT INTO Participation (p_user_id, p_tournament_id, p_position, p_prize_won) VALUES
(1, 1, 1, 500),
(2, 1, 2, 300),
(3, 2, 3, 200);

INSERT INTO TeamMembership (tm_user_id, tm_team_id, tm_date, tm_role) VALUES
(1, 1, '2023-05-01', 'Player'),
(2, 1, '2023-05-01', 'Player'),
(3, 2, '2023-06-01', 'Captain');