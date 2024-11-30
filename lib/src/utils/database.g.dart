// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppUserTable extends AppUser with TableInfo<$AppUserTable, AppUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppUserTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_user';
  @override
  VerificationContext validateIntegrity(Insertable<AppUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppUserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $AppUserTable createAlias(String alias) {
    return $AppUserTable(attachedDatabase, alias);
  }
}

class AppUserData extends DataClass implements Insertable<AppUserData> {
  final int id;
  final String email;
  final String password;
  const AppUserData(
      {required this.id, required this.email, required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  AppUserCompanion toCompanion(bool nullToAbsent) {
    return AppUserCompanion(
      id: Value(id),
      email: Value(email),
      password: Value(password),
    );
  }

  factory AppUserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppUserData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  AppUserData copyWith({int? id, String? email, String? password}) =>
      AppUserData(
        id: id ?? this.id,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  AppUserData copyWithCompanion(AppUserCompanion data) {
    return AppUserData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppUserData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppUserData &&
          other.id == this.id &&
          other.email == this.email &&
          other.password == this.password);
}

class AppUserCompanion extends UpdateCompanion<AppUserData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> password;
  const AppUserCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  AppUserCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    required String password,
  })  : email = Value(email),
        password = Value(password);
  static Insertable<AppUserData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  AppUserCompanion copyWith(
      {Value<int>? id, Value<String>? email, Value<String>? password}) {
    return AppUserCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppUserCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppUserTable appUser = $AppUserTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appUser];
}

typedef $$AppUserTableCreateCompanionBuilder = AppUserCompanion Function({
  Value<int> id,
  required String email,
  required String password,
});
typedef $$AppUserTableUpdateCompanionBuilder = AppUserCompanion Function({
  Value<int> id,
  Value<String> email,
  Value<String> password,
});

class $$AppUserTableFilterComposer
    extends Composer<_$AppDatabase, $AppUserTable> {
  $$AppUserTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnFilters(column));
}

class $$AppUserTableOrderingComposer
    extends Composer<_$AppDatabase, $AppUserTable> {
  $$AppUserTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get password => $composableBuilder(
      column: $table.password, builder: (column) => ColumnOrderings(column));
}

class $$AppUserTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppUserTable> {
  $$AppUserTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);
}

class $$AppUserTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppUserTable,
    AppUserData,
    $$AppUserTableFilterComposer,
    $$AppUserTableOrderingComposer,
    $$AppUserTableAnnotationComposer,
    $$AppUserTableCreateCompanionBuilder,
    $$AppUserTableUpdateCompanionBuilder,
    (AppUserData, BaseReferences<_$AppDatabase, $AppUserTable, AppUserData>),
    AppUserData,
    PrefetchHooks Function()> {
  $$AppUserTableTableManager(_$AppDatabase db, $AppUserTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppUserTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppUserTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppUserTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              AppUserCompanion(
            id: id,
            email: email,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String email,
            required String password,
          }) =>
              AppUserCompanion.insert(
            id: id,
            email: email,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppUserTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppUserTable,
    AppUserData,
    $$AppUserTableFilterComposer,
    $$AppUserTableOrderingComposer,
    $$AppUserTableAnnotationComposer,
    $$AppUserTableCreateCompanionBuilder,
    $$AppUserTableUpdateCompanionBuilder,
    (AppUserData, BaseReferences<_$AppDatabase, $AppUserTable, AppUserData>),
    AppUserData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppUserTableTableManager get appUser =>
      $$AppUserTableTableManager(_db, _db.appUser);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'2f34e2ae7304b64fd8284f72a2755f054f895e25';

/// See also [database].
@ProviderFor(database)
final databaseProvider = AutoDisposeProvider<AppDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DatabaseRef = AutoDisposeProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
