require './spec_helper'

RSpec.describe StatTracker do
  before(:each) do
    game_path = './fixtures/games_sample.csv'
    team_path = './data/teams.csv'
    game_teams_path = './fixtures/game_teams_sample.csv'

    locations = {
      games: game_path,
      teams: team_path,
      game_teams: game_teams_path
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  describe 'initialization' do
    it 'exists' do
      expect(@stat_tracker).to be_a(StatTracker)
    end

    it 'has RawStats' do
      expect(@stat_tracker.stats).to be_a(RawStats)
    end
  end

  describe 'Game Statistics' do
    it 'calculates highest_total_score' do
      #code here
    end
  
    it 'calculates lowest_total_score' do
      #code here
    end
  
    it 'calculates percentage_home_wins' do
      expect(@stat_tracker.percentage_home_wins).to eq(65.31)
    end
  
    it 'calculates percentage_visitor_wins' do
      expect(@stat_tracker.percentage_visitor_wins).to eq(32.65)
    end
  
    it 'calculates percentage_ties' do
      expect(@stat_tracker.percentage_ties).to eq(2.04)
    end
  
    it 'calculates count_of_games_by_season' do
      #code here
    end
  
    it 'calculates average_goals_per_game' do
      #code here     
    end
  
    it 'calculates average_goals_by_season' do
      #code here
    end  
  end

  describe 'League Statistics' do
    it 'calculates count_of_teams' do
      #code here
    end
  
    it 'calculates best_offense' do
      #code here
    end
  
    it 'calculates worst_offense' do
      #code here
    end
  
    it 'calculates highest_scoring_visitor' do
      #code here
    end
  
    it 'calculates highest_scoring_home_team' do
      #code here
    end
  
    it 'calculates lowest_scoring_visitor' do
      #code here
    end
  
    it 'calculates lowest_scoring_home_team' do
      #code here
    end
  end

  describe 'Season Statistics' do
    it 'calculates winningest_coach' do
      #code here
    end
  
    it 'calculates worst_coach' do
      #code here
    end
  
    it 'calculates most_accurate_team' do
      #code here
    end
  
    it 'calculates least_accurate_team' do
      #code here
    end
  
    it 'calculates most_tackles' do
      #code here
    end
  
    it 'calculates fewest_tackles' do
      #code here
    end
  end
end