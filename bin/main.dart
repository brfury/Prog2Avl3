import 'package:avl3/dna_sequence.dart';

void main() {
  final sequence = 'ATCGTA';
  final r = DNASequence(sequence);
  print('Original Sequence: ${r.sequence}');
  print('Inverted Sequence: ${r.invertSequence()}');

  final randomSequence = DNASequence.randomLength(10);
  print('Random Sequence: ${randomSequence.sequence}');

  final complement = r.complementSequence();
  print('Complement Sequence: $complement');

  final complementCounts = r.countComplement(complement);
  print('Complement Character Counts:');
  print('  - Character "C" occurs ${complementCounts[0]} times.');
  print('  - Character "G" occurs ${complementCounts[1]} times.');
  print('  - Character "T" occurs ${complementCounts[2]} times.');
  print('  - Character "A" occurs ${complementCounts[3]} times.');
  print("Alunos:\n Lucas Frota\n Bruno da Silva");
}




