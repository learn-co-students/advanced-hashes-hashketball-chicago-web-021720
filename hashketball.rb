def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      ]
    },
    
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        },
      ]
    }
  }
end


def lookup_player_stat(player_name, stat)
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        return player[stat]
      end
    end
  end  
end


def num_points_scored(player_name)
  lookup_player_stat(player_name, :points)
end


def shoe_size(player_name)
  lookup_player_stat(player_name, :shoe)
end


def team_colors(team_name)
  game_hash.each_value do |team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end


def team_names
  teams = []
  game_hash.each_value do |team_data|
    teams << team_data[:team_name]
  end
  teams
end


def player_numbers(team_name)
  numbers = []
  game_hash.each_value do |team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        player.each do |stat, value|
          if stat != :player_name
            player_stats[stat] = value
          end
        end
      end
    end
  end
  player_stats
end


def big_shoe_rebounds

  shoe_size = 0
  largest_shoe_size_player = ""
  
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      if player[:shoe] > shoe_size
        shoe_size = player[:shoe]
        largest_shoe_size_player = player[:player_name]
      end
    end
  end
  
  lookup_player_stat(largest_shoe_size_player, :rebounds)
end


def highest_stat_player(stat)
  stat_value = 0 
  highest_stat_player = ""
  
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      if player[stat] > stat_value
        stat_value = player[stat]
        highest_stat_player = player[:player_name]
      end
    end
  end
  
  highest_stat_player
end


def most_points_scored
  highest_stat_player(:points)
end


def winning_team
  points_data = {}
  
  game_hash.each_value do |team_data|
    
    team_name = team_data[:team_name]
    team_points_total = 0
    
    team_data[:players].each do |player|
      team_points_total += player[:points]
    end
    
    points_data[team_name] = team_points_total
  end
  
  winner = ""
  winning_points = 0
  points_data.each do |team, points|
    if points > winning_points
      winner = team
      winning_points = points
    end
  end
  
  winner
end


def player_with_longest_name
  longest_name = ""
  
  game_hash.each_value do |team_data|
    team_data[:players].each do |player|
      if player[:player_name].length > longest_name.length
        longest_name = player[:player_name]
      end
    end
  end
  longest_name
end


def long_name_steals_a_ton?
  highest_stat_player(:steals) == player_with_longest_name
end

