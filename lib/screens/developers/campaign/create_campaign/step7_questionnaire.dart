import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';

class Step7Questionnaire extends StatefulWidget {
  const Step7Questionnaire({super.key});
  @override
  State<Step7Questionnaire> createState() => _Step7QuestionnaireState();
}

class _Step7QuestionnaireState extends State<Step7Questionnaire> {
  final List<Map<String, dynamic>> questions = [
    {
      'type': 'rating',
      'text': 'How was your overall experience?',
      'required': true,
    },
    {'type': 'text', 'text': 'What did you like most?', 'required': true},
    {'type': 'text', 'text': 'What frustrated you?', 'required': true},
  ];

  void _addQuestion(String type) {
    setState(() {
      questions.add({'type': type, 'text': '', 'required': false});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Qestionnaire', style: Theme.of(context).textTheme.headlineLarge),
        10.height(),
        Text(
          'build the survey your testers will complete.'.capitalize,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Drag to reorder questions.'.capitalize,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        20.height(),
        ReorderableListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) {
            setState(() {
              if (newIndex > oldIndex) newIndex--;
              final item = questions.removeAt(oldIndex);
              questions.insert(newIndex, item);
            });
          },
          children: questions.map((q) {
            final index = questions.indexOf(q);
            return Container(
              key: ValueKey(index),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.drag_handle,
                  color: Theme.of(context).textTheme.titleMedium!.color,
                ),
                title: _buildQuestionEditor(q, index),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: AppColors.red),
                  onPressed: () => setState(() => questions.removeAt(index)),
                ),
              ),
            );
          }).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _addButton('Rating', Icons.star),
                _addButton('Yes/No', Icons.check_circle),
                _addButton('Multiple Choice', Icons.radio_button_checked),
                _addButton('Text', Icons.text_fields),
                _addButton('Screenshot', Icons.screenshot),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionEditor(Map<String, dynamic> q, int index) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      decoration: InputDecoration(
        isDense: true,
        hintText: q['type'] == 'rating'
            ? 'How was your overall experience?'
            : 'Enter question...',
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      onChanged: (v) => questions[index]['text'] = v,
    );
  }

  Widget _addButton(String label, IconData icon) => OutlinedButton.icon(
    icon: Icon(icon, size: 20),
    label: Text(label),
    onPressed: () => _addQuestion(label.toLowerCase().replaceAll(' ', '_')),
  );
}
