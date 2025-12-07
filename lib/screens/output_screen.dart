// import 'package:flutter/material.dart';
// import 'package:flutter_for_college/models/student_model.dart';

// class OutputScreen extends StatelessWidget {
//   const OutputScreen({super.key, required this.lstStudents});

//   final List<StudentModel> lstStudents;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Output Screen'),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: lstStudents.isNotEmpty
//       ? ListView.builder(
//         itemCount: lstStudents.length,
//         itemBuilder: (context, index) {
//           final student = lstStudents[index];
//           return Card(
//               margin: const EdgeInsets.symmetric(
//                 vertical: 8,
//                 horizontal: 16,
//               ),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   child: Text(student.fname[0].toUpperCase()),
//                 ),
//                 title: Text('${student.fname} ${student.lname}'),
//                 subtitle: Text(student.city),
//                 trailing: Wrap(
//                   spacing: 12,
//                   children: [

//                   ],
//                 ),
//               ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/student_model.dart';

class OutputScreen extends StatelessWidget {
  final List<StudentModel> students;

  const OutputScreen({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: students.isEmpty
          ? const Center(
              child: Text('No Students Added', style: TextStyle(fontSize: 24)),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(student.fname[0].toUpperCase()),
                    ),
                    title: Text('${student.fname} ${student.lname}'),
                    subtitle: Text(student.city),
                  ),
                );
              },
            ),
    );
  }
}
