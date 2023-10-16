class Scale
  SHARPS = %w[G D A C E B F# a e b f# c# g# d#]
  MAJOR = %w[A A# B C C# D D# E F F# G G#]
  MINOR = %w[A Bb B C Db D Eb E F Gb G Ab]

  def initialize(tonic)
    @tonic = tonic
  end

  def chromatic
    @chromatic ||= notes.rotate(notes.index(@tonic.capitalize))
  end

  def notes
    @notes ||= SHARPS.include?(@tonic) ? MAJOR : MINOR
  end

  def interval(steps)
    indeces = steps
      .tr('mMA', '123')
      .chars
      .reduce([0]) do |indeces, step|
        indeces << (indeces.last + step.to_i) % chromatic.length
      end
    chromatic.values_at(*indeces)
  end
end
