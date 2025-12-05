import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/employee_model.dart';
import 'view_employee_screen.dart';

class EmployeeviewScreen extends StatefulWidget {
  const EmployeeviewScreen({super.key});

  @override
  State<EmployeeviewScreen> createState() => _EmployeeviewScreenState();
}

class _EmployeeviewScreenState extends State<EmployeeviewScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;

  final List<EmployeeModel> _employees = [];

  final List<DropdownMenuItem<String>> _genders = const [
    DropdownMenuItem(value: "Male", child: Text("Male")),
    DropdownMenuItem(value: "Female", child: Text("Female")),
    DropdownMenuItem(value: "Other", child: Text("Other")),
  ];

  final List<DropdownMenuItem<String>> _departments = const [
    DropdownMenuItem(value: "IT", child: Text("IT")),
    DropdownMenuItem(value: "Sales", child: Text("Sales")),
    DropdownMenuItem(value: "Support", child: Text("Support")),
  ];

  @override
  void dispose() {
    _fullnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employee Details"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                  hintText: "Enter full name",
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter full name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField(
                items: _genders,
                onChanged: (value) => _selectedGender = value,
                decoration: InputDecoration(
                  labelText: "Gender",
                  prefixIcon: const Icon(Icons.person_2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null) return "Please select gender";
                  return null;
                },
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField(
                items: _departments,
                onChanged: (value) => _selectedDepartment = value,
                decoration: InputDecoration(
                  labelText: "Department",
                  prefixIcon: const Icon(Icons.apartment),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                validator: (value) {
                  if (value == null) return "Please select department";
                  return null;
                },
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EmployeeModel emp = EmployeeModel(
                            id: const Uuid().v4(),
                            fullname: _fullnameController.text,
                            gender: _selectedGender!,
                            department: _selectedDepartment!,
                          );

                          setState(() {
                            _employees.add(emp);
                          });
                        }
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add Employee"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ViewEmployeeScreen(employees: _employees),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text("View Employees"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              if (_employees.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _employees.length,
                  itemBuilder: (context, index) {
                    final emp = _employees[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            emp.fullname.isNotEmpty
                                ? emp.fullname[0].toUpperCase()
                                : "?",
                          ),
                        ),
                        title: Text(emp.fullname),
                        subtitle: Text("ID: ${emp.id}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _employees.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                )
              else
                Center(
                  child: Text(
                    "No Employees Added",
                    style: TextStyle(fontSize: 24, color: Colors.grey.shade400),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
