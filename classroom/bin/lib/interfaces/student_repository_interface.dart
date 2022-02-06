import '../models/student_model.dart';

abstract class IStudentRepository {
  void create(StudentModel student);

  StudentModel readById(double id);

  StudentModel? readByRecord(int studentRecord);

  List<StudentModel> readAll();

  void delete(double id);

  void update(double id, StudentModel student);
}
