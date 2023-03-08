require "minitest/autorun"
require_relative "protein_translation"

class ProteinTranslationTest < Minitest::Test
  def test_empty_rna_sequence_results_in_no_proteins
    strand = ""
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_methionine_rna_sequence
    strand = "AUG"
    expected = ["Methionine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_phenylalanine_rna_sequence_1
    strand = "UUU"
    expected = ["Phenylalanine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_phenylalanine_rna_sequence_2
    strand = "UUC"
    expected = ["Phenylalanine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_leucine_rna_sequence_1
    strand = "UUA"
    expected = ["Leucine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_leucine_rna_sequence_2
    strand = "UUG"
    expected = ["Leucine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_1
    strand = "UCU"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_2
    strand = "UCC"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_3
    strand = "UCA"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_serine_rna_sequence_4
    strand = "UCG"
    expected = ["Serine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tyrosine_rna_sequence_1
    strand = "UAU"
    expected = ["Tyrosine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tyrosine_rna_sequence_2
    strand = "UAC"
    expected = ["Tyrosine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_cysteine_rna_sequence_1
    strand = "UGU"
    expected = ["Cysteine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_cysteine_rna_sequence_2
    strand = "UGC"
    expected = ["Cysteine"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_tryptophan_rna_sequence
    strand = "UGG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_1
    strand = "UAA"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_2
    strand = "UAG"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_stop_codon_rna_sequence_3
    strand = "UGA"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_sequence_of_two_protein_codons_translates_into_proteins
    strand = "UUUUUU"
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_sequence_of_two_different_protein_codons_translates_into_proteins
    strand = "UUAUUG"
    expected = %w[Leucine Leucine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translate_rna_strand_into_correct_protein_list
    strand = "AUGUUUUGG"
    expected = %w[Methionine Phenylalanine Tryptophan]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_beginning_of_sequence
    strand = "UAGUGG"
    expected = []
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_end_of_two_codon_sequence
    strand = "UGGUAG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_at_end_of_three_codon_sequence
    strand = "AUGUUUUAA"
    expected = %w[Methionine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_in_middle_of_three_codon_sequence
    strand = "UGGUAGUGG"
    expected = ["Tryptophan"]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_translation_stops_if_stop_codon_in_middle_of_six_codon_sequence
    strand = "UGGUGUUAUUAAUGGUUU"
    expected = %w[Tryptophan Cysteine Tyrosine]
    assert_equal expected, Translation.of_rna(strand)
  end

  def test_non_existing_codon_cant_translate
    strand = "AAA"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_unknown_amino_acids_not_part_of_a_codon_cant_translate
    strand = "XYZ"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_cant_translate
    strand = "AUGU"
    assert_raises(InvalidCodonError) do
      Translation.of_rna(strand)
    end
  end

  def test_incomplete_rna_sequence_can_translate_if_valid_until_a_stop_codon
    strand = "UUCUUCUAAUGGU"
    expected = %w[Phenylalanine Phenylalanine]
    assert_equal expected, Translation.of_rna(strand)
  end
end
