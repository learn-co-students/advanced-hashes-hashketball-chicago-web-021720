# Write your code here!
require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
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
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
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
end

def num_points_scored(player_name)
  data = game_hash()
  foundhome = data[:home][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway = data[:away][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway ? foundaway[:points] : foundhome[:points]
end

def shoe_size(player_name)
  data = game_hash()
  foundhome = data[:home][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway = data[:away][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway ? foundaway[:shoe] : foundhome[:shoe]
end

def team_names
  data = game_hash()
  [data[:home][:team_name],data[:away][:team_name]]
end

def player_numbers(team_name)
  data = game_hash()
  teaminfo = data[:home][:team_name] == team_name ? data[:home] : data[:away]
  teaminfo[:players].collect do |playerinfo|
    playerinfo[:number]
  end
end

def team_colors(team_name)
  data = game_hash()
  teaminfo = data[:home][:team_name] == team_name ? data[:home] : data[:away]
  teaminfo[:colors]
end

def player_stats(player_name)
  data = game_hash()
  foundhome = data[:home][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway = data[:away][:players].find do |player|
    player[:player_name] == player_name
  end
  foundinfo= foundaway ? foundaway : foundhome
  foundinfo.reject do |key|
    key == :player_name
  end
  foundinfo.reject! do |key| key == :player_name end
end

def big_shoe_rebounds
  data = game_hash()
  home_players = data[:home][:players]
  away_players = data[:away][:players]
  shoerebound = []
  home_players.each do |player|
    shoerebound << [player[:shoe],player[:rebounds]]
  end
  away_players.each do |player|
    shoerebound << [player[:shoe],player[:rebounds]]
  end
  shoerebound = shoerebound.sort_by do |a|
    a[0]
  end
  shoerebound[shoerebound.length() -1][1]
end

def get_all_players
  data = game_hash()
  allplayers = []
  data[:home][:players].each do |player|
    allplayers << player[:player_name]
  end
  data[:away][:players].each do |player|
    allplayers << player[:player_name]
  end
  allplayers
end

def most_points_scored
  allplayers = get_all_players()

  allscores = allplayers.map do |player|
    [player, num_points_scored(player)]
  end

  allscores = allscores.sort_by do |a|
    a[1]
  end
  allscores[allscores.length() -1][0]
end

def winning_team
  data = game_hash()
  homescore = data[:home][:players].reduce(0) do |sum,player|
    sum + player[:points]
  end
  awayscore = data[:away][:players].reduce(0) do |sum,player|
    sum + player[:points]
  end
  awayscore > homescore ? data[:away][:team_name] : data[:home][:team_name]
end

def player_with_longest_name
  allplayers = get_all_players()
  sortedplayers = allplayers.sort_by do |name|
    name.length()
  end
  sortedplayers[sortedplayers.length() - 1]
end

def steals(player_name)
  data = game_hash()
  foundhome = data[:home][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway = data[:away][:players].find do |player|
    player[:player_name] == player_name
  end
  foundaway ? foundaway[:steals] : foundhome[:steals]
end

def long_name_steals_a_ton?
  longname = player_with_longest_name()
  allplayers = get_all_players()
  longestnamenumber = steals(longname)
  allplayers.each do |player|
    if steals(player) > longestnamenumber
      return false
    end
  end
  true
end
