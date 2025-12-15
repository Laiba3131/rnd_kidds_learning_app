import 'math_difficulty_level.dart';

/// Types of math questions that can be generated
/// Each level includes 12-16 exercise types
enum MathQuestionType {
  // Level A types (12-16 exercises)
  counting,
  numberRecognition,
  numberWriting,
  numberSequence,
  patterns,
  bigSmall,
  moreLess,
  numberMatching,
  dotCounting,
  numberComparison,
  missingNumbers,
  numberOrdering,
  quantityComparison,
  numberWords,
  visualCounting,
  numberLine,

  // Level B types (12-16 exercises)
  addition,
  subtraction,
  additionWordProblems,
  subtractionWordProblems,
  shapes,
  shapeProperties,
  ordering,
  numberBonds,
  doubles,
  nearDoubles,
  skipCounting,
  placeValue,
  comparingNumbers,
  evenOdd,
  measurement,
  timeConcepts,

  // Level C types (12-16 exercises)
  twoDigitAddition,
  twoDigitSubtraction,
  twoDigitAdditionWithCarry,
  twoDigitSubtractionWithBorrow,
  fractions,
  fractionComparison,
  wordProblems,
  multiplicationBasics,
  divisionBasics,
  moneyConcepts,
  measurementProblems,
  geometryBasics,
  dataGraphing,
  estimation,
  rounding,
  problemSolving,

  // Level D types (12-16 exercises)
  multiStep,
  advancedFractions,
  fractionOperations,
  logicPatterns,
  algebraBasics,
  decimals,
  percentages,
  ratioProportion,
  advancedWordProblems,
  geometryAdvanced,
  measurementAdvanced,
  dataAnalysis,
  probability,
  numberTheory,
  patternsAdvanced,
  criticalThinking,
}

extension MathQuestionTypeExtension on MathQuestionType {
  /// Get the difficulty level this question type belongs to
  MathDifficultyLevel get difficultyLevel {
    switch (this) {
      // Level A
      case MathQuestionType.counting:
      case MathQuestionType.numberRecognition:
      case MathQuestionType.numberWriting:
      case MathQuestionType.numberSequence:
      case MathQuestionType.patterns:
      case MathQuestionType.bigSmall:
      case MathQuestionType.moreLess:
      case MathQuestionType.numberMatching:
      case MathQuestionType.dotCounting:
      case MathQuestionType.numberComparison:
      case MathQuestionType.missingNumbers:
      case MathQuestionType.numberOrdering:
      case MathQuestionType.quantityComparison:
      case MathQuestionType.numberWords:
      case MathQuestionType.visualCounting:
      case MathQuestionType.numberLine:
        return MathDifficultyLevel.levelA;

      // Level B
      case MathQuestionType.addition:
      case MathQuestionType.subtraction:
      case MathQuestionType.additionWordProblems:
      case MathQuestionType.subtractionWordProblems:
      case MathQuestionType.shapes:
      case MathQuestionType.shapeProperties:
      case MathQuestionType.ordering:
      case MathQuestionType.numberBonds:
      case MathQuestionType.doubles:
      case MathQuestionType.nearDoubles:
      case MathQuestionType.skipCounting:
      case MathQuestionType.placeValue:
      case MathQuestionType.comparingNumbers:
      case MathQuestionType.evenOdd:
      case MathQuestionType.measurement:
      case MathQuestionType.timeConcepts:
        return MathDifficultyLevel.levelB;

      // Level C
      case MathQuestionType.twoDigitAddition:
      case MathQuestionType.twoDigitSubtraction:
      case MathQuestionType.twoDigitAdditionWithCarry:
      case MathQuestionType.twoDigitSubtractionWithBorrow:
      case MathQuestionType.fractions:
      case MathQuestionType.fractionComparison:
      case MathQuestionType.wordProblems:
      case MathQuestionType.multiplicationBasics:
      case MathQuestionType.divisionBasics:
      case MathQuestionType.moneyConcepts:
      case MathQuestionType.measurementProblems:
      case MathQuestionType.geometryBasics:
      case MathQuestionType.dataGraphing:
      case MathQuestionType.estimation:
      case MathQuestionType.rounding:
      case MathQuestionType.problemSolving:
        return MathDifficultyLevel.levelC;

      // Level D
      case MathQuestionType.multiStep:
      case MathQuestionType.advancedFractions:
      case MathQuestionType.fractionOperations:
      case MathQuestionType.logicPatterns:
      case MathQuestionType.algebraBasics:
      case MathQuestionType.decimals:
      case MathQuestionType.percentages:
      case MathQuestionType.ratioProportion:
      case MathQuestionType.advancedWordProblems:
      case MathQuestionType.geometryAdvanced:
      case MathQuestionType.measurementAdvanced:
      case MathQuestionType.dataAnalysis:
      case MathQuestionType.probability:
      case MathQuestionType.numberTheory:
      case MathQuestionType.patternsAdvanced:
      case MathQuestionType.criticalThinking:
        return MathDifficultyLevel.levelD;
    }
  }

