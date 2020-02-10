# Write your code here!
# falling behind so I have to use the walkthrough video for this one. but I know I can do this on my own.



#i'm watching the walkthrough and I fully realize that I should build a method before all of this targetting whatever key, which would eliminate the repetitiveness of some of these methods.

def game_hash
  {
    :away => {:team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10, 
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7, 
        :slam_dunks => 2
        
      },
      {:player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4, 
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {:player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {:player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {:player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12}]
    
  },
    :home => {:team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [{
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
    {:player_name => "Reggie Evans",
    :number => 30,
    :shoe => 14,
    :points => 12,
    :rebounds => 12,
    :assists => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7
    },
    {:player_name => "Brook Lopez",
    :number => 11,
    :shoe => 17,
    :points => 17,
    :rebounds => 19,
    :assists => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15
  },
  {:player_name => "Mason Plumlee",
  :number => 1,
  :shoe => 19,
  :points => 26,
  :rebounds => 11,
  :assists => 6,
  :steals => 3,
  :blocks => 8,
  :slam_dunks => 5
  },
  {:player_name => "Jason Terry",
  :number => 31,
  :shoe => 15,
  :points => 19,
  :rebounds => 2,
  :assists => 2,
  :steals => 4,
  :blocks => 11,
  :slam_dunks => 1}]
      
    }}
    
    #why is this even a method? wouldn't it have been better as just a variable defined as the hash? 
  
end

def num_points_scored(name)
  #returns num of points for player passed in
  game_hash.each do |place, team|
    team.each do |key, value|
      if key == :players
        value.each do |player|
          if player[:player_name] == name
            return player[:points]
        end
      end
    end
  end
end
end 

def shoe_size(name)
    game_hash.each do |place, team|
    team.each do |key, value|
      if key == :players
        value.each do |player|
          if player[:player_name] == name
            return player[:shoe]
        end
      end
    end
  end
end
end

def team_colors(the_team)
  game_hash.each do |place, team|
    if the_team == team[:team_name]
      return team[:colors]
    end
  end
 end
 

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  array = []
  game_hash.each do |place, team|
    if team[:team_name]==team_name
      team.each do |key, value|
        if key == :players
          value.each do |player|
            array << player[:number]
          end
        end
      end
    end
  end
  array
end

def player_stats(name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name]==name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end
#####walkthrough doesn't make it past this part or the bonus questions so I'm going to do those on my own.

def big_shoe_rebounds
  feet = []
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
        feet.push(shoe_size(player[:player_name]))
      end
    end
  end
end
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if shoe_size(player[:player_name]) == feet.max
            return player[:rebounds]
          end
        end
      end
    end
  end

end


def most_points_scored
  scores = []
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          scores.push(player[:points])
        end
      end
    end
  end
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:points]==scores.max
            return player[:player_name]
          end
        end
      end
    end
  end
end
  
  
def winning_team
  home_score = 0 
  away_score = 0 
  home = game_hash[:home][:team_name]
  away = game_hash[:away][:team_name]
  
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players && place == :away
        data.each do |player|
          away_score += player[:points]
        end
      end
    end
  end
  #pp away_score
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players && place == :home
        data.each do |player|
          home_score += player[:points]
        end
      end
    end
  end
  #pp home_score
  if home_score > away_score
    return home
  else
    return away
  end
end

def player_with_longest_name
  name_lengths=[]
  
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          name_lengths.push(player[:player_name].length)
        end
      end
    end
  end
  #pp name_lengths
      game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name].length==name_lengths.max
            return player[:player_name]
          end
        end
      end
    end
  end
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name()
  steals = []
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          steals.push(player[:steals])
        end
      end
    end
  end
  
    game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name]==longest_name && player[:steals]==steals.max
          return true
        elsif player[:player_name]==longest_name && player[:steals]!=steals.max
          return false
        end
        end
      end
    end
  end
  
end
        

