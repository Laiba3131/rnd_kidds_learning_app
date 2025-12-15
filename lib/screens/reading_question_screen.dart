import 'package:flutter/material.dart';
import '../models/reading_difficulty_level.dart';
import '../models/reading_question.dart';
import '../models/reading_question_type.dart';
import '../services/reading_question_generator.dart';

/// Screen that displays and handles reading questions
class ReadingQuestionScreen extends StatefulWidget {
  final ReadingDifficultyLevel difficultyLevel;

  const ReadingQuestionScreen({
    super.key,
    required this.difficultyLevel,
  });

  @override
  State<ReadingQuestionScreen> createState() => _ReadingQuestionScreenState();
}

class _ReadingQuestionScreenState extends State<ReadingQuestionScreen> {
  final ReadingQuestionGenerator _generator = ReadingQuestionGenerator();
  late ReadingQuestion _currentQuestion;
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
        title: Text('${widget.difficultyLevel.displayName} - Reading'),
        backgroundColor: Colors.green.shade100,
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
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _currentQuestion.type.displayName,
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),

            // Passage (if available)
            if (_currentQuestion.passage != null) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  _currentQuestion.passage!,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],

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
                  backgroundColor: Colors.green.shade600,
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
                  side: BorderSide(color: Colors.green.shade300),
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

    // Text input for open-ended answers
    return Column(
      children: [
        TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
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
            backgroundColor: Colors.green.shade600,
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

