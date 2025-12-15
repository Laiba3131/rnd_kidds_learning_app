import 'dart:math';
import '../models/math_question.dart';
import '../models/math_question_type.dart';
import '../models/math_difficulty_level.dart';

/// Service responsible for generating math questions based on difficulty level and type
/// This is the core engine that creates questions aligned with learning frameworks
class MathQuestionGenerator {
  final Random _random = Random();

  /// Generate a random question of the specified type
  MathQuestion generateQuestion(MathQuestionType type) {
    switch (type) {
      // Level A questions
      case MathQuestionType.counting:
      case MathQuestionType.visualCounting:
      case MathQuestionType.dotCounting:
        return _generateCountingQuestion();
      case MathQuestionType.numberRecognition:
        return _generateNumberRecognitionQuestion();
      case MathQuestionType.numberWriting:
        return _generateNumberWritingQuestion();
      case MathQuestionType.numberSequence:
      case MathQuestionType.missingNumbers:
        return _generateNumberSequenceQuestion();
      case MathQuestionType.patterns:
        return _generatePatternQuestion();
      case MathQuestionType.bigSmall:
      case MathQuestionType.moreLess:
      case MathQuestionType.numberComparison:
      case MathQuestionType.quantityComparison:
        return _generateBigSmallQuestion();
      case MathQuestionType.numberMatching:
        return _generateNumberMatchingQuestion();
      case MathQuestionType.numberOrdering:
      case MathQuestionType.numberLine:
        return _generateOrderingQuestion();
      case MathQuestionType.numberWords:
        return _generateNumberWordsQuestion();

      // Level B questions
      case MathQuestionType.addition:
      case MathQuestionType.doubles:
      case MathQuestionType.nearDoubles:
        return _generateAdditionQuestion();
      case MathQuestionType.subtraction:
        return _generateSubtractionQuestion();
      case MathQuestionType.additionWordProblems:
      case MathQuestionType.subtractionWordProblems:
        return _generateWordProblemQuestion();
      case MathQuestionType.shapes:
      case MathQuestionType.shapeProperties:
        return _generateShapeQuestion();
      case MathQuestionType.ordering:
        return _generateOrderingQuestion();
      case MathQuestionType.numberBonds:
        return _generateNumberBondsQuestion();
      case MathQuestionType.skipCounting:
        return _generateSkipCountingQuestion();
      case MathQuestionType.placeValue:
        return _generatePlaceValueQuestion();
      case MathQuestionType.comparingNumbers:
        return _generateComparingNumbersQuestion();
      case MathQuestionType.evenOdd:
        return _generateEvenOddQuestion();
      case MathQuestionType.measurement:
      case MathQuestionType.timeConcepts:
        return _generateMeasurementQuestion();

      // Level C questions
      case MathQuestionType.twoDigitAddition:
      case MathQuestionType.twoDigitAdditionWithCarry:
        return _generateTwoDigitAdditionQuestion();
      case MathQuestionType.twoDigitSubtraction:
      case MathQuestionType.twoDigitSubtractionWithBorrow:
        return _generateTwoDigitSubtractionQuestion();
      case MathQuestionType.fractions:
      case MathQuestionType.fractionComparison:
        return _generateFractionQuestion();
      case MathQuestionType.wordProblems:
        return _generateWordProblemQuestion();
      case MathQuestionType.multiplicationBasics:
        return _generateMultiplicationQuestion();
      case MathQuestionType.divisionBasics:
        return _generateDivisionQuestion();
      case MathQuestionType.moneyConcepts:
      case MathQuestionType.measurementProblems:
        return _generateMeasurementQuestion();
      case MathQuestionType.geometryBasics:
        return _generateGeometryQuestion();
      case MathQuestionType.dataGraphing:
        return _generateDataGraphingQuestion();
      case MathQuestionType.estimation:
      case MathQuestionType.rounding:
        return _generateEstimationQuestion();
      case MathQuestionType.problemSolving:
        return _generateWordProblemQuestion();

      // Level D questions
      case MathQuestionType.multiStep:
        return _generateMultiStepQuestion();
      case MathQuestionType.advancedFractions:
      case MathQuestionType.fractionOperations:
        return _generateAdvancedFractionQuestion();
      case MathQuestionType.logicPatterns:
      case MathQuestionType.patternsAdvanced:
        return _generateLogicPatternQuestion();
      case MathQuestionType.algebraBasics:
        return _generateAlgebraQuestion();
      case MathQuestionType.decimals:
        return _generateDecimalQuestion();
      case MathQuestionType.percentages:
        return _generatePercentageQuestion();
      case MathQuestionType.ratioProportion:
        return _generateRatioQuestion();
      case MathQuestionType.advancedWordProblems:
        return _generateWordProblemQuestion();
      case MathQuestionType.geometryAdvanced:
        return _generateGeometryQuestion();
      case MathQuestionType.measurementAdvanced:
        return _generateMeasurementQuestion();
      case MathQuestionType.dataAnalysis:
        return _generateDataGraphingQuestion();
      case MathQuestionType.probability:
        return _generateProbabilityQuestion();
      case MathQuestionType.numberTheory:
        return _generateNumberTheoryQuestion();
      case MathQuestionType.criticalThinking:
        return _generateMultiStepQuestion();
    }
  }

