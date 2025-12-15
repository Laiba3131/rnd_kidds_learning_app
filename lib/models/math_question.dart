import 'math_question_type.dart';
import 'math_difficulty_level.dart';

/// Represents a single math question with all necessary data
class MathQuestion {
  final String id;
  final MathQuestionType type;
  final MathDifficultyLevel difficultyLevel;
  final String questionText;
  final String? questionImage; // Optional image for visual questions
  final List<String>? options; // For multiple choice questions
  final dynamic correctAnswer; // Can be int, double, String, or List
  final String? explanation; // Explanation shown after answering
  final Map<String, dynamic>? metadata; // Additional data (e.g., operands, pattern data)

  const MathQuestion({
    required this.id,
    required this.type,
    required this.difficultyLevel,
    required this.questionText,
    this.questionImage,
    this.options,
    required this.correctAnswer,
    this.explanation,
    this.metadata,
  });

  /// Check if the provided answer is correct
  bool isCorrect(dynamic answer) {
    if (correctAnswer is List && answer is List) {
      return correctAnswer.toString() == answer.toString();
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

