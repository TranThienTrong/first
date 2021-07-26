import 'package:sqflite/sqflite.dart' as sqlite;
import 'package:path/path.dart' as path;


class DBHelper {

  static void createDatabase() async {
    String dbPath = await sqlite.getDatabasesPath();
    sqlite.openDatabase(
      dbPath + '/places.db',
      version: 1,
    );
  }

  static dropDatabase() async {
    String dbPath = await sqlite.getDatabasesPath();
    await sqlite.deleteDatabase(path.join(dbPath, 'places.db'));
  }

  static Future<sqlite.Database> getDatabase() async {
    String dbPath = await sqlite.getDatabasesPath();


    return await sqlite.openDatabase(
        path.join(dbPath, 'places.db'),
        version: 1,
        onCreate: (database, version) async {
          await database.execute('CREATE TABLE Places(id TEXT PRIMARY KEY, title TEXT, image TEXT, location_latitude REAL, location_longitude REAL, address TEXT);');
        }
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    sqlite.Database database = await DBHelper.getDatabase();
    database.insert(table, data);
  }

  static Future<List<Map<String, Object?>>> getTableRecords(String table) async {
    sqlite.Database database = await DBHelper.getDatabase();

    List<Map<String, Object?>> records = await database.query(table);
    return records;
  }
}
