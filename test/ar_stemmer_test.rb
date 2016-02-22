require 'test_helper'

class ArStemmerTest < Minitest::Test
  def test_al_prefix
    assert_stem "الحسن", "حسن"
  end

  def test_wal_prefix
    assert_stem "والحسن", "حسن"
  end

  def test_bal_prefix
    assert_stem "بالحسن", "حسن"
  end

  def test_kal_prefix
    assert_stem "كالحسن", "حسن"
  end

  def test_fal_prefix
    assert_stem "فالحسن", "حسن"
  end

  def test_ll_prefix
    assert_stem "للاخر", "اخر"
  end

  def test_wa_prefix
    assert_stem "وحسن", "حسن"
  end

  def test_ah_suffix
    assert_stem "زوجها", "زوج"
  end

  def test_an_suffix
    assert_stem "ساهدان", "ساهد"
  end

  def test_at_suffix
    assert_stem "ساهدات", "ساهد"
  end

  def test_wn_suffix
    assert_stem "ساهدون", "ساهد"
  end

  def test_yn_suffix
    assert_stem "ساهدين", "ساهد"
  end

  def test_yh_suffix
    assert_stem "ساهديه", "ساهد"
  end

  def test_yp_suffix
    assert_stem "ساهدية", "ساهد"
  end

  def test_h_suffix
    assert_stem "ساهده", "ساهد"
  end

  def test_p_suffix
    assert_stem "ساهدة", "ساهد"
  end

  def test_y_suffix
    assert_stem "ساهدي", "ساهد"
  end

  def test_combo_pref_suf
    assert_stem "وساهدون", "ساهد"
  end

  def test_combo_suf
    assert_stem "ساهدهات", "ساهد"
  end

  def test_shouldnt_stem
    assert_stem "الو", "الو"
  end

  def test_non_arabic
    assert_stem "English", "English"
  end

  def test_disable_option
    yn_word = "ساهدين"
    wn_word = "ساهدون"
    assert_equal yn_word, ArStemmer.stem(yn_word, disable: [:yeh_noon, :waw_noon])
    assert_equal wn_word, ArStemmer.stem(wn_word, disable: [:yeh_noon, :waw_noon])
  end

  def assert_stem(word, stem)
    assert_equal(stem, ArStemmer.stem(word))
  end
end
