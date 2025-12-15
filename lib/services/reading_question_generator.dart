import 'dart:math';
import '../models/reading_question.dart';
import '../models/reading_question_type.dart';
import '../models/reading_difficulty_level.dart';

/// Service responsible for generating reading questions based on difficulty level and type
class ReadingQuestionGenerator {
  final Random _random = Random();

  // Common word lists
  final List<String> _cvcWords = ['cat', 'dog', 'hat', 'sun', 'cup', 'bed', 'pig', 'fox', 'bus', 'pen'];
  final List<String> _sightWords = ['the', 'and', 'is', 'it', 'you', 'that', 'he', 'was', 'for', 'on', 'are', 'as', 'with', 'his', 'they'];
  final List<String> _letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

  /// Generate a random question of the specified type
  ReadingQuestion generateQuestion(ReadingQuestionType type) {
    switch (type) {
      // Level A questions
      case ReadingQuestionType.letterRecognition:
        return _generateLetterRecognitionQuestion();
      case ReadingQuestionType.letterSound:
        return _generateLetterSoundQuestion();
      case ReadingQuestionType.cvcWords:
        return _generateCVCWordQuestion();
      case ReadingQuestionType.rhymingWords:
        return _generateRhymingWordQuestion();
      case ReadingQuestionType.beginningSounds:
        return _generateBeginningSoundQuestion();
      case ReadingQuestionType.endingSounds:
        return _generateEndingSoundQuestion();
      case ReadingQuestionType.uppercaseLowercase:
        return _generateUppercaseLowercaseQuestion();
      case ReadingQuestionType.letterMatching:
        return _generateLetterMatchingQuestion();
      case ReadingQuestionType.soundMatching:
        return _generateSoundMatchingQuestion();
      case ReadingQuestionType.wordFamilies:
        return _generateWordFamilyQuestion();
      case ReadingQuestionType.simpleBlending:
        return _generateSimpleBlendingQuestion();
      case ReadingQuestionType.letterWriting:
        return _generateLetterWritingQuestion();

      // Level B questions
      case ReadingQuestionType.sightWords:
        return _generateSightWordQuestion();
      case ReadingQuestionType.sightWordRecognition:
        return _generateSightWordRecognitionQuestion();
      case ReadingQuestionType.blending:
        return _generateBlendingQuestion();
      case ReadingQuestionType.segmenting:
        return _generateSegmentingQuestion();
      case ReadingQuestionType.basicComprehension:
        return _generateBasicComprehensionQuestion();
      case ReadingQuestionType.pictureWordMatch:
        return _generatePictureWordMatchQuestion();
      case ReadingQuestionType.sentenceCompletion:
        return _generateSentenceCompletionQuestion();
      case ReadingQuestionType.wordOrdering:
        return _generateWordOrderingQuestion();
      case ReadingQuestionType.punctuationBasics:
        return _generatePunctuationQuestion();
      case ReadingQuestionType.capitalization:
        return _generateCapitalizationQuestion();
      case ReadingQuestionType.readingFluency:
        return _generateReadingFluencyQuestion();
      case ReadingQuestionType.vocabularyBasics:
        return _generateVocabularyBasicsQuestion();

      // Level C questions
      case ReadingQuestionType.shortStories:
        return _generateShortStoryQuestion();
      case ReadingQuestionType.storyComprehension:
        return _generateStoryComprehensionQuestion();
      case ReadingQuestionType.vocabulary:
        return _generateVocabularyQuestion();
      case ReadingQuestionType.sentenceBuilding:
        return _generateSentenceBuildingQuestion();
      case ReadingQuestionType.grammarBasics:
        return _generateGrammarQuestion();
      case ReadingQuestionType.synonyms:
        return _generateSynonymQuestion();
      case ReadingQuestionType.antonyms:
        return _generateAntonymQuestion();
      case ReadingQuestionType.contextClues:
        return _generateContextClueQuestion();
      case ReadingQuestionType.mainIdea:
        return _generateMainIdeaQuestion();
      case ReadingQuestionType.storyElements:
        return _generateStoryElementsQuestion();
      case ReadingQuestionType.readingInference:
        return _generateInferenceQuestion();
      case ReadingQuestionType.textFeatures:
        return _generateTextFeaturesQuestion();

      // Level D questions
      case ReadingQuestionType.advancedComprehension:
        return _generateAdvancedComprehensionQuestion();
      case ReadingQuestionType.readingFluencyAdvanced:
        return _generateAdvancedFluencyQuestion();
      case ReadingQuestionType.criticalThinking:
        return _generateCriticalThinkingQuestion();
      case ReadingQuestionType.literaryAnalysis:
        return _generateLiteraryAnalysisQuestion();
      case ReadingQuestionType.textAnalysis:
        return _generateTextAnalysisQuestion();
      case ReadingQuestionType.compareContrast:
        return _generateCompareContrastQuestion();
      case ReadingQuestionType.causeEffect:
        return _generateCauseEffectQuestion();
      case ReadingQuestionType.authorPurpose:
        return _generateAuthorPurposeQuestion();
      case ReadingQuestionType.pointOfView:
        return _generatePointOfViewQuestion();
      case ReadingQuestionType.figurativeLanguage:
        return _generateFigurativeLanguageQuestion();
      case ReadingQuestionType.readingStrategies:
        return _generateReadingStrategiesQuestion();
      case ReadingQuestionType.writingResponse:
        return _generateWritingResponseQuestion();
    }
  }

