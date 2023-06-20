class Queries {
  static const String creatUsersTableQuery = '''
        create table Users (
          id text primary key, 
          name text not null,
          email text not null,
          currentBalance double not null
          )
      ''';
}
