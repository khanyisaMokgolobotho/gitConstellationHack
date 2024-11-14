import 'package:flutter/material.dart';

class ReportIssuePage extends StatefulWidget {
  @override
  _ReportIssuePageState createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final TextEditingController _issueController = TextEditingController();

  void _submitIssue() {
    if (_issueController.text.isNotEmpty) {
      // Logic to submit the issue
      // For now, show a simple success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Issue reported successfully!')),
      );
      _issueController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter an issue')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report an Issue'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _issueController,
              decoration: InputDecoration(
                labelText: 'Describe the issue',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitIssue,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
