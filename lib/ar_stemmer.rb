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

  PREFIXES = {
    alef_lam:     ALEF + LAM,
    waw_alef_lam: WAW + ALEF + LAM,
    beh_alef_lam: BEH + ALEF + LAM,
    kaf_alef_lam: KAF + ALEF + LAM,
    feh_alef_lam: FEH + ALEF + LAM,
    lam_lam:      LAM + LAM,
    waw:          WAW
  }

  SUFFIXES = {
    heh_alef:        HEH + ALEF,
    alef_noon:       ALEF + NOON,
    alef_teh:        ALEF + TEH,
    waw_noon:        WAW + NOON,
    yeh_noon:        YEH + NOON,
    yeh_heh:         YEH + HEH,
    yeh_teh_marbuta: YEH + TEH_MARBUTA,
    heh:             HEH,
    teh_marbuta:     TEH_MARBUTA,
    yeh:             YEH
  }

  def self.stem(word, options = {})
    new(word, options).stem
  end

  attr_reader :word, :excepts, :onlys

  def initialize(word, options = {})
    @word = word.dup

    @onlys = []
    @excepts = []
    if options[:only]
      @onlys = options[:only]
    elsif options[:except]
      @excepts = options[:except]
    end
  end

  def stem
    stem_prefix
    stem_suffix
    word
  end

  private

    def rules(rule_set)
      rule_set
        .reject {|k, v| excepts.any? ? excepts.include?(k) : false }
        .select {|k, v| onlys.any? ? onlys.include?(k) : true }
        .values
    end

    def stem_prefix
      rules(PREFIXES).each do |prefix|
        return @word = word[prefix.length .. -1] if starts_with_check_length(word, prefix)
      end
    end

    def stem_suffix
      rules(SUFFIXES).each do |suffix|
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
