import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class ViewEmployeeScreen extends StatelessWidget {
  final List<EmployeeModel> employees;

  const ViewEmployeeScreen({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Employees"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: employees.isEmpty
            ? Center(
                child: Text(
                  "No Employees Added",
                  style: TextStyle(fontSize: 23, color: Colors.grey.shade400),
                ),
              )
            : ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final emp = employees[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(emp.fullname[0].toUpperCase()),
                      ),
                      title: Text(emp.fullname),
                      subtitle: Text(
                        "ID: ${emp.id}\nDepartment: ${emp.department}",
                      ),
                      trailing: Text(emp.gender),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