  /// Generate a random question for a difficulty level
  MathQuestion generateQuestionForLevel(MathDifficultyLevel level) {
    final typesForLevel = MathQuestionType.values
        .where((type) => type.difficultyLevel == level)
        .toList();
    final randomType = typesForLevel[_random.nextInt(typesForLevel.length)];
    return generateQuestion(randomType);
  }

  // ========== Level A Question Generators ==========

  MathQuestion _generateCountingQuestion() {
    final count = _random.nextInt(10) + 1; // 1-10
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.counting,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'Count the objects. How many are there?',
      correctAnswer: count,
      explanation: 'Great job! There are $count objects.',
      metadata: {'count': count},
    );
  }

  MathQuestion _generateNumberRecognitionQuestion() {
    final number = _random.nextInt(10) + 1; // 1-10
    final options = List.generate(4, (i) {
      if (i == 0) return number.toString();
      int wrongAnswer;
      do {
        wrongAnswer = _random.nextInt(10) + 1;
      } while (wrongAnswer == number);
      return wrongAnswer.toString();
    })..shuffle(_random);

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberRecognition,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'Which number is $number?',
      options: options,
      correctAnswer: number.toString(),
      explanation: 'Correct! $number is the number.',
      metadata: {'number': number},
    );
  }

  MathQuestion _generatePatternQuestion() {
    final patterns = [
      {'sequence': [1, 2, 3, 4], 'next': 5, 'pattern': 'counting up'},
      {'sequence': [2, 4, 6, 8], 'next': 10, 'pattern': 'counting by 2s'},
      {'sequence': [5, 4, 3, 2], 'next': 1, 'pattern': 'counting down'},
      {'sequence': [1, 3, 5, 7], 'next': 9, 'pattern': 'odd numbers'},
    ];
    final pattern = patterns[_random.nextInt(patterns.length)];
    final sequence = pattern['sequence'] as List<int>;
    final next = pattern['next'] as int;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.patterns,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'What comes next? ${sequence.join(", ")}',
      options: [
        next.toString(),
        (next + 1).toString(),
        (next - 1).toString(),
        (next + 2).toString(),
      ]..shuffle(_random),
      correctAnswer: next.toString(),
      explanation: 'Great! The pattern continues with $next.',
      metadata: {'sequence': sequence, 'next': next},
    );
  }

  MathQuestion _generateBigSmallQuestion() {
    final num1 = _random.nextInt(10) + 1;
    final num2 = _random.nextInt(10) + 1;
    final isBigger = num1 > num2;
    final question = isBigger
        ? 'Which number is bigger: $num1 or $num2?'
        : 'Which number is smaller: $num1 or $num2?';
    final answer = isBigger ? num1 : num2;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.bigSmall,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: question,
      options: [num1.toString(), num2.toString()]..shuffle(_random),
      correctAnswer: answer.toString(),
      explanation: 'Correct! $answer is ${isBigger ? "bigger" : "smaller"}.',
      metadata: {'num1': num1, 'num2': num2, 'isBigger': isBigger},
    );
  }

  // ========== Level B Question Generators ==========

  MathQuestion _generateAdditionQuestion() {
    final a = _random.nextInt(15) + 1; // 1-15
    final b = _random.nextInt(20 - a) + 1; // Ensures sum <= 20
    final sum = a + b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.addition,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'What is $a + $b?',
      correctAnswer: sum,
      explanation: 'Great! $a + $b = $sum.',
      metadata: {'a': a, 'b': b, 'sum': sum},
    );
  }

  MathQuestion _generateSubtractionQuestion() {
    final a = _random.nextInt(20) + 1; // 1-20
    final b = _random.nextInt(a) + 1; // Ensures result >= 0
    final difference = a - b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.subtraction,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'What is $a - $b?',
      correctAnswer: difference,
      explanation: 'Excellent! $a - $b = $difference.',
      metadata: {'a': a, 'b': b, 'difference': difference},
    );
  }

  MathQuestion _generateShapeQuestion() {
    final shapes = ['circle', 'square', 'triangle', 'rectangle'];
    final shape = shapes[_random.nextInt(shapes.length)];

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.shapes,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'What shape has ${_getShapeDescription(shape)}?',
      options: List.from(shapes)..shuffle(_random),
      correctAnswer: shape,
      explanation: 'Correct! That is a $shape.',
      metadata: {'shape': shape},
    );
  }

  MathQuestion _generateOrderingQuestion() {
    final numbers = List.generate(3, (_) => _random.nextInt(20) + 1);
    numbers.sort();
    final shuffled = List<int>.from(numbers)..shuffle(_random);

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.ordering,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'Put these numbers in order from smallest to biggest: ${shuffled.join(", ")}',
      correctAnswer: numbers,
      explanation: 'Perfect! The order is ${numbers.join(", ")}.',
      metadata: {'numbers': shuffled, 'ordered': numbers},
    );
  }

  // ========== Level C Question Generators ==========

  MathQuestion _generateTwoDigitAdditionQuestion() {
    final a = _random.nextInt(90) + 10; // 10-99
    final b = _random.nextInt(90) + 10; // 10-99
    final sum = a + b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.twoDigitAddition,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What is $a + $b?',
      correctAnswer: sum,
      explanation: 'Well done! $a + $b = $sum.',
      metadata: {'a': a, 'b': b, 'sum': sum},
    );
  }

  MathQuestion _generateTwoDigitSubtractionQuestion() {
    final a = _random.nextInt(90) + 10; // 10-99
    final b = _random.nextInt(a - 10) + 1; // Ensures positive result
    final difference = a - b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.twoDigitSubtraction,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What is $a - $b?',
      correctAnswer: difference,
      explanation: 'Excellent! $a - $b = $difference.',
      metadata: {'a': a, 'b': b, 'difference': difference},
    );
  }

  MathQuestion _generateFractionQuestion() {
    final numerator = _random.nextInt(3) + 1; // 1-3
    final denominator = _random.nextInt(3) + 2; // 2-4
    final fraction = '$numerator/$denominator';

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.fractions,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What fraction is shown? (e.g., 1/2)',
      options: [
        fraction,
        '${numerator + 1}/$denominator',
        '$numerator/${denominator + 1}',
        '${numerator - 1}/$denominator',
      ]..shuffle(_random),
      correctAnswer: fraction,
      explanation: 'Correct! The fraction is $fraction.',
      metadata: {'numerator': numerator, 'denominator': denominator},
    );
  }

  MathQuestion _generateWordProblemQuestion() {
    final problems = [
      {
        'text': 'Emma has 5 apples. She gives 2 to her friend. How many apples does Emma have left?',
        'answer': 3,
        'type': 'subtraction',
      },
      {
        'text': 'Tom has 3 toy cars. His mom gives him 4 more. How many toy cars does Tom have now?',
        'answer': 7,
        'type': 'addition',
      },
      {
        'text': 'There are 8 birds on a tree. 3 birds fly away. How many birds are left?',
        'answer': 5,
        'type': 'subtraction',
      },
    ];
    final problem = problems[_random.nextInt(problems.length)];

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.wordProblems,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: problem['text'] as String,
      correctAnswer: problem['answer'] as int,
      explanation: 'Great thinking! The answer is ${problem['answer']}.',
      metadata: problem,
    );
  }

  // ========== Level D Question Generators ==========

  MathQuestion _generateMultiStepQuestion() {
    final a = _random.nextInt(10) + 1;
    final b = _random.nextInt(10) + 1;
    final c = _random.nextInt(10) + 1;
    final answer = a + b - c;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.multiStep,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'First add $a and $b, then subtract $c. What is the answer?',
      correctAnswer: answer,
      explanation: 'Perfect! ($a + $b) - $c = ${a + b} - $c = $answer.',
      metadata: {'a': a, 'b': b, 'c': c, 'answer': answer},
    );
  }

  MathQuestion _generateAdvancedFractionQuestion() {
    final num1 = _random.nextInt(3) + 1;
    final den1 = _random.nextInt(3) + 2;
    final num2 = _random.nextInt(3) + 1;
    final den2 = den1; // Same denominator for simplicity
    final sumNum = num1 + num2;
    final answer = '$sumNum/$den1';

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.advancedFractions,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'What is $num1/$den1 + $num2/$den2?',
      correctAnswer: answer,
      explanation: 'Excellent! $num1/$den1 + $num2/$den2 = $answer.',
      metadata: {
        'num1': num1,
        'den1': den1,
        'num2': num2,
        'den2': den2,
        'answer': answer,
      },
    );
  }

  MathQuestion _generateLogicPatternQuestion() {
    final patterns = [
      {
        'sequence': [2, 4, 8, 16],
        'next': 32,
        'pattern': 'doubling',
      },
      {
        'sequence': [1, 4, 9, 16],
        'next': 25,
        'pattern': 'squares',
      },
      {
        'sequence': [3, 6, 9, 12],
        'next': 15,
        'pattern': 'multiples of 3',
      },
    ];
    final pattern = patterns[_random.nextInt(patterns.length)];
    final sequence = pattern['sequence'] as List<int>;
    final next = pattern['next'] as int;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.logicPatterns,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'What number comes next in this pattern? ${sequence.join(", ")}',
      options: [
        next.toString(),
        (next + 5).toString(),
        (next - 5).toString(),
        (next * 2).toString(),
      ]..shuffle(_random),
      correctAnswer: next.toString(),
      explanation: 'Brilliant! The pattern continues with $next.',
      metadata: pattern,
    );
  }

  // ========== Additional Generator Methods ==========

  MathQuestion _generateNumberWritingQuestion() {
    final number = _random.nextInt(10) + 1;
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberWriting,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'Write the number $number',
      correctAnswer: number.toString(),
      explanation: 'Great! You wrote $number.',
      metadata: {'number': number},
    );
  }

  MathQuestion _generateNumberSequenceQuestion() {
    final start = _random.nextInt(5) + 1;
    final sequence = [start, start + 1, start + 2, start + 3];
    final missing = sequence[_random.nextInt(sequence.length)];
    final questionSequence = List<int>.from(sequence)..[sequence.indexOf(missing)] = 0;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberSequence,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'What number is missing? ${questionSequence.join(", ")}',
      correctAnswer: missing,
      explanation: 'Correct! The missing number is $missing.',
      metadata: {'sequence': sequence, 'missing': missing},
    );
  }

  MathQuestion _generateNumberMatchingQuestion() {
    final number = _random.nextInt(10) + 1;
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberMatching,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'Match the number $number',
      options: [number.toString(), (number + 1).toString(), (number - 1).toString(), (number + 2).toString()]..shuffle(_random),
      correctAnswer: number.toString(),
      explanation: 'Perfect match!',
      metadata: {'number': number},
    );
  }

  MathQuestion _generateNumberWordsQuestion() {
    final numberWords = {
      1: 'one',
      2: 'two',
      3: 'three',
      4: 'four',
      5: 'five',
    };
    final number = numberWords.keys.elementAt(_random.nextInt(numberWords.length));
    final word = numberWords[number]!;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberWords,
      difficultyLevel: MathDifficultyLevel.levelA,
      questionText: 'What is the word for $number?',
      options: [word, 'one', 'two', 'three']..shuffle(_random),
      correctAnswer: word,
      explanation: 'Correct! $number is "$word".',
      metadata: {'number': number, 'word': word},
    );
  }

  MathQuestion _generateNumberBondsQuestion() {
    final total = _random.nextInt(10) + 5; // 5-15
    final part1 = _random.nextInt(total - 1) + 1;
    final part2 = total - part1;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberBonds,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'If $total = $part1 + ?, what is ?',
      correctAnswer: part2,
      explanation: 'Great! $part1 + $part2 = $total.',
      metadata: {'total': total, 'part1': part1, 'part2': part2},
    );
  }

  MathQuestion _generateSkipCountingQuestion() {
    final skip = _random.nextBool() ? 2 : 5;
    final start = _random.nextInt(5) + 1;
    final sequence = [start, start + skip, start + skip * 2, start + skip * 3];

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.skipCounting,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'Count by $skip: ${sequence.take(3).join(", ")}',
      options: [sequence[3].toString(), (sequence[3] + 1).toString(), (sequence[3] - 1).toString(), (sequence[3] + skip).toString()]..shuffle(_random),
      correctAnswer: sequence[3].toString(),
      explanation: 'Perfect! The next number is ${sequence[3]}.',
      metadata: {'skip': skip, 'sequence': sequence},
    );
  }

  MathQuestion _generatePlaceValueQuestion() {
    final number = _random.nextInt(90) + 10; // 10-99
    final tens = number ~/ 10;
    final ones = number % 10;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.placeValue,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'In the number $number, how many tens?',
      correctAnswer: tens,
      explanation: 'Correct! $number has $tens tens.',
      metadata: {'number': number, 'tens': tens, 'ones': ones},
    );
  }

  MathQuestion _generateComparingNumbersQuestion() {
    final a = _random.nextInt(20) + 1;
    final b = _random.nextInt(20) + 1;
    final isGreater = a > b;
    final answer = isGreater ? a : b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.comparingNumbers,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'Which is ${isGreater ? "greater" : "less"}: $a or $b?',
      options: [a.toString(), b.toString()]..shuffle(_random),
      correctAnswer: answer.toString(),
      explanation: 'Correct! $answer is ${isGreater ? "greater" : "less"}.',
      metadata: {'a': a, 'b': b, 'isGreater': isGreater},
    );
  }

  MathQuestion _generateEvenOddQuestion() {
    final number = _random.nextInt(20) + 1;
    final isEven = number % 2 == 0;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.evenOdd,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: 'Is $number even or odd?',
      options: [isEven ? 'even' : 'odd', 'even', 'odd']..shuffle(_random),
      correctAnswer: isEven ? 'even' : 'odd',
      explanation: 'Correct! $number is ${isEven ? "even" : "odd"}.',
      metadata: {'number': number, 'isEven': isEven},
    );
  }

  MathQuestion _generateMeasurementQuestion() {
    final measurements = [
      {'question': 'How many inches in a foot?', 'answer': '12'},
      {'question': 'How many days in a week?', 'answer': '7'},
    ];
    final measurement = measurements[_random.nextInt(measurements.length)];

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.measurement,
      difficultyLevel: MathDifficultyLevel.levelB,
      questionText: measurement['question'] as String,
      options: [measurement['answer'] as String, '10', '5', '8']..shuffle(_random),
      correctAnswer: measurement['answer'],
      explanation: 'Correct!',
      metadata: measurement,
    );
  }

  MathQuestion _generateMultiplicationQuestion() {
    final a = _random.nextInt(5) + 1; // 1-5
    final b = _random.nextInt(5) + 1; // 1-5
    final product = a * b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.multiplicationBasics,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What is $a × $b?',
      correctAnswer: product,
      explanation: 'Great! $a × $b = $product.',
      metadata: {'a': a, 'b': b, 'product': product},
    );
  }

  MathQuestion _generateDivisionQuestion() {
    final product = _random.nextInt(20) + 4; // 4-24
    final divisor = _random.nextInt(4) + 2; // 2-5
    final dividend = product * divisor;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.divisionBasics,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What is $dividend ÷ $divisor?',
      correctAnswer: product,
      explanation: 'Excellent! $dividend ÷ $divisor = $product.',
      metadata: {'dividend': dividend, 'divisor': divisor, 'quotient': product},
    );
  }

  MathQuestion _generateGeometryQuestion() {
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.geometryBasics,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'How many sides does a triangle have?',
      options: ['3', '4', '5', '6']..shuffle(_random),
      correctAnswer: '3',
      explanation: 'Correct! A triangle has 3 sides.',
      metadata: {},
    );
  }

  MathQuestion _generateDataGraphingQuestion() {
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.dataGraphing,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'What is a bar graph used for?',
      options: ['Showing data', 'Drawing pictures', 'Writing stories', 'Playing games']..shuffle(_random),
      correctAnswer: 'Showing data',
      explanation: 'Correct! Bar graphs show data.',
      metadata: {},
    );
  }

  MathQuestion _generateEstimationQuestion() {
    final number = _random.nextInt(50) + 10; // 10-60
    final estimate = (number / 10).round() * 10;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.estimation,
      difficultyLevel: MathDifficultyLevel.levelC,
      questionText: 'Estimate $number to the nearest 10',
      correctAnswer: estimate,
      explanation: 'Good estimate! $number is close to $estimate.',
      metadata: {'number': number, 'estimate': estimate},
    );
  }

  MathQuestion _generateAlgebraQuestion() {
    final a = _random.nextInt(5) + 1;
    final b = _random.nextInt(5) + 1;
    final sum = a + b;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.algebraBasics,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'If x + $a = $sum, what is x?',
      correctAnswer: b,
      explanation: 'Correct! x = $b.',
      metadata: {'a': a, 'b': b, 'sum': sum},
    );
  }

  MathQuestion _generateDecimalQuestion() {
    final decimal = 0.5;

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.decimals,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'What is 1/2 as a decimal?',
      options: ['0.5', '0.2', '0.3', '0.4']..shuffle(_random),
      correctAnswer: '0.5',
      explanation: 'Correct! 1/2 = 0.5.',
      metadata: {'decimal': decimal},
    );
  }

  MathQuestion _generatePercentageQuestion() {
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.percentages,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'What is 50% of 100?',
      correctAnswer: 50,
      explanation: 'Correct! 50% of 100 is 50.',
      metadata: {},
    );
  }

  MathQuestion _generateRatioQuestion() {
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.ratioProportion,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'If there are 2 apples for every 3 oranges, what is the ratio?',
      options: ['2:3', '3:2', '2:5', '5:2']..shuffle(_random),
      correctAnswer: '2:3',
      explanation: 'Correct! The ratio is 2:3.',
      metadata: {},
    );
  }

  MathQuestion _generateProbabilityQuestion() {
    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.probability,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'If you flip a coin, what is the probability of getting heads?',
      options: ['1/2', '1/4', '1/3', '2/3']..shuffle(_random),
      correctAnswer: '1/2',
      explanation: 'Correct! The probability is 1/2.',
      metadata: {},
    );
  }

  MathQuestion _generateNumberTheoryQuestion() {
    final number = _random.nextInt(10) + 2; // 2-11
    final isPrime = [2, 3, 5, 7, 11].contains(number);

    return MathQuestion(
      id: _generateId(),
      type: MathQuestionType.numberTheory,
      difficultyLevel: MathDifficultyLevel.levelD,
      questionText: 'Is $number a prime number?',
      options: [isPrime ? 'Yes' : 'No', 'Yes', 'No']..shuffle(_random),
      correctAnswer: isPrime ? 'Yes' : 'No',
      explanation: isPrime ? 'Correct! $number is prime.' : 'Correct! $number is not prime.',
      metadata: {'number': number, 'isPrime': isPrime},
    );
  }

  // ========== Helper Methods ==========

  String _generateId() {
    return 'q_${DateTime.now().millisecondsSinceEpoch}_${_random.nextInt(1000)}';
  }

  String _getShapeDescription(String shape) {
    switch (shape) {
      case 'circle':
        return 'no corners and is round';
      case 'square':
        return '4 equal sides';
      case 'triangle':
        return '3 sides';
      case 'rectangle':
        return '4 sides with opposite sides equal';
      default:
        return 'unique properties';
    }
  }
}

