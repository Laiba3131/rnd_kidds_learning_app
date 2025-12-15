# Math & Reading App

A Flutter educational app for children ages 4-10, focusing on math skills development.

## Features

### A. Child Profiles
- Multiple children under one parent account
- Avatar customization (outfits, hair, accessories) - *Coming soon*
- Optional micro-animations (blink, nod, jump) - *Coming soon*
- Fields: Name, Age, Starting Level

### B. Math Module (Ages 4–10)
- **4 Difficulty Bands** aligned with learning frameworks:
  - **Level A (Ages 4-5)**: Counting 1–10, number recognition, patterns, big/small, and more (16 exercise types)
  - **Level B (Ages 5-6)**: Addition/Subtraction 1–20, shapes, ordering numbers, and more (16 exercise types)
  - **Level C (Ages 7-8)**: 2‑digit addition/subtraction, fractions, word problems, and more (16 exercise types)
  - **Level D (Ages 9-10)**: Multi-step problems, advanced fractions, logic patterns, and more (16 exercise types)
- **Topics**: Number recognition, Addition, Subtraction, Counting, Patterns, Shapes, Bigger/Smaller, Early Fractions, Word-based Math
- **Each level includes 12–16 exercise types**

### C. Reading Module (Ages 4–10)
- **4 Difficulty Bands** aligned with learning frameworks:
  - **Level A (Ages 4-5)**: Letter recognition, phonics, CVC words (12 exercise types)
  - **Level B (Ages 5-6)**: Sight words, blending, basic comprehension (12 exercise types)
  - **Level C (Ages 7-8)**: Short stories, vocabulary, sentence building (12 exercise types)
  - **Level D (Ages 9-10)**: Advanced comprehension, reading fluency, critical thinking (12 exercise types)

## Project Structure

```
lib/
├── models/              # Data models
│   ├── math_difficulty_level.dart
│   ├── math_question_type.dart
│   ├── math_question.dart
│   └── child_profile.dart
├── services/            # Business logic
│   └── math_question_generator.dart
├── screens/             # UI screens
│   ├── home_screen.dart
│   ├── math_module_screen.dart
│   ├── math_question_screen.dart
│   └── child_profiles_screen.dart
└── main.dart            # App entry point
```

## Getting Started

1. Install Flutter dependencies:
   ```bash
   flutter pub get
   ```

2. Run the app:
   ```bash
   flutter run
   ```

## Module Details

### Math Module
The Math Module generates questions dynamically based on:
- Selected difficulty level
- Question type (varies by level)
- Age-appropriate content

**Each level includes 12-16 exercise types covering:**
- Number recognition, Addition, Subtraction, Counting, Patterns, Shapes, Bigger/Smaller, Early Fractions, Word-based Math

### Reading Module
The Reading Module generates questions dynamically based on:
- Selected difficulty level
- Question type (varies by level)
- Age-appropriate content

**Level A (12 types):** Letter recognition, letter sounds, CVC words, rhyming, beginning/ending sounds, word families, blending, and more

**Level B (12 types):** Sight words, blending, segmenting, basic comprehension, sentence completion, punctuation, capitalization, and more

**Level C (12 types):** Short stories, story comprehension, vocabulary, sentence building, grammar, synonyms, antonyms, context clues, main idea, and more

**Level D (12 types):** Advanced comprehension, literary analysis, text analysis, compare/contrast, cause/effect, author's purpose, point of view, figurative language, and more

## Development Notes

- Questions are generated randomly but follow age-appropriate difficulty
- All answers are validated against correct solutions
- Progress tracking is built-in (score display)
- UI is designed to be child-friendly with clear feedback

## For Designers

See `MATH_MODULE_STRUCTURE.md` for detailed information about:
- UI flow and screen structure
- Visual element requirements
- Design guidelines
- Animation considerations

## Future Enhancements

- [ ] Avatar customization UI
- [ ] Micro-animations for avatars
- [ ] Visual question illustrations
- [ ] Sound effects and audio feedback
- [ ] Progress rewards and badges
- [ ] Reading module
- [ ] Parent dashboard
- [ ] Progress analytics
