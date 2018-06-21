# Write your code here!

require "pry"

def game_hash
  
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" =>
          {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
        },
        "Bismak Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
        },
        "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
        },
        "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
        },
        "Brendan Haywood" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 22,
            :blocks => 5,
            :slam_dunks => 12
        }
      }
    }
  }
  
end


# Below method calls in a player name. Iterate over the game_hash to locate the player, and return the player's stats (points) to the requestor.

def num_points_scored(player_name)
   game_hash.each do |location, team_data|
      #Goes through players, then a name and its data
      team_data[:players].each do |name, data|
      if name == player_name
        return data[:points]
      end
    end
  end
end


def shoe_size(player_name)
  #Goes through hash, then home away, then names, colors, players
  game_hash.each do |location, team_data|
    #Goes through players then a name and its data
    team_data[:players].each do |name, data|
      if name == player_name
        return data[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, chars|
    game_hash[team].each do |name, chars|
        if team_name == chars
          return game_hash[team][:colors]
        end
    end
  end
end

# Below is an array called teams. Iterate down to check for :team_name key, and iterate over the values. Push this name (values) into teams array, and return it.

def team_names
  teams = []
  game_hash.each do |keys, values|
    values.each do |data_labels, data|
      if data_labels == :team_name
        teams << data
      end
    end
  end
  teams
end




def player_numbers(team_name)
  numbers = []
  game_hash.each do |team, chars|
    if team_name == game_hash[team][:team_name]
      game_hash[team][:players].each do |name, stats|
        numbers.push(stats[:number])
      end
    end
  end
  return numbers
end




def shoe_size(player_name)
  #Goes through hash, then home away, then names, colors, players
  game_hash.each do |location, team_data|
    #Goes through players then a name and its data
    team_data[:players].each do |name, data|
      if name == player_name
        return data[:shoe]
      end
    end
  end
end


def big_shoe_rebounds
  
  # Declare names & shoe_sizes arrays
  names = []
  shoe_sizes = []

  # iterate over game_hash, and down. Push (<<) name and shoe sizes into arrays above. 
  
  game_hash.each do |team, chars|
    game_hash[team][:players].each do |name,stats|
      names.push(name)
      shoe_sizes.push(stats[:shoe])
    end
  end

  largest = -1
  shoe_sizes.each do |x|
    if x > largest
      largest = x
    end
    end
  
  player_with_largest = names[shoe_sizes.index(largest)]
  
  game_hash.each do |team, chars|
    game_hash[team][:players].each do |name, stats|
     if player_with_largest == name
       return stats[:rebounds]
  
      end
    end
  end
end


def player_stats(player_name)
  find_player(player_name)
end

def players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def find_player(name)
  players.fetch(name)
end




