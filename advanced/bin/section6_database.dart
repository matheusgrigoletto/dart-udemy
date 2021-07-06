import 'dart:io';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';

void main() {
  //lesson1_selecting_rows();
  lesson2_using_queries();
  //lesson3_names_and_indexes();
  //lesson4_transactions();
  //lesson5_assignment();
}

void lesson1_selecting_rows() async {
  var pool = ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );

  var results = await pool.query('Select * from teachers');

  print('Results ${await results.length} rows');

  pool.closeConnectionsNow();
  exit(0);
}

void lesson2_using_queries() async {
  var pool = ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );


  var query = await pool.prepare('insert into teachers (name,topic) values (?,?)');
  insert(query,'Bob', 'Science');
  insert(query, 'Mary', 'Shop');
}

void lesson3_names_and_indexes() async {
  var pool = ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );

  var results = await pool.query('select Name, Topic from teachers');

  await results.forEach((row) {
    print('Name: ${row[0]}, Topic: ${row.Topic}'); //name or index
  });

  pool.closeConnectionsNow();
  exit(0);
}

void lesson4_transactions() async {
  Future<int> find(var pool, String name) async {
    var query = await pool.prepare('select idteachers from teachers where Name=?');
    var results = await query.execute([name]);
    var row = await results.first;
    return row[0];
  }

  Future<int> insert(var pool, String name, String topic) async {
    var query = await pool.prepare('insert into teachers (name, topic) values (?,?)');
    var results = await query.execute([name,topic]);
    return results.insertId;
  }

  Future delete(var pool, int value) async {
    var query = await pool.prepare('delete from teachers where idteachers=?');
    var results = await query.execute([value]);
  }

  var pool = ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );

  var trans = await pool.startTransaction();

  try {

    var id = await insert(pool, 'Zazzy', 'Dart');
    var person = await find(pool, 'Bryan');
    await delete(pool, person);

    await trans.commit();
    print('done');
  }
  catch(err) {
    print(err.toString());
    await trans.rollback();
  }
  finally {
    await pool.closeConnectionsNow();
    exit(0);
  }
}

void lesson5_assignment() async {
  void insert(var query, String name) async {
    var result = await query.execute([name]);
    print('New student ID: ${result.insertId}');
  }

  var pool = ConnectionPool(
      host: 'localhost',
      port: 3306,
      user: 'bryan',
      password: 'password',
      db: 'school',
      max: 5
  );

  var query = await pool.prepare('insert into students (name) values (?)');
  insert(query, 'Marc');
  insert(query, 'Chad');
  insert(query, 'Stacy');
  insert(query, 'Peter');

  pool.closeConnectionsNow();
  exit(0);
}

void insert(var query, String name, String topic) async {
  var result = await query.execute([name,topic]);
  print('New user id = ${result.insertId}');
}