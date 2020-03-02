import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbDog {
  Database _database;
  Future openDb() async {
    if (_database == null) {
      _database = await openDatabase(join(await getDatabasesPath(), "dog.db"),
          version: 1, onCreate: (Database db, int version) async {
        await db.execute(
            " CREATE TABLE dog( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age TEXT, breed TEXT)");
      });
    }
  }

  Future<int> insertDog(Dog dog) async {
    await openDb();
    return await _database.insert('dog', dog.toMap());
    // conflictAlgorithm: ConflictAlgorithm.replace,
  }

  Future<List<Dog>> getDogList() async {
    await openDb();
    final List<Map<String, dynamic>> maps = await _database.query('dog');
    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        age: maps[i]['age'],
        name: maps[i]['name'],
        breed: maps[i]['breed'],
      );
    });
  }
}

class Dog {
  int id;
  String name;
  String age;
  String breed;
  String description;
  Dog({this.name, this.age, this.breed, id});
  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Age': age,
      'Breed': breed,
    };
  }
}
