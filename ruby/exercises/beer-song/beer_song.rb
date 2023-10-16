module BeerSong
  def BeerSong.recite(bottles, verses)
    verses.times.inject([]) do |acc|
      acc << verse(bottles)
      bottles -= 1
      acc
    end.join("\n")
  end

  def BeerSong.verse(bottles)
    standard_verse = <<~TEXT
      #{bottles} bottles of beer on the wall, #{bottles} bottles of beer.
      Take one down and pass it around, #{bottles - 1} bottle#{'s' if bottles > 2 } of beer on the wall.
      TEXT

    single_bottle_verse = <<~TEXT
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
      TEXT

    no_bottles_verse = <<~TEXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      TEXT

    return no_bottles_verse if bottles.zero?

    bottles > 1 ? standard_verse : single_bottle_verse
  end
end
