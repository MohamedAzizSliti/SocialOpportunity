import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'SocialOppertunity.db');
    var database =
        await openDatabase(path, version: 1, onCreate: _createDatabase);
    return database;
  }

  Future<void> _createDatabase(Database database, int version) async {
    String sql =
        """CREATE TABLE Favorite (idopportunity  INT PRIMARY KEY , name TEXT NOT NULL, description TEXT NOT NULL, Category  TEXT  NOT NULL, Date DATETIME NOT NULL, Address TEXT )""";
    await database.execute(sql).catchError((error) => print(error.toString()));
  }
}
