import 'reading_difficulty_level.dart';

/// Types of reading questions that can be generated
enum ReadingQuestionType {
  // Level A types
  letterRecognition,
  letterSound,
  letterWriting,
  uppercaseLowercase,
  beginningSounds,
  endingSounds,
  cvcWords,
  rhymingWords,
  letterMatching,
  soundMatching,
  wordFamilies,
  simpleBlending,

  // Level B types
  sightWords,
  sightWordRecognition,
  blending,
  segmenting,
  basicComprehension,
  pictureWordMatch,
  sentenceCompletion,
  wordOrdering,
  punctuationBasics,
  capitalization,
  readingFluency,
  vocabularyBasics,

  // Level C types
  shortStories,
  storyComprehension,
  vocabulary,
  sentenceBuilding,
  grammarBasics,
  synonyms,
  antonyms,
  contextClues,
  mainIdea,
  storyElements,
  readingInference,
  textFeatures,

  // Level D types
  advancedComprehension,
  readingFluencyAdvanced,
  criticalThinking,
  literaryAnalysis,
  textAnalysis,
  compareContrast,
  causeEffect,
  authorPurpose,
  pointOfView,
  figurativeLanguage,
  readingStrategies,
  writingResponse,
}

extension ReadingQuestionTypeExtension on ReadingQuestionType {
  /// Get the difficulty level this question type belongs to
  ReadingDifficultyLevel get difficultyLevel {
    switch (this) {
      case ReadingQuestionType.letterRecognition:
      case ReadingQuestionType.letterSound:
      case ReadingQuestionType.letterWriting:
      case ReadingQuestionType.uppercaseLowercase:
      case ReadingQuestionType.beginningSounds:
      case ReadingQuestionType.endingSounds:
      case ReadingQuestionType.cvcWords:
      case ReadingQuestionType.rhymingWords:
      case ReadingQuestionType.letterMatching:
      case ReadingQuestionType.soundMatching:
      case ReadingQuestionType.wordFamilies:
      case ReadingQuestionType.simpleBlending:
        return ReadingDifficultyLevel.levelA;

      case ReadingQuestionType.sightWords:
      case ReadingQuestionType.sightWordRecognition:
      case ReadingQuestionType.blending:
      case ReadingQuestionType.segmenting:
      case ReadingQuestionType.basicComprehension:
      case ReadingQuestionType.pictureWordMatch:
      case ReadingQuestionType.sentenceCompletion:
      case ReadingQuestionType.wordOrdering:
      case ReadingQuestionType.punctuationBasics:
      case ReadingQuestionType.capitalization:
      case ReadingQuestionType.readingFluency:
      case ReadingQuestionType.vocabularyBasics:
        return ReadingDifficultyLevel.levelB;

      case ReadingQuestionType.shortStories:
      case ReadingQuestionType.storyComprehension:
      case ReadingQuestionType.vocabulary:
      case ReadingQuestionType.sentenceBuilding:
      case ReadingQuestionType.grammarBasics:
      case ReadingQuestionType.synonyms:
      case ReadingQuestionType.antonyms:
      case ReadingQuestionType.contextClues:
      case ReadingQuestionType.mainIdea:
      case ReadingQuestionType.storyElements:
      case ReadingQuestionType.readingInference:
      case ReadingQuestionType.textFeatures:
        return ReadingDifficultyLevel.levelC;

      case ReadingQuestionType.advancedComprehension:
      case ReadingQuestionType.readingFluencyAdvanced:
      case ReadingQuestionType.criticalThinking:
      case ReadingQuestionType.literaryAnalysis:
      case ReadingQuestionType.textAnalysis:
      case ReadingQuestionType.compareContrast:
      case ReadingQuestionType.causeEffect:
      case ReadingQuestionType.authorPurpose:
      case ReadingQuestionType.pointOfView:
      case ReadingQuestionType.figurativeLanguage:
      case ReadingQuestionType.readingStrategies:
      case ReadingQuestionType.writingResponse:
        return ReadingDifficultyLevel.levelD;
    }
  }

