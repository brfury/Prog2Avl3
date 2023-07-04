
import 'dart:math';

class DNASequence {
  final List<String> pairs = [];
  final String sequence;
  final List<String> nitrogenousBase = ['AT', 'TA', 'GC', 'CG'];

  DNASequence(this.sequence) {
    if (sequence.length % 2 != 0) {
      throw ArgumentError('Sequence length must be even');
    }

    for (int i = 0; i < sequence.length; i += 2) {
      pairs.add(sequence.substring(i, i + 2));
    }

    for (int i = 0; i < pairs.length; i++) {
      if (!nitrogenousBase.contains(pairs[i])) {
        throw ArgumentError('Invalid DNA sequence');
      }
    }
  }

  factory DNASequence.randomLength(int length) {
    final List<String> base = ['AT', 'TA', 'GC', 'CG'];
    if (length % 2 != 0) {
      throw ArgumentError('Sequence length must be even');
    }

    final random = Random();
    final sequence = List.generate(length, (index) {
      final randomIndex = random.nextInt(base.length);
      return base[randomIndex];
    }).join();

    return DNASequence(sequence);
  }

  @override
  String toString() {
    return pairs.toString();
  }

  String invertSequence() {
    return sequence.split('').reversed.join('');
  }

  String complementSequence() {
    final complement = StringBuffer();
    for (int i = 0; i < sequence.length; i++) {
      final nucleotide = sequence[i];
      switch (nucleotide) {
        case 'A':
          complement.write('T');
          break;
        case 'T':
          complement.write('A');
          break;
        case 'C':
          complement.write('G');
          break;
        case 'G':
          complement.write('C');
          break;
        default:
          throw ArgumentError('Invalid DNA sequence');
      }
    }
    return complement.toString();
  }

  List<int> countComplement(String input) {
    final occurrences = List<int>.filled(4, 0);
    for (int i = 0; i < input.length; i++) {
      final character = input[i];
      switch (character) {
        case 'C':
          occurrences[0] += 1;
          break;
        case 'G':
          occurrences[1] += 1;
          break;
        case 'T':
          occurrences[2] += 1;
          break;
        case 'A':
          occurrences[3] += 1;
          break;
      }
    }
    return occurrences;
  }
}

