import 'package:flutter/material.dart';

class AdminReports extends StatefulWidget {
  const AdminReports({super.key});

  @override
  State<AdminReports> createState() => _AdminReportsState();
}

class _AdminReportsState extends State<AdminReports> {
  final List<Map<String, dynamic>> reports = [
    {
      'reporter': 'Ahmed',
      'reported': 'Mona',
      'reason': 'Spam',
      'status': 'Pending',
    },
    {
      'reporter': 'Sara',
      'reported': 'User123',
      'reason': 'Inappropriate behavior',
      'status': 'Pending',
    },
    {
      'reporter': 'Mohamed',
      'reported': 'Ali',
      'reason': 'Harassment',
      'status': 'Resolved',
    },
    {
      'reporter': 'Nour',
      'reported': 'TestUser',
      'reason': 'Fake account',
      'status': 'Pending',
    },
  ];

  void resolveReport(int index) {
    setState(() {
      reports[index]['status'] = 'Resolved';
    });
  }

  void deleteReport(int index) {
    setState(() {
      reports.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF11101A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF191627),
        foregroundColor: Colors.white,
        title: const Text('Reports Management'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          final resolved = report['status'] == 'Resolved';

          return Card(
            color: const Color(0xFF211B31),
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.report_problem,
                        color: resolved
                            ? Colors.greenAccent
                            : Colors.orangeAccent,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Report #${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        resolved ? 'RESOLVED' : 'PENDING',
                        style: TextStyle(
                          color: resolved
                              ? Colors.greenAccent
                              : Colors.orangeAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Reporter: ${report['reporter']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Reported User: ${report['reported']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Reason: ${report['reason']}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (!resolved)
                        ElevatedButton.icon(
                          onPressed: () => resolveReport(index),
                          icon: const Icon(Icons.check),
                          label: const Text('Resolve'),
                        ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => deleteReport(index),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
