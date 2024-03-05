require_relative 'spec_helper'

RSpec.describe StatTracker do
  before(:all) do
    team_path = './data/teams.csv'
    # game_path = './fixtures/games_sample.csv'
    # game_teams_path = './fixtures/game_teams_sample.csv'
    game_path = './data/games.csv'
    game_teams_path = './data/game_teams.csv'

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
      # expect(@stat_tracker.highest_total_score).to eq(6)
      expect(@stat_tracker.highest_total_score).to eq(11)
    end

    it 'calculates lowest_total_score' do
      # expect(@stat_tracker.lowest_total_score).to eq(1)
      expect(@stat_tracker.lowest_total_score).to eq(0)
    end

    it 'calculates percentage_home_wins' do
      # expect(@stat_tracker.percentage_home_wins).to eq(0.65)
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
    end

    it 'calculates percentage_visitor_wins' do
      # expect(@stat_tracker.percentage_visitor_wins).to eq(0.33)
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end

    it 'calculates percentage_ties' do
      # expect(@stat_tracker.percentage_ties).to eq(0.02)
      expect(@stat_tracker.percentage_ties).to eq(0.20)
    end

    it 'calculates count_of_games_by_season' do
      # expect(@stat_tracker.count_of_games_by_season).to eq({ '20122013' => 49 })
      expected = { '20122013' => 806, '20132014' => 1323, '20142015' => 1319, '20152016' => 1321, '20162017' => 1317,
                   '20172018' => 1355 }
      expect(@stat_tracker.count_of_games_by_season).to eq(expected)
    end

    it 'calculates average_goals_per_game' do
      # expect(@stat_tracker.average_goals_per_game).to eq(3.92)
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end

    it 'calculates average_goals_by_season' do
      # expect(@stat_tracker.average_goals_by_season).to eq({ '20122013' => 3.92 })
      expected = { '20122013' => 4.12, '20132014' => 4.19, '20142015' => 4.14, '20152016' => 4.16, '20162017' => 4.23,
                   '20172018' => 4.44 }
      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end

  describe 'League Statistics' do
    it 'calculates count_of_teams' do
      expect(@stat_tracker.count_of_teams).to eq(32)
    end

    it 'has average_goals_by_team list (hash)' do
      expect(@stat_tracker.avg_goals_by_team).to be_a(Hash)
      # expected = { '16' => 1.82, '17' => 1.86, '3' => 1.6, '30' => 2.0,
      # '5' => 0.5, '6' => 2.67, '8' => 1.8, '9' => 2.8 }
      expected = { '1' => 1.94, '10' => 2.11, '12' => 2.04, '13' => 2.06, '14' => 2.22, '15' => 2.21, '16' => 2.16,
                   '17' => 2.06, '18' => 2.15, '19' => 2.11, '2' => 2.18, '20' => 2.07, '21' => 2.07, '22' => 2.05, '23' => 1.97, '24' => 2.2, '25' => 2.22, '26' => 2.08, '27' => 2.02, '28' => 2.19, '29' => 2.17, '3' => 2.13, '30' => 2.12, '4' => 2.04, '5' => 2.29, '52' => 2.17, '53' => 1.89, '54' => 2.34, '6' => 2.26, '7' => 1.84, '8' => 2.05, '9' => 2.11 }
      expect(@stat_tracker.avg_goals_by_team).to eq(expected)
    end

    it 'calculates best_offense' do
      # expect(@stat_tracker.best_offense).to eq('New York City FC')
      expect(@stat_tracker.best_offense).to eq('Reign FC')
    end

    it 'calculates worst_offense' do
      # expect(@stat_tracker.worst_offense).to eq('Sporting Kansas City')
      expect(@stat_tracker.worst_offense).to eq('Utah Royals FC')
    end

    it 'calculates highest_scoring_visitor' do
      expect(@stat_tracker.highest_scoring_visitor).to eq('FC Dallas')
    end

    it 'calculates highest_scoring_home_team' do
      # expect(@stat_tracker.highest_scoring_home_team).to eq('New York City FC')
      expect(@stat_tracker.highest_scoring_home_team).to eq('Reign FC')
    end

    it 'calculates lowest_scoring_visitor' do
      # expect(@stat_tracker.lowest_scoring_visitor).to eq('Seattle Sounders FC')
      expect(@stat_tracker.lowest_scoring_visitor).to eq('San Jose Earthquakes')
    end

    it 'calculates lowest_scoring_home_team' do
      # expect(@stat_tracker.lowest_scoring_home_team).to eq('Orlando City SC')
      expect(@stat_tracker.lowest_scoring_home_team).to eq('Utah Royals FC')
    end
  end

  describe 'Season Statistics' do
    it 'calculates winningest_coach' do
      # expect(@stat_tracker.winningest_coach('20122013')).to eq('Claude Julien')
      expect(@stat_tracker.winningest_coach('20122013')).to eq('Joel Quenneville').or(eq('Claude Julien'))
    end

    it 'calculates worst_coach' do
      # expect(@stat_tracker.worst_coach('20122013')).to eq('Dan Bylsma')
      expect(@stat_tracker.worst_coach('20132014')).to eq('Peter Laviolette')
      # expect(@stat_tracker.worst_coach('20122013')).to eq('Martin Raymond')
    end

    it 'calculates most_accurate_team' do
      # expect(@stat_tracker.most_accurate_team('20122013')).to eq('New York City FC')
      expect(@stat_tracker.most_accurate_team('20122013')).to eq('DC United')
    end

    it 'calculates least_accurate_team' do
      # expect(@stat_tracker.least_accurate_team('20122013')).to eq('Sporting Kansas City')
      expect(@stat_tracker.least_accurate_team('20122013')).to eq('New York City FC')
    end

    it 'calculates most_tackles' do
      # expect(@stat_tracker.most_tackles('20122013')).to eq('New England Revolution')
      expect(@stat_tracker.most_tackles('20122013')).to eq('FC Cincinnati')
    end

    it 'calculates fewest_tackles' do
      # expect(@stat_tracker.fewest_tackles('20122013')).to eq('Orlando City SC')
      expect(@stat_tracker.fewest_tackles('20122013')).to eq('Atlanta United')
    end

    it 'lists games in array matching the season id' do
      expect(@stat_tracker.season_games('20122013')).to be_a(Array)
      # expect(@stat_tracker.season_games('20122013').length).to eq(49)
      expect(@stat_tracker.season_games('20122013').length).to eq(1612)
    end
  end
end
