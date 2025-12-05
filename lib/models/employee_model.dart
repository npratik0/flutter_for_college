import 'package:uuid/uuid.dart';

class EmployeeModel {
  final String id;
  final String fullname;
  final String gender;
  final String department;

  EmployeeModel({
    String? id,
    required this.fullname,
    required this.gender,
    required this.department,
  }) : id = id ?? const Uuid().v4(); // auto-generate UUID
}
