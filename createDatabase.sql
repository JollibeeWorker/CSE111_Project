CREATE TABLE Users (
  u_user_id INT PRIMARY KEY,
  u_username VARCHAR(255) NOT NULL,
  u_password VARCHAR(255) NOT NULL,
  u_elo INT,
  u_countryname VARCHAR(255)
);

CREATE TABLE Equipment (
  e_equipment_id INT PRIMARY KEY,
  e_user_id INT,
  e_name VARCHAR(255),
  e_spin INT,
  e_bounce INT,
  FOREIGN KEY (e_user_id) REFERENCES Users(u_user_id)
);

CREATE TABLE Match (
  m_match_id INT PRIMARY KEY,
  m_tournament_id INT,
  m_date TIMESTAMP,
  m_player1_id INT,
  m_player2_id INT,
  m_player1_score INT,
  m_player2_score INT,
  m_elo_change INT,
  FOREIGN KEY (m_tournament_id) REFERENCES Tournament(t_tournament_id),
  FOREIGN KEY (m_player1_id) REFERENCES Users(u_user_id),
  FOREIGN KEY (m_player2_id) REFERENCES Users(u_user_id)
);

CREATE TABLE Tournament (
  t_tournament_id INT PRIMARY KEY,
  t_name VARCHAR(255),
  t_date TIMESTAMP,
  t_prize_pool INT
);

CREATE TABLE Team (
  t_team_id INT PRIMARY KEY,
  t_name VARCHAR(255),
  t_date TIMESTAMP
);

CREATE TABLE Participation (
  p_user_id INT,
  p_tournament_id INT,
  p_position INT,
  p_prize_won INT,
  PRIMARY KEY (p_user_id, p_tournament_id),
  FOREIGN KEY (p_user_id) REFERENCES Users(u_user_id),
  FOREIGN KEY (p_tournament_id) REFERENCES Tournament(t_tournament_id)
);

CREATE TABLE TeamMembership (
  tm_user_id INT,
  tm_team_id INT,
  tm_date TIMESTAMP,
  tm_role VARCHAR(255),
  PRIMARY KEY (tm_user_id, tm_team_id),
  FOREIGN KEY (tm_user_id) REFERENCES Users(u_user_id),
  FOREIGN KEY (tm_team_id) REFERENCES Team(t_team_id)
);