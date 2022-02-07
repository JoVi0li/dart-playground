import '../interfaces/student_repository_interface.dart';
import '../models/student_model.dart';

class StudentRepository implements IStudentRepository {
  List<StudentModel> studentsList = [];

  @override
  void create(StudentModel student) {
    try {
      StudentModel? studentExist = readByRecord(student.studentRecord);

      if (studentExist!.studentRecord == student.studentRecord) {
        throw Exception('O estudante já está cadastrado no sistema');
      } else {
        studentsList.add(student);
      }
    } catch (e) {
      throw Exception(
        'Não foi possível cadastrar o aluno!\n Erro ${e.toString()}',
      );
    }
  }

  @override
  void delete(double id) {
    try {
      StudentModel? student =
          studentsList.firstWhere((element) => element.id == id);

      studentsList.remove(student);
    } catch (e) {
      throw Exception(
        'Não foi possível excluir o aluno! \n Erro: ${e.toString()}',
      );
    }
  }

  @override
  List<StudentModel> readAll() {
    try {
      List<StudentModel> students = [...studentsList];

      return students;
    } catch (e) {
      throw Exception(
        'Não foi possível listar os alunos! \n Erro: ${e.toString()}',
      );
    }
  }

  @override
  StudentModel readById(double id) {
    try {
      StudentModel student = studentsList.firstWhere(
        (element) => element.id == id,
      );

      return student;
    } catch (e) {
      throw Exception(
        'Não foi possível buscar o aluno pelo id! \n Erro: ${e.toString()}',
      );
    }
  }

  @override
  StudentModel? readByRecord(int studentRecord) {
    try {
      StudentModel? student = studentsList
          .firstWhere((element) => element.studentRecord == studentRecord);

      return student;
    } catch (e) {
      throw Exception(
        'Não foi possível buscar o aluno pelo registro! \nErro: ${e.toString()}',
      );
    }
  }

  @override
  void update(double id, StudentModel student) {
    try {
      StudentModel studentOld = readById(id);
      if (studentsList.contains(studentOld)) {
        int studentIndex = studentsList.indexOf(studentOld);
        studentsList[studentIndex] = student;
      }
    } catch (e) {
      throw Exception(
        'Não foi possível atualizar o aluno! \nErro: ${e.toString()}',
      );
    }
  }
}
