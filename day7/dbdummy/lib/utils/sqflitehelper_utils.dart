// import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:sqflite/sqflite.dart';

// final Future<Database> database = openDatabase(
//   // Set the path to the database.
//   join(await getDatabasesPath(), 'doggie_database.db'),
//     // When the database is first created, create a table to store dogs.
//     onCreate: (db, version) {
//       // Run the CREATE TABLE statement on the database.
//       return db.execute(
//         "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
//       );
//     },
//       version: 1,
//   );

// Future<void> insertDog(Dog dog) async {
//   // Get a reference to the database.
//   final Database db = await database;

//   // Insert the Dog into the correct table. You might also specify the
//   // `conflictAlgorithm` to use in case the same dog is inserted twice.
//   //
//   // In this case, replace any previous data.
//   await db.insert(
//     'dogs',
//     dog.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }

// // Create a Dog and add it to the dogs table.
// final fido = Dog(
//   id: 0,
//   name: 'Fido',
//   age: 35,
// );

// insertDog(fido);

// import 'dart:io';

// import 'package:dbdummy/model/sqflite_model.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class DatabaseHelper {
// //create singelton object which means that this insatnce will be initialized only once in the entire application
//   static DatabaseHelper _databaseHelper;
//   static Database _database;
//   String columntable = 'pets';
//   String columnid = 'id';
//   String columnname = 'name';
//   String columnage = 'age';
//   String columnbreed = 'breed';
//   String columnimage = 'image';
//   String columndescription = 'description';
// //to create instance of Databasehelper
//   DatabaseHelper._createInstance();

//   factory DatabaseHelper() {
//     if (_databaseHelper == null) {
//       _databaseHelper = DatabaseHelper._createInstance();
//     }
//     return _databaseHelper;
//   }

//   Future<Database> get database async {
//     if (_database == null) {
//       _database = await initializeDatabse();
//     }
//     return _database;
//   }

//   Future<Database> initializeDatabse() async {
//     //getting the directory path for ios and android
//     Directory directory = await getApplicationDocumentsDirectory();
//     String path = directory.path + 'pets.db';
//     var petsdatabase =
//         await openDatabase(path, version: 1, onCreate: _createDb);
//     return petsdatabase;
//   }

//   //open/create database at the given path
//   void _createDb(Database db, int newVersion) async {
//     await db.execute(
//         'CREATE TABLE $columntable($columnid INTEGER PRIMARY KEY AUTOINCREMENT , $columnname Text, $columnage INTEGER, $columnbreed TEXT, $columnimage TEXT, $columndescription Text)');
//   }

//   //fetch
//   Future<List<Map<String, dynamic>>> getPetsMapList() async {
//     Database db = await this.database;

//     var result = await db.query(columntable);
//     return result;
//   }

//   //update
//   Future<int> updatePets(Data data) async {
//     Database db = await this.database;
//     var result = await db.update(columntable, data.tomap(),
//         where: '$columnid=?', whereArgs: [data.id]);
//     return result;
//   }

//   //insert
//   Future<int> insertPets(Data data) async {
//     Database db = await this.database;
//     var result = await db.insert(columntable, data.tomap());
//     return result;
//   }

//   //delete
//   Future<int> deletePets(int id) async {
//     Database db = await this.database;
//     var result =
//         await db.rawDelete('DELETE FROM $columntable WHERE $columnid=$id');
//     return result;
//   }

//   //no of records in db
//   Future<int> getCount() async {
//     Database db = await this.database;
//     List<Map<String, dynamic>> obj =
//         await db.rawQuery('SELECT COUNT (*) FROM $columntable');
//     int result = Sqflite.firstIntValue(obj);
//     return result;
//   }
// }
