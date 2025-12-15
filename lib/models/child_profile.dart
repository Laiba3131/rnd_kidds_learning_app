import 'math_difficulty_level.dart';

/// Represents a child profile with avatar customization and progress
class ChildProfile {
  final String id;
  final String name;
  final int age;
  final MathDifficultyLevel startingLevel;
  final DateTime createdAt;

  // Avatar customization
  final String? avatarOutfit;
  final String? avatarHair;
  final String? avatarAccessories;

  // Progress tracking
  final MathDifficultyLevel? currentLevel;
  final Map<String, int>? progressData; // Question type -> correct answers count

  const ChildProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.startingLevel,
    required this.createdAt,
    this.avatarOutfit,
    this.avatarHair,
    this.avatarAccessories,
    this.currentLevel,
    this.progressData,
  });

  /// Get the appropriate difficulty level based on age and progress
  MathDifficultyLevel getEffectiveLevel() {
    if (currentLevel != null) {
      return currentLevel!;
    }
    return startingLevel;
  }

  /// Create a copy with updated fields
  ChildProfile copyWith({
    String? id,
    String? name,
    int? age,
    MathDifficultyLevel? startingLevel,
    DateTime? createdAt,
    String? avatarOutfit,
    String? avatarHair,
    String? avatarAccessories,
    MathDifficultyLevel? currentLevel,
    Map<String, int>? progressData,
  }) {
    return ChildProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      startingLevel: startingLevel ?? this.startingLevel,
      createdAt: createdAt ?? this.createdAt,
      avatarOutfit: avatarOutfit ?? this.avatarOutfit,
      avatarHair: avatarHair ?? this.avatarHair,
      avatarAccessories: avatarAccessories ?? this.avatarAccessories,
      currentLevel: currentLevel ?? this.currentLevel,
      progressData: progressData ?? this.progressData,
    );
  }
}

