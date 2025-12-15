# Math Module Structure - Developer & Designer Coordination

## Overview
This document explains the Math Module structure to help designers understand how the app works and how to design UI components that align with the developer implementation.

## Architecture Overview

### 1. Difficulty Levels (4 Bands)
The app has 4 difficulty levels aligned with learning frameworks:

- **Level A (Ages 4-5)**: Counting 1-10, number recognition, patterns, big/small
- **Level B (Ages 5-6)**: Addition/Subtraction 1-20, shapes, ordering numbers
- **Level C (Ages 7-8)**: 2-digit addition/subtraction, fractions, word problems
- **Level D (Ages 9-10)**: Multi-step problems, advanced fractions, logic patterns

### 2. Question Types
Each difficulty level has specific question types:

**Level A:**
- Counting questions
- Number recognition (multiple choice)
- Pattern recognition
- Big/small comparisons

**Level B:**
- Addition (1-20)
- Subtraction (1-20)
- Shape identification
- Number ordering

**Level C:**
- 2-digit addition
- 2-digit subtraction
- Basic fractions
- Word problems

**Level D:**
- Multi-step problems
- Advanced fractions
- Logic patterns

## UI Flow for Designers

### Screen 1: Home Screen
- Shows two main modules: "Math Module" and "Child Profiles"
- Simple card-based navigation
- **Design Note**: Cards should be visually distinct and child-friendly

### Screen 2: Math Module Screen
- Lists all 4 difficulty levels
- Each level card shows:
  - Level name (A, B, C, D)
  - Age range
  - Learning objectives (checklist format)
  - "Start Learning" button
- **Design Note**: Use color coding or icons to differentiate levels

### Screen 3: Math Question Screen
This is the core interaction screen. It needs:

1. **Header Section:**
   - Level badge (e.g., "Level A")
   - Question type badge (e.g., "Counting")
   - Score display (e.g., "Score: 5/7")

2. **Question Display Area:**
   - Question text (large, readable font)
   - Optional: Image placeholder for visual questions
   - **Design Note**: Leave space for visual elements (objects to count, shapes, etc.)

3. **Answer Input Section:**
   - **Multiple Choice**: 4 buttons with options
   - **Text Input**: Number input field with submit button
   - **Ordering**: Drag-and-drop or selection interface (future enhancement)

4. **Feedback Section** (appears after answer):
   - Success/Error indicator (icon + color)
   - "Correct!" or "Not quite right" message
   - Correct answer display
   - Explanation text
   - "Next Question" button

## Data Structure for Designers

### Question Object Contains:
- Question text
- Question type
- Difficulty level
- Correct answer
- Options (for multiple choice)
- Explanation (shown after answering)
- Metadata (for visual rendering - e.g., count number, operands)

### Visual Elements Needed:
1. **Counting Questions**: Visual objects to count (apples, stars, etc.)
2. **Number Recognition**: Large number displays
3. **Pattern Questions**: Visual pattern sequences
4. **Shape Questions**: Shape illustrations
5. **Word Problems**: Optional illustrations

## Design Guidelines

### Colors:
- Level A: Use warm, friendly colors (e.g., yellow/orange)
- Level B: Use primary colors (e.g., blue/green)
- Level C: Use intermediate colors (e.g., purple/teal)
- Level D: Use advanced colors (e.g., indigo/navy)

### Typography:
- Question text: Large, bold, child-friendly font (24-28px)
- Answer options: Medium size (18-20px)
- Explanations: Smaller, readable (16px)

### Animations:
- Success feedback: Celebration animation (confetti, stars)
- Error feedback: Gentle shake or fade
- Transitions: Smooth between questions
- Micro-animations: Optional blink/nod for avatars

### Accessibility:
- High contrast for text
- Large touch targets (minimum 44x44px)
- Clear visual feedback
- Audio feedback options (future)

## File Structure for Reference

```
lib/
├── models/
│   ├── math_difficulty_level.dart    # Level definitions
│   ├── math_question_type.dart       # Question type definitions
│   ├── math_question.dart            # Question data structure
│   └── child_profile.dart            # Child profile structure
├── services/
│   └── math_question_generator.dart  # Question generation logic
└── screens/
    ├── home_screen.dart               # Main navigation
    ├── math_module_screen.dart        # Level selection
    └── math_question_screen.dart      # Question display & interaction
```

## Key Points for Designers

1. **Question Generation**: Questions are generated dynamically, so designs should be flexible
2. **Answer Types**: Support both multiple choice and text input
3. **Feedback Timing**: Feedback appears immediately after answer submission
4. **Progress Tracking**: Score is displayed in header (correct/total)
5. **Navigation**: Back button returns to level selection

## Future Enhancements (Design Considerations)

- Avatar animations (blink, nod, jump) - needs animation assets
- Visual question illustrations - needs image assets
- Sound effects - needs audio assets
- Progress rewards - needs badge/star assets
- Level completion celebrations - needs animation assets

## Questions for Designers

1. What visual style should we use for the counting objects?
2. How should we represent fractions visually?
3. What animation style for success/error feedback?
4. Should we have different themes per difficulty level?
5. How should we display progress over time?

