import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'product_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('storekeeper.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(documentsDir.path, filePath);
    return await openDatabase(dbPath, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL,
        imagePath TEXT
      )
    ''');
  }

  // --- Create ---
  Future<int> insertProduct(Product product) async {
    final db = await instance.database;
    return await db.insert('products', product.toMap());
  }

  // --- Read ---
  Future<List<Product>> getProducts() async {
    final db = await instance.database;
    final result = await db.query('products', orderBy: 'id DESC');
    return result.map((json) => Product.fromMap(json)).toList();
  }

  // --- Update ---
  Future<int> updateProduct(Product product) async {
    final db = await instance.database;
    return await db.update(
      'products',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  // --- Delete ---
  Future<int> deleteProduct(int id) async {
    final db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  // --- Close DB ---
  Future close() async {
    final db = DatabaseHelper._database;
    db?.close();
  }
}