  /// Generate a random question for a difficulty level
  ReadingQuestion generateQuestionForLevel(ReadingDifficultyLevel level) {
    final typesForLevel = ReadingQuestionType.values
        .where((type) => type.difficultyLevel == level)
        .toList();
    final randomType = typesForLevel[_random.nextInt(typesForLevel.length)];
    return generateQuestion(randomType);
  }

  // ========== Level A Question Generators ==========

  ReadingQuestion _generateLetterRecognitionQuestion() {
    final letter = _letters[_random.nextInt(_letters.length)];
    final wrongLetters = List.generate(3, (_) {
      String wrong;
      do {
        wrong = _letters[_random.nextInt(_letters.length)];
      } while (wrong == letter);
      return wrong;
    });
    final options = [letter, ...wrongLetters]..shuffle(_random);

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.letterRecognition,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Which letter is "$letter"?',
      options: options,
      correctAnswer: letter,
      explanation: 'Great! "$letter" is the letter.',
      metadata: {'letter': letter},
    );
  }

  ReadingQuestion _generateLetterSoundQuestion() {
    final letterSounds = {
      'A': 'apple',
      'B': 'ball',
      'C': 'cat',
      'D': 'dog',
      'E': 'egg',
      'F': 'fish',
      'G': 'goat',
      'H': 'hat',
      'I': 'igloo',
      'J': 'jam',
      'K': 'kite',
      'L': 'lion',
      'M': 'moon',
      'N': 'nest',
      'O': 'octopus',
      'P': 'pig',
      'Q': 'queen',
      'R': 'rain',
      'S': 'sun',
      'T': 'tree',
      'U': 'umbrella',
      'V': 'van',
      'W': 'water',
      'X': 'x-ray',
      'Y': 'yarn',
      'Z': 'zebra',
    };
    final letter = _letters[_random.nextInt(_letters.length)];
    final sound = letterSounds[letter]!;

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.letterSound,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'What sound does the letter "$letter" make?',
      options: [sound, 'ball', 'cat', 'dog']..shuffle(_random),
      correctAnswer: sound,
      explanation: 'Correct! "$letter" makes the "$sound" sound.',
      metadata: {'letter': letter, 'sound': sound},
    );
  }

  ReadingQuestion _generateCVCWordQuestion() {
    final word = _cvcWords[_random.nextInt(_cvcWords.length)];
    final wrongWords = List.generate(3, (_) {
      String wrong;
      do {
        wrong = _cvcWords[_random.nextInt(_cvcWords.length)];
      } while (wrong == word);
      return wrong;
    });
    final options = [word, ...wrongWords]..shuffle(_random);

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.cvcWords,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Read this word: $word',
      options: options,
      correctAnswer: word,
      explanation: 'Excellent! You read "$word" correctly!',
      metadata: {'word': word},
    );
  }

  ReadingQuestion _generateRhymingWordQuestion() {
    final rhymes = [
      {'word': 'cat', 'rhyme': 'hat'},
      {'word': 'dog', 'rhyme': 'log'},
      {'word': 'sun', 'rhyme': 'fun'},
      {'word': 'bed', 'rhyme': 'red'},
    ];
    final rhymePair = rhymes[_random.nextInt(rhymes.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.rhymingWords,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Which word rhymes with "${rhymePair['word']}"?',
      options: [
        rhymePair['rhyme'] as String,
        'ball',
        'cup',
        'tree',
      ]..shuffle(_random),
      correctAnswer: rhymePair['rhyme'],
      explanation: 'Perfect! "${rhymePair['word']}" and "${rhymePair['rhyme']}" rhyme!',
      metadata: rhymePair,
    );
  }

  ReadingQuestion _generateBeginningSoundQuestion() {
    final words = ['cat', 'dog', 'sun', 'hat', 'ball'];
    final word = words[_random.nextInt(words.length)];
    final beginningSound = word[0].toUpperCase();

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.beginningSounds,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'What sound does "$word" start with?',
      options: [beginningSound, 'B', 'C', 'D']..shuffle(_random),
      correctAnswer: beginningSound,
      explanation: 'Great! "$word" starts with "$beginningSound".',
      metadata: {'word': word, 'sound': beginningSound},
    );
  }

  ReadingQuestion _generateEndingSoundQuestion() {
    final words = ['cat', 'dog', 'sun', 'hat', 'bed'];
    final word = words[_random.nextInt(words.length)];
    final endingSound = word[word.length - 1].toUpperCase();

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.endingSounds,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'What sound does "$word" end with?',
      options: [endingSound, 'T', 'G', 'N']..shuffle(_random),
      correctAnswer: endingSound,
      explanation: 'Correct! "$word" ends with "$endingSound".',
      metadata: {'word': word, 'sound': endingSound},
    );
  }

  ReadingQuestion _generateUppercaseLowercaseQuestion() {
    final letter = _letters[_random.nextInt(_letters.length)];
    final lowercase = letter.toLowerCase();

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.uppercaseLowercase,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'What is the lowercase letter for "$letter"?',
      options: [lowercase, 'a', 'b', 'c']..shuffle(_random),
      correctAnswer: lowercase,
      explanation: 'Perfect! "$letter" in lowercase is "$lowercase".',
      metadata: {'uppercase': letter, 'lowercase': lowercase},
    );
  }

  ReadingQuestion _generateLetterMatchingQuestion() {
    final letter = _letters[_random.nextInt(_letters.length)];
    final matchingPairs = [
      {'letter': letter, 'match': letter},
      {'letter': letter, 'match': letter.toLowerCase()},
    ];
    final pair = matchingPairs[_random.nextInt(matchingPairs.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.letterMatching,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Match the letter "$letter"',
      options: [pair['match'] as String, 'A', 'B', 'C']..shuffle(_random),
      correctAnswer: pair['match'],
      explanation: 'Well done! You matched the letters correctly.',
      metadata: pair,
    );
  }

  ReadingQuestion _generateSoundMatchingQuestion() {
    final sounds = ['A', 'B', 'C', 'D'];
    final sound = sounds[_random.nextInt(sounds.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.soundMatching,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Which word starts with the "$sound" sound?',
      options: ['apple', 'ball', 'cat', 'dog']..shuffle(_random),
      correctAnswer: 'apple',
      explanation: 'Great! "apple" starts with "$sound".',
      metadata: {'sound': sound},
    );
  }

  ReadingQuestion _generateWordFamilyQuestion() {
    final wordFamilies = [
      {'family': '-at', 'words': ['cat', 'hat', 'bat', 'sat']},
      {'family': '-og', 'words': ['dog', 'log', 'fog', 'jog']},
      {'family': '-un', 'words': ['sun', 'fun', 'run', 'bun']},
    ];
    final family = wordFamilies[_random.nextInt(wordFamilies.length)];
    final words = family['words'] as List<String>;
    final word = words[_random.nextInt(words.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.wordFamilies,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Which word belongs to the "${family['family']}" family?',
      options: List<String>.from(words)..shuffle(_random),
      correctAnswer: word,
      explanation: 'Correct! "$word" belongs to the "${family['family']}" word family.',
      metadata: family,
    );
  }

  ReadingQuestion _generateSimpleBlendingQuestion() {
    final blends = [
      {'sounds': ['c', 'a', 't'], 'word': 'cat'},
      {'sounds': ['d', 'o', 'g'], 'word': 'dog'},
      {'sounds': ['s', 'u', 'n'], 'word': 'sun'},
    ];
    final blend = blends[_random.nextInt(blends.length)];
    final sounds = blend['sounds'] as List<String>;
    final word = blend['word'] as String;

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.simpleBlending,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Blend these sounds: ${sounds.join(" - ")}',
      options: [word, 'cat', 'dog', 'sun']..shuffle(_random),
      correctAnswer: word,
      explanation: 'Excellent! ${sounds.join(" + ")} = "$word"!',
      metadata: blend,
    );
  }

  ReadingQuestion _generateLetterWritingQuestion() {
    final letter = _letters[_random.nextInt(_letters.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.letterWriting,
      difficultyLevel: ReadingDifficultyLevel.levelA,
      questionText: 'Write the letter "$letter"',
      correctAnswer: letter,
      explanation: 'Great job writing "$letter"!',
      metadata: {'letter': letter},
    );
  }

  // ========== Level B Question Generators ==========

  ReadingQuestion _generateSightWordQuestion() {
    final word = _sightWords[_random.nextInt(_sightWords.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.sightWords,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Read this sight word: $word',
      correctAnswer: word,
      explanation: 'Perfect! "$word" is a sight word.',
      metadata: {'word': word},
    );
  }

  ReadingQuestion _generateSightWordRecognitionQuestion() {
    final word = _sightWords[_random.nextInt(_sightWords.length)];
    final wrongWords = List.generate(3, (_) {
      String wrong;
      do {
        wrong = _sightWords[_random.nextInt(_sightWords.length)];
      } while (wrong == word);
      return wrong;
    });
    final options = [word, ...wrongWords]..shuffle(_random);

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.sightWordRecognition,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Find the word "$word"',
      options: options,
      correctAnswer: word,
      explanation: 'Great! You found "$word"!',
      metadata: {'word': word},
    );
  }

  ReadingQuestion _generateBlendingQuestion() {
    final blends = [
      {'sounds': ['b', 'l', 'a', 'ck'], 'word': 'black'},
      {'sounds': ['s', 't', 'o', 'p'], 'word': 'stop'},
      {'sounds': ['f', 'l', 'a', 'g'], 'word': 'flag'},
    ];
    final blend = blends[_random.nextInt(blends.length)];
    final sounds = blend['sounds'] as List<String>;
    final word = blend['word'] as String;

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.blending,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Blend these sounds: ${sounds.join(" - ")}',
      options: [word, 'black', 'stop', 'flag']..shuffle(_random),
      correctAnswer: word,
      explanation: 'Well done! The word is "$word"!',
      metadata: blend,
    );
  }

  ReadingQuestion _generateSegmentingQuestion() {
    final words = ['cat', 'dog', 'sun', 'hat'];
    final word = words[_random.nextInt(words.length)];
    final segments = word.split('');

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.segmenting,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Break "$word" into sounds',
      correctAnswer: segments,
      explanation: 'Perfect! "$word" = ${segments.join(" + ")}',
      metadata: {'word': word, 'segments': segments},
    );
  }

  ReadingQuestion _generateBasicComprehensionQuestion() {
    final passage = 'The cat sat on the mat. The cat is happy.';
    final questions = [
      {'question': 'Where did the cat sit?', 'answer': 'mat'},
      {'question': 'How does the cat feel?', 'answer': 'happy'},
    ];
    final q = questions[_random.nextInt(questions.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.basicComprehension,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: q['question'] as String,
      passage: passage,
      options: [q['answer'] as String, 'cat', 'sat', 'the']..shuffle(_random),
      correctAnswer: q['answer'],
      explanation: 'Correct! The answer is "${q['answer']}".',
      metadata: {'passage': passage, 'question': q},
    );
  }

  ReadingQuestion _generatePictureWordMatchQuestion() {
    final words = ['cat', 'dog', 'sun', 'hat'];
    final word = words[_random.nextInt(words.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.pictureWordMatch,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Match the picture to the word: $word',
      options: [word, 'cat', 'dog', 'sun']..shuffle(_random),
      correctAnswer: word,
      explanation: 'Perfect match!',
      metadata: {'word': word},
    );
  }

  ReadingQuestion _generateSentenceCompletionQuestion() {
    final sentences = [
      {'sentence': 'The cat sat on the ____.', 'word': 'mat', 'options': ['mat', 'cat', 'sat', 'the']},
      {'sentence': 'I like to play with a ____.', 'word': 'ball', 'options': ['ball', 'cat', 'dog', 'sun']},
    ];
    final sentence = sentences[_random.nextInt(sentences.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.sentenceCompletion,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: sentence['sentence'] as String,
      options: (sentence['options'] as List<String>)..shuffle(_random),
      correctAnswer: sentence['word'],
      explanation: 'Great! The sentence is complete.',
      metadata: sentence,
    );
  }

  ReadingQuestion _generateWordOrderingQuestion() {
    final words = ['The', 'cat', 'sat'];
    final correctOrder = List<String>.from(words);
    final shuffled = List<String>.from(words)..shuffle(_random);

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.wordOrdering,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Put these words in order: ${shuffled.join(", ")}',
      correctAnswer: correctOrder,
      explanation: 'Perfect! The sentence is: "${correctOrder.join(" ")}".',
      metadata: {'words': shuffled, 'correct': correctOrder},
    );
  }

  ReadingQuestion _generatePunctuationQuestion() {
    final sentences = [
      {'sentence': 'The cat sat.', 'punctuation': '.'},
      {'sentence': 'How are you?', 'punctuation': '?'},
      {'sentence': 'Wow!', 'punctuation': '!'},
    ];
    final sentence = sentences[_random.nextInt(sentences.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.punctuationBasics,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'What punctuation mark should go at the end? "${sentence['sentence']}"',
      options: ['.', '?', '!', ',']..shuffle(_random),
      correctAnswer: sentence['punctuation'],
      explanation: 'Correct! The punctuation is "${sentence['punctuation']}".',
      metadata: sentence,
    );
  }

  ReadingQuestion _generateCapitalizationQuestion() {
    final sentences = [
      {'sentence': 'the cat sat', 'correct': 'The cat sat'},
      {'sentence': 'i like dogs', 'correct': 'I like dogs'},
    ];
    final sentence = sentences[_random.nextInt(sentences.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.capitalization,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Fix the capitalization: "${sentence['sentence']}"',
      options: [sentence['correct'] as String, sentence['sentence'] as String, 'The Cat Sat', 'THE CAT SAT']..shuffle(_random),
      correctAnswer: sentence['correct'],
      explanation: 'Perfect! "${sentence['correct']}" is correct.',
      metadata: sentence,
    );
  }

  ReadingQuestion _generateReadingFluencyQuestion() {
    final passage = 'The cat sat on the mat. The dog ran in the sun.';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.readingFluency,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'Read this passage: $passage',
      passage: passage,
      correctAnswer: passage,
      explanation: 'Great reading!',
      metadata: {'passage': passage},
    );
  }

  ReadingQuestion _generateVocabularyBasicsQuestion() {
    final words = [
      {'word': 'happy', 'meaning': 'feeling good'},
      {'word': 'big', 'meaning': 'large'},
    ];
    final word = words[_random.nextInt(words.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.vocabularyBasics,
      difficultyLevel: ReadingDifficultyLevel.levelB,
      questionText: 'What does "${word['word']}" mean?',
      options: [word['meaning'] as String, 'feeling good', 'large', 'small']..shuffle(_random),
      correctAnswer: word['meaning'],
      explanation: 'Correct! "${word['word']}" means "${word['meaning']}".',
      metadata: word,
    );
  }

  // ========== Level C Question Generators ==========

  ReadingQuestion _generateShortStoryQuestion() {
    final story = 'Once upon a time, there was a little cat. The cat loved to play in the garden. One day, the cat found a ball. The cat was very happy.';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.shortStories,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'Read this story',
      passage: story,
      correctAnswer: story,
      explanation: 'Great reading!',
      metadata: {'story': story},
    );
  }

  ReadingQuestion _generateStoryComprehensionQuestion() {
    final story = 'Emma went to the park. She saw three birds. The birds were singing. Emma smiled.';
    final questions = [
      {'question': 'Where did Emma go?', 'answer': 'park'},
      {'question': 'How many birds did Emma see?', 'answer': 'three'},
    ];
    final q = questions[_random.nextInt(questions.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.storyComprehension,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: q['question'] as String,
      passage: story,
      options: [q['answer'] as String, 'park', 'birds', 'smiled']..shuffle(_random),
      correctAnswer: q['answer'],
      explanation: 'Correct! The answer is "${q['answer']}".',
      metadata: {'story': story, 'question': q},
    );
  }

  ReadingQuestion _generateVocabularyQuestion() {
    final words = [
      {'word': 'enormous', 'synonym': 'huge'},
      {'word': 'tiny', 'synonym': 'small'},
    ];
    final word = words[_random.nextInt(words.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.vocabulary,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What is a synonym for "${word['word']}"?',
      options: [word['synonym'] as String, 'big', 'small', 'happy']..shuffle(_random),
      correctAnswer: word['synonym'],
      explanation: 'Correct! "${word['synonym']}" means the same as "${word['word']}".',
      metadata: word,
    );
  }

  ReadingQuestion _generateSentenceBuildingQuestion() {
    final words = ['The', 'dog', 'ran', 'fast'];
    final correctSentence = words.join(' ');
    final shuffled = List<String>.from(words)..shuffle(_random);

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.sentenceBuilding,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'Build a sentence from: ${shuffled.join(", ")}',
      correctAnswer: correctSentence,
      explanation: 'Perfect! "$correctSentence" is a complete sentence.',
      metadata: {'words': shuffled, 'correct': correctSentence},
    );
  }

  ReadingQuestion _generateGrammarQuestion() {
    final sentences = [
      {'sentence': 'I ___ happy.', 'word': 'am', 'options': ['am', 'is', 'are', 'be']},
      {'sentence': 'She ___ running.', 'word': 'is', 'options': ['am', 'is', 'are', 'be']},
    ];
    final sentence = sentences[_random.nextInt(sentences.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.grammarBasics,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: sentence['sentence'] as String,
      options: (sentence['options'] as List<String>)..shuffle(_random),
      correctAnswer: sentence['word'],
      explanation: 'Correct! "${sentence['word']}" is the right word.',
      metadata: sentence,
    );
  }

  ReadingQuestion _generateSynonymQuestion() {
    final synonyms = [
      {'word': 'happy', 'synonym': 'glad'},
      {'word': 'big', 'synonym': 'large'},
    ];
    final pair = synonyms[_random.nextInt(synonyms.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.synonyms,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What is a synonym for "${pair['word']}"?',
      options: [pair['synonym'] as String, 'sad', 'small', 'angry']..shuffle(_random),
      correctAnswer: pair['synonym'],
      explanation: 'Correct! "${pair['synonym']}" means the same as "${pair['word']}".',
      metadata: pair,
    );
  }

  ReadingQuestion _generateAntonymQuestion() {
    final antonyms = [
      {'word': 'happy', 'antonym': 'sad'},
      {'word': 'big', 'antonym': 'small'},
    ];
    final pair = antonyms[_random.nextInt(antonyms.length)];

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.antonyms,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What is the opposite of "${pair['word']}"?',
      options: [pair['antonym'] as String, 'happy', 'big', 'good']..shuffle(_random),
      correctAnswer: pair['antonym'],
      explanation: 'Correct! "${pair['antonym']}" is the opposite of "${pair['word']}".',
      metadata: pair,
    );
  }

  ReadingQuestion _generateContextClueQuestion() {
    final passage = 'The enormous elephant walked slowly.';
    final word = 'enormous';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.contextClues,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What does "enormous" mean in this sentence: "$passage"',
      options: ['very big', 'very small', 'fast', 'slow']..shuffle(_random),
      correctAnswer: 'very big',
      explanation: 'Correct! "Enormous" means very big.',
      metadata: {'passage': passage, 'word': word},
    );
  }

  ReadingQuestion _generateMainIdeaQuestion() {
    final passage = 'Dogs are friendly pets. They like to play. Dogs can be trained.';
    final mainIdea = 'Dogs are friendly pets';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.mainIdea,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What is the main idea?',
      passage: passage,
      options: [mainIdea, 'Dogs like to play', 'Dogs can be trained', 'Pets are fun']..shuffle(_random),
      correctAnswer: mainIdea,
      explanation: 'Correct! The main idea is "$mainIdea".',
      metadata: {'passage': passage, 'mainIdea': mainIdea},
    );
  }

  ReadingQuestion _generateStoryElementsQuestion() {
    final story = 'Once upon a time, a brave knight saved a princess from a dragon.';
    final character = 'knight';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.storyElements,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'Who is the main character?',
      passage: story,
      options: [character, 'princess', 'dragon', 'king']..shuffle(_random),
      correctAnswer: character,
      explanation: 'Correct! The main character is the $character.',
      metadata: {'story': story, 'character': character},
    );
  }

  ReadingQuestion _generateInferenceQuestion() {
    final passage = 'Tom put on his coat and boots. He grabbed his umbrella.';
    final inference = 'It is raining';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.readingInference,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What can you infer from this passage?',
      passage: passage,
      options: [inference, 'It is sunny', 'Tom is going to school', 'Tom is happy']..shuffle(_random),
      correctAnswer: inference,
      explanation: 'Correct! Tom has an umbrella, so it must be raining.',
      metadata: {'passage': passage, 'inference': inference},
    );
  }

  ReadingQuestion _generateTextFeaturesQuestion() {
    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.textFeatures,
      difficultyLevel: ReadingDifficultyLevel.levelC,
      questionText: 'What is the title of a book?',
      options: ['The name at the top', 'The author', 'The pictures', 'The words']..shuffle(_random),
      correctAnswer: 'The name at the top',
      explanation: 'Correct! The title is the name of the book at the top.',
      metadata: {},
    );
  }

  // ========== Level D Question Generators ==========

  ReadingQuestion _generateAdvancedComprehensionQuestion() {
    final passage = 'The ancient library contained thousands of books. Scholars traveled from far away to study there. The library was a center of learning.';
    final question = 'Why did scholars travel to the library?';
    final answer = 'To study';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.advancedComprehension,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: question,
      passage: passage,
      options: [answer, 'To read', 'To write', 'To play']..shuffle(_random),
      correctAnswer: answer,
      explanation: 'Correct! Scholars traveled to study at the library.',
      metadata: {'passage': passage, 'question': question},
    );
  }

  ReadingQuestion _generateAdvancedFluencyQuestion() {
    final passage = 'The mysterious forest was full of tall trees. Birds sang beautiful songs. A small path led deeper into the woods.';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.readingFluencyAdvanced,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'Read this passage with expression',
      passage: passage,
      correctAnswer: passage,
      explanation: 'Excellent reading!',
      metadata: {'passage': passage},
    );
  }

  ReadingQuestion _generateCriticalThinkingQuestion() {
    final passage = 'Some people think video games are bad. Others think they help with problem-solving.';
    final question = 'What is your opinion about video games?';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.criticalThinking,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: question,
      passage: passage,
      correctAnswer: 'Opinion-based answer',
      explanation: 'Great thinking! There are different perspectives on this topic.',
      metadata: {'passage': passage, 'question': question},
    );
  }

  ReadingQuestion _generateLiteraryAnalysisQuestion() {
    final passage = 'The old house stood alone on the hill. Its windows were dark.';
    final mood = 'mysterious';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.literaryAnalysis,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What mood does this passage create?',
      passage: passage,
      options: [mood, 'happy', 'sad', 'excited']..shuffle(_random),
      correctAnswer: mood,
      explanation: 'Correct! The dark windows and lonely house create a mysterious mood.',
      metadata: {'passage': passage, 'mood': mood},
    );
  }

  ReadingQuestion _generateTextAnalysisQuestion() {
    final passage = 'The author uses descriptive words to paint a picture.';
    final technique = 'descriptive language';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.textAnalysis,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What writing technique is used?',
      passage: passage,
      options: [technique, 'dialogue', 'rhyme', 'repetition']..shuffle(_random),
      correctAnswer: technique,
      explanation: 'Correct! The author uses descriptive language.',
      metadata: {'passage': passage, 'technique': technique},
    );
  }

  ReadingQuestion _generateCompareContrastQuestion() {
    final passage = 'Cats are independent. Dogs are friendly.';
    final answer = 'Cats are independent, dogs are friendly';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.compareContrast,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'How are cats and dogs different?',
      passage: passage,
      options: [answer, 'They are the same', 'Both are pets', 'Both are animals']..shuffle(_random),
      correctAnswer: answer,
      explanation: 'Correct! Cats are independent while dogs are friendly.',
      metadata: {'passage': passage},
    );
  }

  ReadingQuestion _generateCauseEffectQuestion() {
    final passage = 'It rained all day. The ground became very wet.';
    final cause = 'It rained all day';
    final effect = 'The ground became wet';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.causeEffect,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What caused the ground to become wet?',
      passage: passage,
      options: [cause, effect, 'The sun', 'The wind']..shuffle(_random),
      correctAnswer: cause,
      explanation: 'Correct! The rain caused the ground to become wet.',
      metadata: {'passage': passage, 'cause': cause, 'effect': effect},
    );
  }

  ReadingQuestion _generateAuthorPurposeQuestion() {
    final passage = 'Learn how to plant a garden. First, choose a sunny spot.';
    final purpose = 'to inform';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.authorPurpose,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What is the author\'s purpose?',
      passage: passage,
      options: [purpose, 'to entertain', 'to persuade', 'to describe']..shuffle(_random),
      correctAnswer: purpose,
      explanation: 'Correct! The author wants to inform readers how to plant a garden.',
      metadata: {'passage': passage, 'purpose': purpose},
    );
  }

  ReadingQuestion _generatePointOfViewQuestion() {
    final passage = 'I walked to the store. I bought some apples.';
    final pov = 'first person';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.pointOfView,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What point of view is this written in?',
      passage: passage,
      options: [pov, 'second person', 'third person', 'omniscient']..shuffle(_random),
      correctAnswer: pov,
      explanation: 'Correct! The use of "I" indicates first person point of view.',
      metadata: {'passage': passage, 'pov': pov},
    );
  }

  ReadingQuestion _generateFigurativeLanguageQuestion() {
    final passage = 'The stars were diamonds in the sky.';
    final device = 'metaphor';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.figurativeLanguage,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What figurative language is used?',
      passage: passage,
      options: [device, 'simile', 'alliteration', 'personification']..shuffle(_random),
      correctAnswer: device,
      explanation: 'Correct! "Stars were diamonds" is a metaphor.',
      metadata: {'passage': passage, 'device': device},
    );
  }

  ReadingQuestion _generateReadingStrategiesQuestion() {
    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.readingStrategies,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: 'What should you do before reading a new text?',
      options: ['Preview the text', 'Skip to the end', 'Read quickly', 'Ignore the title']..shuffle(_random),
      correctAnswer: 'Preview the text',
      explanation: 'Correct! Previewing helps you understand what you\'re about to read.',
      metadata: {},
    );
  }

  ReadingQuestion _generateWritingResponseQuestion() {
    final prompt = 'Write about your favorite animal.';

    return ReadingQuestion(
      id: _generateId(),
      type: ReadingQuestionType.writingResponse,
      difficultyLevel: ReadingDifficultyLevel.levelD,
      questionText: prompt,
      correctAnswer: 'Open-ended response',
      explanation: 'Great writing!',
      metadata: {'prompt': prompt},
    );
  }

  // ========== Helper Methods ==========

  String _generateId() {
    return 'rq_${DateTime.now().millisecondsSinceEpoch}_${_random.nextInt(1000)}';
  }
}

