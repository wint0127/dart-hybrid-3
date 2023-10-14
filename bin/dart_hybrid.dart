import 'package:dart_hybrid/dart_hybrid.dart' as dart_hybrid;
import 'dart:convert';

void main() {
      String jsonString = '''
[
  {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
  {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
  {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
  {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
]
''';

  List<Map<String, String>> jsonData = (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>().map((e) {
    return e.cast<String, String>();
  }).toList();

  Students students = Students(jsonData);
  students.sort("last");
  students.plus({"first": "Bob", "last": "Bobby", "email": "email@email.com"});
  students.remove("first");
  students.output();
}

class Students {
  List<Map<String, String>> people;
  Students(this.people);

  remove(String field){
    people.removeWhere((student) => student[field] == "Tony" );
  }

  plus(Map <String, String> newStudent){
    people.add(newStudent);
  }

  sort(String field) {
    people.sort((a, b) => (a[field] ?? '').compareTo(b[field] ?? ''));
  }

  output() {
    for (var student in people){
      print('Name: ${student['first']} ${student['last']}, Email: ${student['email']}');
    };
    }

  }



  