  /// Display name for the question type
  String get displayName {
    switch (this) {
      // Level A
      case MathQuestionType.counting:
        return 'Counting';
      case MathQuestionType.numberRecognition:
        return 'Number Recognition';
      case MathQuestionType.numberWriting:
        return 'Number Writing';
      case MathQuestionType.numberSequence:
        return 'Number Sequence';
      case MathQuestionType.patterns:
        return 'Patterns';
      case MathQuestionType.bigSmall:
        return 'Big & Small';
      case MathQuestionType.moreLess:
        return 'More & Less';
      case MathQuestionType.numberMatching:
        return 'Number Matching';
      case MathQuestionType.dotCounting:
        return 'Dot Counting';
      case MathQuestionType.numberComparison:
        return 'Number Comparison';
      case MathQuestionType.missingNumbers:
        return 'Missing Numbers';
      case MathQuestionType.numberOrdering:
        return 'Number Ordering';
      case MathQuestionType.quantityComparison:
        return 'Quantity Comparison';
      case MathQuestionType.numberWords:
        return 'Number Words';
      case MathQuestionType.visualCounting:
        return 'Visual Counting';
      case MathQuestionType.numberLine:
        return 'Number Line';

      // Level B
      case MathQuestionType.addition:
        return 'Addition';
      case MathQuestionType.subtraction:
        return 'Subtraction';
      case MathQuestionType.additionWordProblems:
        return 'Addition Word Problems';
      case MathQuestionType.subtractionWordProblems:
        return 'Subtraction Word Problems';
      case MathQuestionType.shapes:
        return 'Shapes';
      case MathQuestionType.shapeProperties:
        return 'Shape Properties';
      case MathQuestionType.ordering:
        return 'Ordering Numbers';
      case MathQuestionType.numberBonds:
        return 'Number Bonds';
      case MathQuestionType.doubles:
        return 'Doubles';
      case MathQuestionType.nearDoubles:
        return 'Near Doubles';
      case MathQuestionType.skipCounting:
        return 'Skip Counting';
      case MathQuestionType.placeValue:
        return 'Place Value';
      case MathQuestionType.comparingNumbers:
        return 'Comparing Numbers';
      case MathQuestionType.evenOdd:
        return 'Even & Odd';
      case MathQuestionType.measurement:
        return 'Measurement';
      case MathQuestionType.timeConcepts:
        return 'Time Concepts';

      // Level C
      case MathQuestionType.twoDigitAddition:
        return '2-Digit Addition';
      case MathQuestionType.twoDigitSubtraction:
        return '2-Digit Subtraction';
      case MathQuestionType.twoDigitAdditionWithCarry:
        return '2-Digit Addition (Carry)';
      case MathQuestionType.twoDigitSubtractionWithBorrow:
        return '2-Digit Subtraction (Borrow)';
      case MathQuestionType.fractions:
        return 'Fractions';
      case MathQuestionType.fractionComparison:
        return 'Fraction Comparison';
      case MathQuestionType.wordProblems:
        return 'Word Problems';
      case MathQuestionType.multiplicationBasics:
        return 'Multiplication Basics';
      case MathQuestionType.divisionBasics:
        return 'Division Basics';
      case MathQuestionType.moneyConcepts:
        return 'Money Concepts';
      case MathQuestionType.measurementProblems:
        return 'Measurement Problems';
      case MathQuestionType.geometryBasics:
        return 'Geometry Basics';
      case MathQuestionType.dataGraphing:
        return 'Data & Graphing';
      case MathQuestionType.estimation:
        return 'Estimation';
      case MathQuestionType.rounding:
        return 'Rounding';
      case MathQuestionType.problemSolving:
        return 'Problem Solving';

      // Level D
      case MathQuestionType.multiStep:
        return 'Multi-Step Problems';
      case MathQuestionType.advancedFractions:
        return 'Advanced Fractions';
      case MathQuestionType.fractionOperations:
        return 'Fraction Operations';
      case MathQuestionType.logicPatterns:
        return 'Logic Patterns';
      case MathQuestionType.algebraBasics:
        return 'Algebra Basics';
      case MathQuestionType.decimals:
        return 'Decimals';
      case MathQuestionType.percentages:
        return 'Percentages';
      case MathQuestionType.ratioProportion:
        return 'Ratio & Proportion';
      case MathQuestionType.advancedWordProblems:
        return 'Advanced Word Problems';
      case MathQuestionType.geometryAdvanced:
        return 'Advanced Geometry';
      case MathQuestionType.measurementAdvanced:
        return 'Advanced Measurement';
      case MathQuestionType.dataAnalysis:
        return 'Data Analysis';
      case MathQuestionType.probability:
        return 'Probability';
      case MathQuestionType.numberTheory:
        return 'Number Theory';
      case MathQuestionType.patternsAdvanced:
        return 'Advanced Patterns';
      case MathQuestionType.criticalThinking:
        return 'Critical Thinking';
    }
  }
}

