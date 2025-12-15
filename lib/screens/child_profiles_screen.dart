import 'package:flutter/material.dart';
import '../models/child_profile.dart';
import '../models/math_difficulty_level.dart';

/// Screen for managing child profiles
class ChildProfilesScreen extends StatefulWidget {
  const ChildProfilesScreen({super.key});

  @override
  State<ChildProfilesScreen> createState() => _ChildProfilesScreenState();
}

class _ChildProfilesScreenState extends State<ChildProfilesScreen> {
  final List<ChildProfile> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Profiles'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: _children.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.child_care,
                    size: 64,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No children added yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tap the + button to add a child',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _children.length,
              itemBuilder: (context, index) {
                final child = _children[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple.shade200,
                      child: Text(
                        child.name[0].toUpperCase(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      child.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Age: ${child.age} | Level: ${child.getEffectiveLevel().displayName}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _children.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddChildDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddChildDialog(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    MathDifficultyLevel selectedLevel = MathDifficultyLevel.levelA;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Child Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Starting Level:'),
                ...MathDifficultyLevel.values.map((level) => RadioListTile<MathDifficultyLevel>(
                      title: Text('${level.displayName} (${level.ageRange})'),
                      value: level,
                      groupValue: selectedLevel,
                      onChanged: (value) {
                        setDialogState(() {
                          selectedLevel = value!;
                        });
                      },
                    )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final ageText = ageController.text.trim();
                if (name.isNotEmpty && ageText.isNotEmpty) {
                  final age = int.tryParse(ageText);
                  if (age != null && age > 0) {
                    final child = ChildProfile(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      name: name,
                      age: age,
                      startingLevel: selectedLevel,
                      createdAt: DateTime.now(),
                    );
                    setState(() {
                      _children.add(child);
                    });
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

