import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/calc_history_model.dart';


class DBHelper {
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'calc.db');
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
    );
  }

  static const String TABLE_CALCULATE = 'calculate_master';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_EXPRESSION = 'expression';
  static const String COLUMN_RESULT = 'result';
  static const String COLUMN_CREATED_AT = 'created_at';

  Future<void> onCreate(Database db, int version) async {
    await db.execute(
        '''
    CREATE TABLE IF NOT EXISTS $TABLE_CALCULATE (
      $COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT,
      $COLUMN_EXPRESSION TEXT,
      $COLUMN_RESULT TEXT,
      $COLUMN_CREATED_AT DATETIME
    )
    '''
    );
  }

  Future<void> onUpgrade(Database db, int oldVersion, int newVersion) async {
      await db.execute("DROP TABLE IF EXISTS $TABLE_CALCULATE");
      await onCreate(db, newVersion);
  }

  Future<int> insertCalculation(CalculationHistoryModel calculationHistoryModel) async {
    try {
      final dbcalc = await db;

      var result = await dbcalc.rawInsert(
        'INSERT INTO $TABLE_CALCULATE '
            '(expression, result, created_at) '
            'VALUES(?,?,?)',
        [
          calculationHistoryModel.expression,
          calculationHistoryModel.result,
          calculationHistoryModel.createdAt,
        ],
      );

      return result;

    } catch (e) {
      print("Insert Error : $e");
      return 0;
    }
  }


  Future<List<CalculationHistoryModel>>fetchHistory()async{
    final dbcalc = await db;

    List<Map<String,dynamic>> result = await dbcalc.rawQuery('SELECT * FROM $TABLE_CALCULATE');

    List<CalculationHistoryModel>historyList =[];

    for(int i=0; i< result.length;i++){
      CalculationHistoryModel history = CalculationHistoryModel(
          id : result[i]['id'],
          expression: result[i]['expression'],
          result: result[i]['result'],
          createdAt: result[i]['created_at']
      );
      historyList.add(history);
    }
    return historyList;
  }



  Future<void> clearHistoryResults() async {
    final dbClient = await db;
    await dbClient.delete(TABLE_CALCULATE);
  }

  Future<int>deleteHistory(String id)async{
    try{
      final dbClient = await db;
      return await dbClient.delete('$TABLE_CALCULATE',where: "id=?",whereArgs: [id]);
    }
    catch(e){
      print("print error :$e");
      return 0;
    }
  }


}