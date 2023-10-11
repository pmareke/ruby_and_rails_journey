require_relative "team"

class Tournament
  def self.tally(input)
    teams = self.parse(input)
    header = "Team                           | MP |  W |  D |  L |  P"
    [
      header,
      *teams.map(&:stats),
      ""
    ].join("\n")

  end

  private

  def self.parse(input)
    input.strip.lines.inject({}) do |teams, line|
      home, visitor, result = line.strip.split(";")

      home_team = teams[home] || Team.new(home)
      home_team.game(result)
      teams[home_team.name] = home_team

      visitor_team = teams[visitor] || Team.new(visitor)
      visitor_team.game_as_visitor(result)
      teams[visitor_team.name] = visitor_team
      teams
    end
      .values
      .sort_by{|a| [-a.points, a.name]}
  end
end

