import 'reading_question_type.dart';
import 'reading_difficulty_level.dart';

/// Represents a single reading question with all necessary data
class ReadingQuestion {
  final String id;
  final ReadingQuestionType type;
  final ReadingDifficultyLevel difficultyLevel;
  final String questionText;
  final String? passage; // For comprehension questions
  final String? questionImage; // Optional image for visual questions
  final List<String>? options; // For multiple choice questions
  final dynamic correctAnswer; // Can be String, List<String>, or int
  final String? explanation; // Explanation shown after answering
  final Map<String, dynamic>? metadata; // Additional data

  const ReadingQuestion({
    required this.id,
    required this.type,
    required this.difficultyLevel,
    required this.questionText,
    this.passage,
    this.questionImage,
    this.options,
    required this.correctAnswer,
    this.explanation,
    this.metadata,
  });

  /// Check if the provided answer is correct
  bool isCorrect(dynamic answer) {
    if (correctAnswer is List && answer is List) {
      return correctAnswer.toString().toLowerCase() == answer.toString().toLowerCase();
    }
    if (correctAnswer is String && answer is String) {
      return correctAnswer.toLowerCase().trim() == answer.toLowerCase().trim();
    }
    return correctAnswer == answer;
  }

  /// Get formatted answer for display
  String getFormattedAnswer() {
    if (correctAnswer is List) {
      return correctAnswer.join(', ');
    }
    return correctAnswer.toString();
  }
}