  /// Display name for the question type
  String get displayName {
    switch (this) {
      case ReadingQuestionType.letterRecognition:
        return 'Letter Recognition';
      case ReadingQuestionType.letterSound:
        return 'Letter Sound';
      case ReadingQuestionType.letterWriting:
        return 'Letter Writing';
      case ReadingQuestionType.uppercaseLowercase:
        return 'Uppercase & Lowercase';
      case ReadingQuestionType.beginningSounds:
        return 'Beginning Sounds';
      case ReadingQuestionType.endingSounds:
        return 'Ending Sounds';
      case ReadingQuestionType.cvcWords:
        return 'CVC Words';
      case ReadingQuestionType.rhymingWords:
        return 'Rhyming Words';
      case ReadingQuestionType.letterMatching:
        return 'Letter Matching';
      case ReadingQuestionType.soundMatching:
        return 'Sound Matching';
      case ReadingQuestionType.wordFamilies:
        return 'Word Families';
      case ReadingQuestionType.simpleBlending:
        return 'Simple Blending';

      case ReadingQuestionType.sightWords:
        return 'Sight Words';
      case ReadingQuestionType.sightWordRecognition:
        return 'Sight Word Recognition';
      case ReadingQuestionType.blending:
        return 'Blending';
      case ReadingQuestionType.segmenting:
        return 'Segmenting';
      case ReadingQuestionType.basicComprehension:
        return 'Basic Comprehension';
      case ReadingQuestionType.pictureWordMatch:
        return 'Picture-Word Match';
      case ReadingQuestionType.sentenceCompletion:
        return 'Sentence Completion';
      case ReadingQuestionType.wordOrdering:
        return 'Word Ordering';
      case ReadingQuestionType.punctuationBasics:
        return 'Punctuation Basics';
      case ReadingQuestionType.capitalization:
        return 'Capitalization';
      case ReadingQuestionType.readingFluency:
        return 'Reading Fluency';
      case ReadingQuestionType.vocabularyBasics:
        return 'Vocabulary Basics';

      case ReadingQuestionType.shortStories:
        return 'Short Stories';
      case ReadingQuestionType.storyComprehension:
        return 'Story Comprehension';
      case ReadingQuestionType.vocabulary:
        return 'Vocabulary';
      case ReadingQuestionType.sentenceBuilding:
        return 'Sentence Building';
      case ReadingQuestionType.grammarBasics:
        return 'Grammar Basics';
      case ReadingQuestionType.synonyms:
        return 'Synonyms';
      case ReadingQuestionType.antonyms:
        return 'Antonyms';
      case ReadingQuestionType.contextClues:
        return 'Context Clues';
      case ReadingQuestionType.mainIdea:
        return 'Main Idea';
      case ReadingQuestionType.storyElements:
        return 'Story Elements';
      case ReadingQuestionType.readingInference:
        return 'Reading Inference';
      case ReadingQuestionType.textFeatures:
        return 'Text Features';

      case ReadingQuestionType.advancedComprehension:
        return 'Advanced Comprehension';
      case ReadingQuestionType.readingFluencyAdvanced:
        return 'Advanced Reading Fluency';
      case ReadingQuestionType.criticalThinking:
        return 'Critical Thinking';
      case ReadingQuestionType.literaryAnalysis:
        return 'Literary Analysis';
      case ReadingQuestionType.textAnalysis:
        return 'Text Analysis';
      case ReadingQuestionType.compareContrast:
        return 'Compare & Contrast';
      case ReadingQuestionType.causeEffect:
        return 'Cause & Effect';
      case ReadingQuestionType.authorPurpose:
        return 'Author\'s Purpose';
      case ReadingQuestionType.pointOfView:
        return 'Point of View';
      case ReadingQuestionType.figurativeLanguage:
        return 'Figurative Language';
      case ReadingQuestionType.readingStrategies:
        return 'Reading Strategies';
      case ReadingQuestionType.writingResponse:
        return 'Writing Response';
    }
  }
}

