# ArStemmer is a pure ruby port of Lucene's ArabicStemmer class
#
# https://github.com/apache/lucene-solr/blob/master/lucene/analysis/common/src/java/org/apache/lucene/analysis/ar/ArabicStemmer.java
class ArStemmer

  ALEF = "\u0627"
  BEH = "\u0628"
  TEH_MARBUTA = "\u0629"
  TEH = "\u062A"
  FEH = "\u0641"
  KAF = "\u0643"
  LAM = "\u0644"
  NOON = "\u0646"
  HEH = "\u0647"
  WAW = "\u0648"
  YEH = "\u064A"

  PREFIXES = [
    ALEF + LAM,
    WAW + ALEF + LAM,
    BEH + ALEF + LAM,
    KAF + ALEF + LAM,
    FEH + ALEF + LAM,
    LAM + LAM,
    WAW
  ]

  SUFFIXES = [
    HEH + ALEF,
    ALEF + NOON,
    ALEF + TEH,
    WAW + NOON,
    YEH + NOON,
    YEH + HEH,
    YEH + TEH_MARBUTA,
    HEH,
    TEH_MARBUTA,
    YEH
  ]

  def self.stem(word)
    new(word).stem
  end

  attr_reader :word

  def initialize(word)
    @word = word.dup
  end

  def stem
    stem_prefix
    stem_suffix
    word
  end

  def stem_prefix
    PREFIXES.each do |prefix|
      @word = word[prefix.length .. -1] if starts_with_check_length(word, prefix)
    end
  end

  def stem_suffix
    SUFFIXES.each do |suffix|
      @word = word[0 .. -(suffix.length + 1)] if ends_with_check_length(word, suffix)
    end
  end

  def starts_with_check_length(word, prefix)
    if prefix.length == 1 && word.length < 4 # wa- prefix requires at least 3 characters
      false
    elsif word.length < prefix.length + 2
      false
    else
      word.start_with?(prefix)
    end
  end

  def ends_with_check_length(word, suffix)
    if word.length < suffix.length + 2
      false
    else
      word.end_with?(suffix)
    end
  end
end
