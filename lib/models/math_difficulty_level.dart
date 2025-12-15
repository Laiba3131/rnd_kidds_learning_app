/// Math Difficulty Levels aligned with learning frameworks
/// Each level corresponds to specific age ranges and learning objectives
enum MathDifficultyLevel {
  /// Level A: Ages 4-5
  /// - Counting 1-10
  /// - Number recognition
  /// - Patterns
  /// - Big/small concepts
  levelA,

  /// Level B: Ages 5-6
  /// - Addition/Subtraction 1-20
  /// - Shapes
  /// - Ordering numbers
  levelB,

  /// Level C: Ages 7-8
  /// - 2-digit addition/subtraction
  /// - Fractions
  /// - Word problems
  levelC,

  /// Level D: Ages 9-10
  /// - Multi-step problems
  /// - Advanced fractions
  /// - Logic patterns
  levelD,
}

extension MathDifficultyLevelExtension on MathDifficultyLevel {
  /// Age range for this difficulty level
  String get ageRange {
    switch (this) {
      case MathDifficultyLevel.levelA:
        return 'Ages 4-5';
      case MathDifficultyLevel.levelB:
        return 'Ages 5-6';
      case MathDifficultyLevel.levelC:
        return 'Ages 7-8';
      case MathDifficultyLevel.levelD:
        return 'Ages 9-10';
    }
  }

  /// Display name for the level
  String get displayName {
    switch (this) {
      case MathDifficultyLevel.levelA:
        return 'Level A';
      case MathDifficultyLevel.levelB:
        return 'Level B';
      case MathDifficultyLevel.levelC:
        return 'Level C';
      case MathDifficultyLevel.levelD:
        return 'Level D';
    }
  }

  /// Learning objectives for this level
  List<String> get learningObjectives {
    switch (this) {
      case MathDifficultyLevel.levelA:
        return [
          'Counting 1-10',
          'Number recognition',
          'Patterns',
          'Big/small concepts',
        ];
      case MathDifficultyLevel.levelB:
        return [
          'Addition/Subtraction 1-20',
          'Shapes',
          'Ordering numbers',
        ];
      case MathDifficultyLevel.levelC:
        return [
          '2-digit addition/subtraction',
          'Fractions',
          'Word problems',
        ];
      case MathDifficultyLevel.levelD:
        return [
          'Multi-step problems',
          'Advanced fractions',
          'Logic patterns',
        ];
    }
  }
}

