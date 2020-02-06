# Write your code here!
require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      }, {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      }, {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      }, {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1 }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }, {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      }, {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }, {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0 
      }, {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    players = team_data[:players]
    player = players.find { |player| player_name == player[:player_name]}
    if(player)
      return player[:points]
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    players = team_data[:players]
    players.each do |player|
        if(player_name == player[:player_name])
            return player[:shoe]
        end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    colors = team_data[:colors]
    if(team_name == team_data[:team_name])
      return colors
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  jerseys = []
  team_data = game_hash.find do |location, team_data|
    team_data[:team_name] == team_name
  end
   team_data[1][:players].each do |player|
    jerseys << player[:number]
  end
  jerseys
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_data|
    players = team_data[:players]
    player = players.find { |player| player_name == player[:player_name] }
    if(player)
      player.each do |stat, val|
        if(stat != :player_name)
      stats.store(stat, val)
    end
    end
    end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe = {:shoe => 0}
  game_hash.each do |location, team_data|
    players = team_data[:players]
    team_biggest_shoe = players.max_by {|player| player[:shoe]}
    if(biggest_shoe[:shoe] < team_biggest_shoe[:shoe])
      biggest_shoe = team_biggest_shoe
    end
  end
  biggest_shoe[:rebounds]
end

def most_points_scored
  most_points = {:points => 0 }
  game_hash.each do |location, team_data|
    players = team_data[:players]
    team_most_points = players.max_by {|player| player[:points]}
    if(most_points[:points] < team_most_points[:points])
      most_points = team_most_points
    end
    end
    most_points[:player_name]
end

def winning_team
  max = game_hash.max_by do |location, team_data|
    players = team_data[:players]
    total_points = players.reduce(0) do |points, point|
      points + point[:points]
    end 
  end
  max[1][:team_name]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    players = team_data[:players]
    team_longest_name = players.max_by {|player| player[:player_name].length}
    if(longest_name < team_longest_name[:player_name])
      longest_name = team_longest_name[:player_name]
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  longest_name = {:player_name => ""}
  steals = 0
  game_hash.each do |location, team_data|
    players = team_data[:players]
    team_longest_name = players.max_by {|player| player[:player_name].length}
    if(longest_name[:player_name] < team_longest_name[:player_name])
      longest_name = team_longest_name
    end
  end
  longest_name
  game_hash.each do |location, team_data|
    players = team_data[:players]
    steals = players.max_by { |player| player[:steals] }
  end
  if(longest_name == steals)
    return true 
  else
    return false
  end
end



