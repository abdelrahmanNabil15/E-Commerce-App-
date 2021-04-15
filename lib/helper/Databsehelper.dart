

import 'package:e_commerce/model/cartModel.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper{
  DatabaseHelper._();
  static final DatabaseHelper db=  DatabaseHelper._();
  static Database _database;

  static Database _sqliteDb;
  static String sqliteDbName = 'db1.db';

  Future<Database> get database async {

    if (_database != null)  return _database;
    _database = await init();

    return _database;
  }
  static Future init() async {
    String databasesPath = await getDatabasesPath();
    String userDBPath = join(databasesPath, '$sqliteDbName');
    _sqliteDb = await openDatabase(
        userDBPath,
        version: 1,
        onCreate: (Database db, int version) async {

        await db.execute(
            '''
  CREATE TABLE $tableCartProduct(
  
  $ColumName TEXT NOT NULL,
  $Columimage TEXT NOT NULL, 
   $ColumQuantity INTEGER NOT NULL,
  $ColumPrice TEXT NOT NULL,
  )
  '''
        );
      });
    }
 Future<List<CartModel>>getallproduct()async{
  var dbClient =await _sqliteDb;
    List<Map> maps=await dbClient.query(tableCartProduct);
    List<CartModel> list =maps.isNotEmpty ?
        maps.map((product)=> CartModel.fromJson(product)).toList():[];

return list;
}
    insert (CartModel model)async{

    var dbClient =await _sqliteDb;
    await dbClient.insert(tableCartProduct, model.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );


    }
  }



