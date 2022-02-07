import 'package:mocktail/mocktail.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../lib/models/student_model.dart';
import '../../lib/repositories/student_repository.dart';

class StudentRepositoryMock extends Mock implements StudentRepository {}

void main() {
  var repository = StudentRepositoryMock();
  var student = StudentModel(
    studentRecord: 1,
    id: 1.0,
    name: 'Vitor',
    averageGrade: 7.5,
    grade: 1,
  );
  test('deve retornar uma instancia de StudentModel', () {
    when(() => repository.readById(1.0)).thenReturn(student);

    var std = repository.readById(1.0);

    expect(std.name, 'Vitor');
  });


}
