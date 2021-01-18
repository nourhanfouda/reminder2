import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pills_reminder/models/drug_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  static final String databaseName = 'billreminder.db';
  static final String tableName = 'reminder';
  static final String drugIdColumn = 'drugid';
  static final String drugNameColumnn = 'drugname';
  static final String drugDoseColumn = 'drugdose';
  // static final String drugImageUrl = 'imageUrl';

  // static final String drugDateColumnn = 'drugdate';
  // static final String drugTimeColumn = 'drugtime';
  static final String drugIsMedicineColumnName = 'isComplete';

  Database database;
  initializeBillreminderDatabase() async {
    if (database == null) {
      database = await connectToDataBase();
    }
  }

  Future<Database> connectToDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String databasePath = join(directory.path, 'billreminder.db');
    Database database = await openDatabase(
      databasePath,
      version: 2,
      onCreate: (db, version) {
        createbillTable(db, version);
      },
    );
    return database;
  }

  createbillTable(Database database, int version) {
    database.execute('''CREATE TABLE $tableName(
$drugIdColumn INTEGER PRIMARY KEY AUTOINCREMENT,
$drugNameColumnn TEXT NOT NULL,

$drugDoseColumn TEXT NOT NULL,
$drugIsMedicineColumnName INTEGER NOT NULL
)''');
  }

  /**
   *  DBHelper.drugNameColumnn: this.drugname,
      DBHelper.drugDateColumnn: this.date,
      DBHelper.drugDoseColumn: this.drugdose,
      DBHelper.drugTimeColumn: this.time,
      DBHelper.drugIsMedicineColumnName: this.isMedicine ? 1 : 0


      $drugDateColumnn INTEGER NOT NULL,
      $drugTimeColumn TEXT NOT NULL,
   * */

  insertNewdrug(DrugModel drugModel) async {
    try {
      int result = await database.insert(tableName, drugModel.toMap());
      print(result);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<List<Map<String, dynamic>>> selectAlldrugs() async {
    try {
      List<Map<String, dynamic>> allRows = await database.query(tableName);
      return allRows;
    } on Exception catch (e) {
      print(e);
    }
  }

  getOnedrug(int id) async {
    try {
      List<Map<String, dynamic>> result = await database
          .query(tableName, where: '$drugIdColumn=?', whereArgs: [id]);
    } on Exception catch (e) {
      // TODO
    }
  }

  deletedrug(int id) async {
    database.delete(tableName, where: '$drugIdColumn=?', whereArgs: [id]);
  }

  updateDrug(DrugModel drugmodel) async {
    //drugmodel.isMedicine = !drugmodel.isMedicine;
    try {
      database.update(tableName, drugmodel.toMap(),
          where: '$drugIdColumn=?', whereArgs: [drugmodel.id]);
      print('Updated');
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteAlldrugs() async {
    database.delete(tableName);
  }
}
