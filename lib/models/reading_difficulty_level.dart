/// Reading Difficulty Levels aligned with learning frameworks
/// Each level corresponds to specific age ranges and learning objectives
enum ReadingDifficultyLevel {
  /// Level A: Ages 4-5
  /// - Letter recognition
  /// - Phonics
  /// - CVC words
  levelA,

  /// Level B: Ages 5-6
  /// - Sight words
  /// - Blending
  /// - Basic comprehension
  levelB,

  /// Level C: Ages 7-8
  /// - Short stories
  /// - Vocabulary
  /// - Sentence building
  levelC,

  /// Level D: Ages 9-10
  /// - Advanced comprehension
  /// - Reading fluency
  /// - Critical thinking
  levelD,
}

extension ReadingDifficultyLevelExtension on ReadingDifficultyLevel {
  /// Age range for this difficulty level
  String get ageRange {
    switch (this) {
      case ReadingDifficultyLevel.levelA:
        return 'Ages 4-5';
      case ReadingDifficultyLevel.levelB:
        return 'Ages 5-6';
      case ReadingDifficultyLevel.levelC:
        return 'Ages 7-8';
      case ReadingDifficultyLevel.levelD:
        return 'Ages 9-10';
    }
  }

  /// Display name for the level
  String get displayName {
    switch (this) {
      case ReadingDifficultyLevel.levelA:
        return 'Level A';
      case ReadingDifficultyLevel.levelB:
        return 'Level B';
      case ReadingDifficultyLevel.levelC:
        return 'Level C';
      case ReadingDifficultyLevel.levelD:
        return 'Level D';
    }
  }

  /// Learning objectives for this level
  List<String> get learningObjectives {
    switch (this) {
      case ReadingDifficultyLevel.levelA:
        return [
          'Letter recognition',
          'Phonics',
          'CVC words',
        ];
      case ReadingDifficultyLevel.levelB:
        return [
          'Sight words',
          'Blending',
          'Basic comprehension',
        ];
      case ReadingDifficultyLevel.levelC:
        return [
          'Short stories',
          'Vocabulary',
          'Sentence building',
        ];
      case ReadingDifficultyLevel.levelD:
        return [
          'Advanced comprehension',
          'Reading fluency',
          'Critical thinking',
        ];
    }
  }
}

