import 'package:flutter/material.dart';
import '../models/math_difficulty_level.dart';
import '../models/math_question.dart';
import '../models/math_question_type.dart';
import '../services/math_question_generator.dart';

/// Screen that displays and handles math questions
class MathQuestionScreen extends StatefulWidget {
  final MathDifficultyLevel difficultyLevel;

  const MathQuestionScreen({
    super.key,
    required this.difficultyLevel,
  });

  @override
  State<MathQuestionScreen> createState() => _MathQuestionScreenState();
}

class _MathQuestionScreenState extends State<MathQuestionScreen> {
  final MathQuestionGenerator _generator = MathQuestionGenerator();
  late MathQuestion _currentQuestion;
  String? _userAnswer;
  bool _showFeedback = false;
  bool _isCorrect = false;
  int _score = 0;
  int _questionsAnswered = 0;

  @override
  void initState() {
    super.initState();
    _loadNewQuestion();
  }

  void _loadNewQuestion() {
    setState(() {
      _currentQuestion = _generator.generateQuestionForLevel(widget.difficultyLevel);
      _userAnswer = null;
      _showFeedback = false;
    });
  }

  void _submitAnswer(String answer) {
    setState(() {
      _userAnswer = answer;
      _isCorrect = _currentQuestion.isCorrect(answer);
      _showFeedback = true;
      _questionsAnswered++;
      if (_isCorrect) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    _loadNewQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.difficultyLevel.displayName} - Math'),
        backgroundColor: Colors.blue.shade100,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Score: $_score/$_questionsAnswered',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question Type Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _currentQuestion.type.displayName,
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Question Text
            Text(
              _currentQuestion.questionText,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Answer Input Section
            if (!_showFeedback) _buildAnswerInput(),
            if (_showFeedback) _buildFeedback(),

            const SizedBox(height: 32),

            // Next Question Button (only shown after feedback)
            if (_showFeedback)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue.shade600,
                ),
                child: const Text(
                  'Next Question',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerInput() {
    // Multiple choice questions
    if (_currentQuestion.options != null) {
      return Column(
        children: _currentQuestion.options!.map((option) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _submitAnswer(option),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.blue.shade300),
                ),
                child: Text(
                  option,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }

    // Text input for numeric answers
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24),
          decoration: InputDecoration(
            hintText: 'Enter your answer',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
          ),
          onChanged: (value) {
            setState(() {
              _userAnswer = value;
            });
          },
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _userAnswer != null && _userAnswer!.isNotEmpty
              ? () => _submitAnswer(_userAnswer!)
              : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue.shade600,
          ),
          child: const Text(
            'Submit Answer',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedback() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _isCorrect ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _isCorrect ? Colors.green.shade300 : Colors.red.shade300,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Icon(
            _isCorrect ? Icons.check_circle : Icons.cancel,
            size: 64,
            color: _isCorrect ? Colors.green.shade600 : Colors.red.shade600,
          ),
          const SizedBox(height: 16),
          Text(
            _isCorrect ? 'Correct!' : 'Not quite right',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: _isCorrect ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'The correct answer is: ${_currentQuestion.getFormattedAnswer()}',
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          if (_currentQuestion.explanation != null) ...[
            const SizedBox(height: 12),
            Text(
              _currentQuestion.explanation!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

