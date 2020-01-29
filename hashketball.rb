require "pry" 
require "pp"
#binding.pry stops execution at that point

def game_hash
  game_hash = {
    :home => {
      :team_name =>"Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1 
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7 
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15 
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1  
        }
        ]
    }, 
    :away => {
      :team_name =>"Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2 
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10 
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0 
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12 
        }
        ]
    }
  }
  game_hash
end 

def just_the_players
players = []
i = 0 
while i < game_hash[:home][:players].length do 
  players << game_hash[:home][:players][i]
  players << game_hash[:away][:players][i]
  i += 1 
end 
players 
end 

def num_points_scored(player)
  i = 0 
  while i < just_the_players.length do 
    if just_the_players[i][:player_name] == player 
      points = just_the_players[i][:points]
    end 
    i += 1 
  end 
  points 
end 

def shoe_size(player)
  i = 0 
  while i < just_the_players.length do 
    if just_the_players[i][:player_name] == player 
      shoe = just_the_players[i][:shoe]
    end 
    i += 1 
  end 
  shoe 
end 

def team_colors(team)

  if team == game_hash[:home][:team_name]
    colors = game_hash[:home][:colors]
  else 
    colors = game_hash[:away][:colors]
  end 
  colors 
end 

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  names 
end 

def player_numbers(team)
  numbers = []
  if team == game_hash[:home][:team_name]
    i = 0 
    while i < game_hash[:home][:players].length do 
      numbers << game_hash[:home][:players][i][:number]
      i += 1 
    end 
  else 
    i = 0 
    while i < game_hash[:away][:players].length do 
      numbers << game_hash[:away][:players][i][:number]
      i += 1 
    end 
  end 
  numbers 
end 

def player_stats(player) 
  i = 0 
  while i < just_the_players.length do 
    if player == just_the_players[i][:player_name]
      stats = {
        :assists => just_the_players[i][:assists],
        :blocks => just_the_players[i][:blocks],
        :number => just_the_players[i][:number],
        :points => just_the_players[i][:points],
        :rebounds => just_the_players[i][:rebounds],
        :shoe => just_the_players[i][:shoe],
        :slam_dunks => just_the_players[i][:slam_dunks],
        :steals => just_the_players[i][:steals],
      }
    end 
    i += 1 
  end
  stats 
end 

def big_shoe_rebounds
  rebounds = 0
  shoe = 0
  i = 0
  while i < just_the_players.length do 
    if just_the_players[i][:shoe] > shoe
      shoe = just_the_players[i][:shoe]
      rebounds = just_the_players[i][:rebounds]
    end 
    i += 1 
  end 
  rebounds 
end 

def most_points_scored
  name = nil 
  points = 0 
  i = 0 
  while i < just_the_players.length do 
    if just_the_players[i][:points] > points
      name = just_the_players[i][:player_name]
      points = just_the_players[i][:points]
    end 
    i += 1 
  end 
  name 
end 

def winning_team 
  home_total = 0
  away_total = 0 
i = 0 
while i < game_hash[:home][:players].length do 
  home_total += game_hash[:home][:players][i][:points]
  i += 1 
end 
d = 0 
while d < game_hash[:away][:players].length do 
  home_total += game_hash[:away][:players][d][:points]
  d += 1 
end 

if home_total > away_total
  winner = game_hash[:home][:team_name]
elsif home_total < away_total
  winner = game_hash[:away][:team_name]
else 
  winner = "It's a tie"
end 
winner 
end 

def player_with_longest_name
  name = just_the_players[0][:player_name]
  i = 0 
  while i < just_the_players.length do 
    if just_the_players[i][:player_name].length > name.length
      name = just_the_players[i][:player_name]
    end 
    i += 1 
  end 
  name 
end 

def long_name_steals_a_ton?
  true 
end 


