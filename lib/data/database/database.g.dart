// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FolderTableTable extends FolderTable
    with drift.TableInfo<$FolderTableTable, FolderTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FolderTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nameMeta =
      const drift.VerificationMeta('name');
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _havePasswordMeta =
      const drift.VerificationMeta('havePassword');
  @override
  late final drift.GeneratedColumn<bool> havePassword =
      drift.GeneratedColumn<bool>(
          'have_password', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("have_password" IN (0, 1))'));
  static const drift.VerificationMeta _imageMeta =
      const drift.VerificationMeta('image');
  @override
  late final drift.GeneratedColumn<int> image = drift.GeneratedColumn<int>(
      'image', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, name, havePassword, image];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'folder_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<FolderTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('have_password')) {
      context.handle(
          _havePasswordMeta,
          havePassword.isAcceptableOrUnknown(
              data['have_password']!, _havePasswordMeta));
    } else if (isInserting) {
      context.missing(_havePasswordMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  FolderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FolderTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      havePassword: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}have_password'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image'])!,
    );
  }

  @override
  $FolderTableTable createAlias(String alias) {
    return $FolderTableTable(attachedDatabase, alias);
  }
}

class FolderTableData extends drift.DataClass
    implements drift.Insertable<FolderTableData> {
  final int id;
  final String name;
  final bool havePassword;
  final int image;
  const FolderTableData(
      {required this.id,
      required this.name,
      required this.havePassword,
      required this.image});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['name'] = drift.Variable<String>(name);
    map['have_password'] = drift.Variable<bool>(havePassword);
    map['image'] = drift.Variable<int>(image);
    return map;
  }

  FolderTableCompanion toCompanion(bool nullToAbsent) {
    return FolderTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      havePassword: drift.Value(havePassword),
      image: drift.Value(image),
    );
  }

  factory FolderTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return FolderTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      havePassword: serializer.fromJson<bool>(json['havePassword']),
      image: serializer.fromJson<int>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'havePassword': serializer.toJson<bool>(havePassword),
      'image': serializer.toJson<int>(image),
    };
  }

  FolderTableData copyWith(
          {int? id, String? name, bool? havePassword, int? image}) =>
      FolderTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        havePassword: havePassword ?? this.havePassword,
        image: image ?? this.image,
      );
  FolderTableData copyWithCompanion(FolderTableCompanion data) {
    return FolderTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      havePassword: data.havePassword.present
          ? data.havePassword.value
          : this.havePassword,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FolderTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('havePassword: $havePassword, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, havePassword, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolderTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.havePassword == this.havePassword &&
          other.image == this.image);
}

class FolderTableCompanion extends drift.UpdateCompanion<FolderTableData> {
  final drift.Value<int> id;
  final drift.Value<String> name;
  final drift.Value<bool> havePassword;
  final drift.Value<int> image;
  const FolderTableCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.havePassword = const drift.Value.absent(),
    this.image = const drift.Value.absent(),
  });
  FolderTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required String name,
    required bool havePassword,
    required int image,
  })  : name = drift.Value(name),
        havePassword = drift.Value(havePassword),
        image = drift.Value(image);
  static drift.Insertable<FolderTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? name,
    drift.Expression<bool>? havePassword,
    drift.Expression<int>? image,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (havePassword != null) 'have_password': havePassword,
      if (image != null) 'image': image,
    });
  }

  FolderTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? name,
      drift.Value<bool>? havePassword,
      drift.Value<int>? image}) {
    return FolderTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      havePassword: havePassword ?? this.havePassword,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (havePassword.present) {
      map['have_password'] = drift.Variable<bool>(havePassword.value);
    }
    if (image.present) {
      map['image'] = drift.Variable<int>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FolderTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('havePassword: $havePassword, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $DocumentPathTableTable extends DocumentPathTable
    with drift.TableInfo<$DocumentPathTableTable, DocumentPathTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentPathTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _documentIdMeta =
      const drift.VerificationMeta('documentId');
  @override
  late final drift.GeneratedColumn<int> documentId = drift.GeneratedColumn<int>(
      'document_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _pathMeta =
      const drift.VerificationMeta('path');
  @override
  late final drift.GeneratedColumn<String> path = drift.GeneratedColumn<String>(
      'path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, documentId, path];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_path_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<DocumentPathTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
          _documentIdMeta,
          documentId.isAcceptableOrUnknown(
              data['document_id']!, _documentIdMeta));
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentPathTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentPathTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      documentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}document_id'])!,
      path: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path'])!,
    );
  }

  @override
  $DocumentPathTableTable createAlias(String alias) {
    return $DocumentPathTableTable(attachedDatabase, alias);
  }
}

class DocumentPathTableData extends drift.DataClass
    implements drift.Insertable<DocumentPathTableData> {
  final int id;
  final int documentId;
  final String path;
  const DocumentPathTableData(
      {required this.id, required this.documentId, required this.path});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['document_id'] = drift.Variable<int>(documentId);
    map['path'] = drift.Variable<String>(path);
    return map;
  }

  DocumentPathTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentPathTableCompanion(
      id: drift.Value(id),
      documentId: drift.Value(documentId),
      path: drift.Value(path),
    );
  }

  factory DocumentPathTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return DocumentPathTableData(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'path': serializer.toJson<String>(path),
    };
  }

  DocumentPathTableData copyWith({int? id, int? documentId, String? path}) =>
      DocumentPathTableData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        path: path ?? this.path,
      );
  DocumentPathTableData copyWithCompanion(DocumentPathTableCompanion data) {
    return DocumentPathTableData(
      id: data.id.present ? data.id.value : this.id,
      documentId:
          data.documentId.present ? data.documentId.value : this.documentId,
      path: data.path.present ? data.path.value : this.path,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentPathTableData(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, documentId, path);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentPathTableData &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.path == this.path);
}

class DocumentPathTableCompanion
    extends drift.UpdateCompanion<DocumentPathTableData> {
  final drift.Value<int> id;
  final drift.Value<int> documentId;
  final drift.Value<String> path;
  const DocumentPathTableCompanion({
    this.id = const drift.Value.absent(),
    this.documentId = const drift.Value.absent(),
    this.path = const drift.Value.absent(),
  });
  DocumentPathTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required int documentId,
    required String path,
  })  : documentId = drift.Value(documentId),
        path = drift.Value(path);
  static drift.Insertable<DocumentPathTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? documentId,
    drift.Expression<String>? path,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (path != null) 'path': path,
    });
  }

  DocumentPathTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<int>? documentId,
      drift.Value<String>? path}) {
    return DocumentPathTableCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      path: path ?? this.path,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = drift.Variable<int>(documentId.value);
    }
    if (path.present) {
      map['path'] = drift.Variable<String>(path.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentPathTableCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }
}

class $FolderDocumentTableTable extends FolderDocumentTable
    with drift.TableInfo<$FolderDocumentTableTable, FolderDocumentTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FolderDocumentTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _documentIdMeta =
      const drift.VerificationMeta('documentId');
  @override
  late final drift.GeneratedColumn<int> documentId = drift.GeneratedColumn<int>(
      'document_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _folderIdMeta =
      const drift.VerificationMeta('folderId');
  @override
  late final drift.GeneratedColumn<int> folderId = drift.GeneratedColumn<int>(
      'folder_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, documentId, folderId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'folder_document_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<FolderDocumentTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
          _documentIdMeta,
          documentId.isAcceptableOrUnknown(
              data['document_id']!, _documentIdMeta));
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('folder_id')) {
      context.handle(_folderIdMeta,
          folderId.isAcceptableOrUnknown(data['folder_id']!, _folderIdMeta));
    } else if (isInserting) {
      context.missing(_folderIdMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  FolderDocumentTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FolderDocumentTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      documentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}document_id'])!,
      folderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}folder_id'])!,
    );
  }

  @override
  $FolderDocumentTableTable createAlias(String alias) {
    return $FolderDocumentTableTable(attachedDatabase, alias);
  }
}

class FolderDocumentTableData extends drift.DataClass
    implements drift.Insertable<FolderDocumentTableData> {
  final int id;
  final int documentId;
  final int folderId;
  const FolderDocumentTableData(
      {required this.id, required this.documentId, required this.folderId});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['document_id'] = drift.Variable<int>(documentId);
    map['folder_id'] = drift.Variable<int>(folderId);
    return map;
  }

  FolderDocumentTableCompanion toCompanion(bool nullToAbsent) {
    return FolderDocumentTableCompanion(
      id: drift.Value(id),
      documentId: drift.Value(documentId),
      folderId: drift.Value(folderId),
    );
  }

  factory FolderDocumentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return FolderDocumentTableData(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      folderId: serializer.fromJson<int>(json['folderId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'folderId': serializer.toJson<int>(folderId),
    };
  }

  FolderDocumentTableData copyWith({int? id, int? documentId, int? folderId}) =>
      FolderDocumentTableData(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        folderId: folderId ?? this.folderId,
      );
  FolderDocumentTableData copyWithCompanion(FolderDocumentTableCompanion data) {
    return FolderDocumentTableData(
      id: data.id.present ? data.id.value : this.id,
      documentId:
          data.documentId.present ? data.documentId.value : this.documentId,
      folderId: data.folderId.present ? data.folderId.value : this.folderId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FolderDocumentTableData(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('folderId: $folderId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, documentId, folderId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FolderDocumentTableData &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.folderId == this.folderId);
}

class FolderDocumentTableCompanion
    extends drift.UpdateCompanion<FolderDocumentTableData> {
  final drift.Value<int> id;
  final drift.Value<int> documentId;
  final drift.Value<int> folderId;
  const FolderDocumentTableCompanion({
    this.id = const drift.Value.absent(),
    this.documentId = const drift.Value.absent(),
    this.folderId = const drift.Value.absent(),
  });
  FolderDocumentTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required int documentId,
    required int folderId,
  })  : documentId = drift.Value(documentId),
        folderId = drift.Value(folderId);
  static drift.Insertable<FolderDocumentTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? documentId,
    drift.Expression<int>? folderId,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (folderId != null) 'folder_id': folderId,
    });
  }

  FolderDocumentTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<int>? documentId,
      drift.Value<int>? folderId}) {
    return FolderDocumentTableCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      folderId: folderId ?? this.folderId,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = drift.Variable<int>(documentId.value);
    }
    if (folderId.present) {
      map['folder_id'] = drift.Variable<int>(folderId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FolderDocumentTableCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('folderId: $folderId')
          ..write(')'))
        .toString();
  }
}

class $DocumentTableTable extends DocumentTable
    with drift.TableInfo<$DocumentTableTable, DocumentTableData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentTableTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nameMeta =
      const drift.VerificationMeta('name');
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const drift.VerificationMeta _createdMeta =
      const drift.VerificationMeta('created');
  @override
  late final drift.GeneratedColumn<DateTime> created =
      drift.GeneratedColumn<DateTime>('created', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, name, created];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_table';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<DocumentTableData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $DocumentTableTable createAlias(String alias) {
    return $DocumentTableTable(attachedDatabase, alias);
  }
}

class DocumentTableData extends drift.DataClass
    implements drift.Insertable<DocumentTableData> {
  final int id;
  final String name;
  final DateTime created;
  const DocumentTableData(
      {required this.id, required this.name, required this.created});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['name'] = drift.Variable<String>(name);
    map['created'] = drift.Variable<DateTime>(created);
    return map;
  }

  DocumentTableCompanion toCompanion(bool nullToAbsent) {
    return DocumentTableCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      created: drift.Value(created),
    );
  }

  factory DocumentTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return DocumentTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  DocumentTableData copyWith({int? id, String? name, DateTime? created}) =>
      DocumentTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        created: created ?? this.created,
      );
  DocumentTableData copyWithCompanion(DocumentTableCompanion data) {
    return DocumentTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.created == this.created);
}

class DocumentTableCompanion extends drift.UpdateCompanion<DocumentTableData> {
  final drift.Value<int> id;
  final drift.Value<String> name;
  final drift.Value<DateTime> created;
  const DocumentTableCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.created = const drift.Value.absent(),
  });
  DocumentTableCompanion.insert({
    this.id = const drift.Value.absent(),
    required String name,
    required DateTime created,
  })  : name = drift.Value(name),
        created = drift.Value(created);
  static drift.Insertable<DocumentTableData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? name,
    drift.Expression<DateTime>? created,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created != null) 'created': created,
    });
  }

  DocumentTableCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? name,
      drift.Value<DateTime>? created}) {
    return DocumentTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created: created ?? this.created,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (created.present) {
      map['created'] = drift.Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends drift.GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  $AppDataBaseManager get managers => $AppDataBaseManager(this);
  late final $FolderTableTable folderTable = $FolderTableTable(this);
  late final $DocumentPathTableTable documentPathTable =
      $DocumentPathTableTable(this);
  late final $FolderDocumentTableTable folderDocumentTable =
      $FolderDocumentTableTable(this);
  late final $DocumentTableTable documentTable = $DocumentTableTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities =>
      [folderTable, documentPathTable, folderDocumentTable, documentTable];
}

typedef $$FolderTableTableCreateCompanionBuilder = FolderTableCompanion
    Function({
  drift.Value<int> id,
  required String name,
  required bool havePassword,
  required int image,
});
typedef $$FolderTableTableUpdateCompanionBuilder = FolderTableCompanion
    Function({
  drift.Value<int> id,
  drift.Value<String> name,
  drift.Value<bool> havePassword,
  drift.Value<int> image,
});

class $$FolderTableTableFilterComposer
    extends drift.Composer<_$AppDataBase, $FolderTableTable> {
  $$FolderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<bool> get havePassword => $composableBuilder(
      column: $table.havePassword,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get image => $composableBuilder(
      column: $table.image, builder: (column) => drift.ColumnFilters(column));
}

class $$FolderTableTableOrderingComposer
    extends drift.Composer<_$AppDataBase, $FolderTableTable> {
  $$FolderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<bool> get havePassword => $composableBuilder(
      column: $table.havePassword,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get image => $composableBuilder(
      column: $table.image, builder: (column) => drift.ColumnOrderings(column));
}

class $$FolderTableTableAnnotationComposer
    extends drift.Composer<_$AppDataBase, $FolderTableTable> {
  $$FolderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<bool> get havePassword => $composableBuilder(
      column: $table.havePassword, builder: (column) => column);

  drift.GeneratedColumn<int> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);
}

class $$FolderTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $FolderTableTable,
    FolderTableData,
    $$FolderTableTableFilterComposer,
    $$FolderTableTableOrderingComposer,
    $$FolderTableTableAnnotationComposer,
    $$FolderTableTableCreateCompanionBuilder,
    $$FolderTableTableUpdateCompanionBuilder,
    (
      FolderTableData,
      drift.BaseReferences<_$AppDataBase, $FolderTableTable, FolderTableData>
    ),
    FolderTableData,
    drift.PrefetchHooks Function()> {
  $$FolderTableTableTableManager(_$AppDataBase db, $FolderTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FolderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FolderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FolderTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> name = const drift.Value.absent(),
            drift.Value<bool> havePassword = const drift.Value.absent(),
            drift.Value<int> image = const drift.Value.absent(),
          }) =>
              FolderTableCompanion(
            id: id,
            name: name,
            havePassword: havePassword,
            image: image,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String name,
            required bool havePassword,
            required int image,
          }) =>
              FolderTableCompanion.insert(
            id: id,
            name: name,
            havePassword: havePassword,
            image: image,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FolderTableTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDataBase,
    $FolderTableTable,
    FolderTableData,
    $$FolderTableTableFilterComposer,
    $$FolderTableTableOrderingComposer,
    $$FolderTableTableAnnotationComposer,
    $$FolderTableTableCreateCompanionBuilder,
    $$FolderTableTableUpdateCompanionBuilder,
    (
      FolderTableData,
      drift.BaseReferences<_$AppDataBase, $FolderTableTable, FolderTableData>
    ),
    FolderTableData,
    drift.PrefetchHooks Function()>;
typedef $$DocumentPathTableTableCreateCompanionBuilder
    = DocumentPathTableCompanion Function({
  drift.Value<int> id,
  required int documentId,
  required String path,
});
typedef $$DocumentPathTableTableUpdateCompanionBuilder
    = DocumentPathTableCompanion Function({
  drift.Value<int> id,
  drift.Value<int> documentId,
  drift.Value<String> path,
});

class $$DocumentPathTableTableFilterComposer
    extends drift.Composer<_$AppDataBase, $DocumentPathTableTable> {
  $$DocumentPathTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get documentId => $composableBuilder(
      column: $table.documentId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => drift.ColumnFilters(column));
}

class $$DocumentPathTableTableOrderingComposer
    extends drift.Composer<_$AppDataBase, $DocumentPathTableTable> {
  $$DocumentPathTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get documentId => $composableBuilder(
      column: $table.documentId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get path => $composableBuilder(
      column: $table.path, builder: (column) => drift.ColumnOrderings(column));
}

class $$DocumentPathTableTableAnnotationComposer
    extends drift.Composer<_$AppDataBase, $DocumentPathTableTable> {
  $$DocumentPathTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<int> get documentId => $composableBuilder(
      column: $table.documentId, builder: (column) => column);

  drift.GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);
}

class $$DocumentPathTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $DocumentPathTableTable,
    DocumentPathTableData,
    $$DocumentPathTableTableFilterComposer,
    $$DocumentPathTableTableOrderingComposer,
    $$DocumentPathTableTableAnnotationComposer,
    $$DocumentPathTableTableCreateCompanionBuilder,
    $$DocumentPathTableTableUpdateCompanionBuilder,
    (
      DocumentPathTableData,
      drift.BaseReferences<_$AppDataBase, $DocumentPathTableTable,
          DocumentPathTableData>
    ),
    DocumentPathTableData,
    drift.PrefetchHooks Function()> {
  $$DocumentPathTableTableTableManager(
      _$AppDataBase db, $DocumentPathTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentPathTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentPathTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentPathTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> documentId = const drift.Value.absent(),
            drift.Value<String> path = const drift.Value.absent(),
          }) =>
              DocumentPathTableCompanion(
            id: id,
            documentId: documentId,
            path: path,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required int documentId,
            required String path,
          }) =>
              DocumentPathTableCompanion.insert(
            id: id,
            documentId: documentId,
            path: path,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DocumentPathTableTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDataBase,
        $DocumentPathTableTable,
        DocumentPathTableData,
        $$DocumentPathTableTableFilterComposer,
        $$DocumentPathTableTableOrderingComposer,
        $$DocumentPathTableTableAnnotationComposer,
        $$DocumentPathTableTableCreateCompanionBuilder,
        $$DocumentPathTableTableUpdateCompanionBuilder,
        (
          DocumentPathTableData,
          drift.BaseReferences<_$AppDataBase, $DocumentPathTableTable,
              DocumentPathTableData>
        ),
        DocumentPathTableData,
        drift.PrefetchHooks Function()>;
typedef $$FolderDocumentTableTableCreateCompanionBuilder
    = FolderDocumentTableCompanion Function({
  drift.Value<int> id,
  required int documentId,
  required int folderId,
});
typedef $$FolderDocumentTableTableUpdateCompanionBuilder
    = FolderDocumentTableCompanion Function({
  drift.Value<int> id,
  drift.Value<int> documentId,
  drift.Value<int> folderId,
});

class $$FolderDocumentTableTableFilterComposer
    extends drift.Composer<_$AppDataBase, $FolderDocumentTableTable> {
  $$FolderDocumentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get documentId => $composableBuilder(
      column: $table.documentId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get folderId => $composableBuilder(
      column: $table.folderId,
      builder: (column) => drift.ColumnFilters(column));
}

class $$FolderDocumentTableTableOrderingComposer
    extends drift.Composer<_$AppDataBase, $FolderDocumentTableTable> {
  $$FolderDocumentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get documentId => $composableBuilder(
      column: $table.documentId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get folderId => $composableBuilder(
      column: $table.folderId,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$FolderDocumentTableTableAnnotationComposer
    extends drift.Composer<_$AppDataBase, $FolderDocumentTableTable> {
  $$FolderDocumentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<int> get documentId => $composableBuilder(
      column: $table.documentId, builder: (column) => column);

  drift.GeneratedColumn<int> get folderId =>
      $composableBuilder(column: $table.folderId, builder: (column) => column);
}

class $$FolderDocumentTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $FolderDocumentTableTable,
    FolderDocumentTableData,
    $$FolderDocumentTableTableFilterComposer,
    $$FolderDocumentTableTableOrderingComposer,
    $$FolderDocumentTableTableAnnotationComposer,
    $$FolderDocumentTableTableCreateCompanionBuilder,
    $$FolderDocumentTableTableUpdateCompanionBuilder,
    (
      FolderDocumentTableData,
      drift.BaseReferences<_$AppDataBase, $FolderDocumentTableTable,
          FolderDocumentTableData>
    ),
    FolderDocumentTableData,
    drift.PrefetchHooks Function()> {
  $$FolderDocumentTableTableTableManager(
      _$AppDataBase db, $FolderDocumentTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FolderDocumentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FolderDocumentTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FolderDocumentTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> documentId = const drift.Value.absent(),
            drift.Value<int> folderId = const drift.Value.absent(),
          }) =>
              FolderDocumentTableCompanion(
            id: id,
            documentId: documentId,
            folderId: folderId,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required int documentId,
            required int folderId,
          }) =>
              FolderDocumentTableCompanion.insert(
            id: id,
            documentId: documentId,
            folderId: folderId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FolderDocumentTableTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$AppDataBase,
        $FolderDocumentTableTable,
        FolderDocumentTableData,
        $$FolderDocumentTableTableFilterComposer,
        $$FolderDocumentTableTableOrderingComposer,
        $$FolderDocumentTableTableAnnotationComposer,
        $$FolderDocumentTableTableCreateCompanionBuilder,
        $$FolderDocumentTableTableUpdateCompanionBuilder,
        (
          FolderDocumentTableData,
          drift.BaseReferences<_$AppDataBase, $FolderDocumentTableTable,
              FolderDocumentTableData>
        ),
        FolderDocumentTableData,
        drift.PrefetchHooks Function()>;
typedef $$DocumentTableTableCreateCompanionBuilder = DocumentTableCompanion
    Function({
  drift.Value<int> id,
  required String name,
  required DateTime created,
});
typedef $$DocumentTableTableUpdateCompanionBuilder = DocumentTableCompanion
    Function({
  drift.Value<int> id,
  drift.Value<String> name,
  drift.Value<DateTime> created,
});

class $$DocumentTableTableFilterComposer
    extends drift.Composer<_$AppDataBase, $DocumentTableTable> {
  $$DocumentTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => drift.ColumnFilters(column));
}

class $$DocumentTableTableOrderingComposer
    extends drift.Composer<_$AppDataBase, $DocumentTableTable> {
  $$DocumentTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<DateTime> get created => $composableBuilder(
      column: $table.created,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$DocumentTableTableAnnotationComposer
    extends drift.Composer<_$AppDataBase, $DocumentTableTable> {
  $$DocumentTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get created =>
      $composableBuilder(column: $table.created, builder: (column) => column);
}

class $$DocumentTableTableTableManager extends drift.RootTableManager<
    _$AppDataBase,
    $DocumentTableTable,
    DocumentTableData,
    $$DocumentTableTableFilterComposer,
    $$DocumentTableTableOrderingComposer,
    $$DocumentTableTableAnnotationComposer,
    $$DocumentTableTableCreateCompanionBuilder,
    $$DocumentTableTableUpdateCompanionBuilder,
    (
      DocumentTableData,
      drift
      .BaseReferences<_$AppDataBase, $DocumentTableTable, DocumentTableData>
    ),
    DocumentTableData,
    drift.PrefetchHooks Function()> {
  $$DocumentTableTableTableManager(_$AppDataBase db, $DocumentTableTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> name = const drift.Value.absent(),
            drift.Value<DateTime> created = const drift.Value.absent(),
          }) =>
              DocumentTableCompanion(
            id: id,
            name: name,
            created: created,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String name,
            required DateTime created,
          }) =>
              DocumentTableCompanion.insert(
            id: id,
            name: name,
            created: created,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DocumentTableTableProcessedTableManager = drift.ProcessedTableManager<
    _$AppDataBase,
    $DocumentTableTable,
    DocumentTableData,
    $$DocumentTableTableFilterComposer,
    $$DocumentTableTableOrderingComposer,
    $$DocumentTableTableAnnotationComposer,
    $$DocumentTableTableCreateCompanionBuilder,
    $$DocumentTableTableUpdateCompanionBuilder,
    (
      DocumentTableData,
      drift
      .BaseReferences<_$AppDataBase, $DocumentTableTable, DocumentTableData>
    ),
    DocumentTableData,
    drift.PrefetchHooks Function()>;

class $AppDataBaseManager {
  final _$AppDataBase _db;
  $AppDataBaseManager(this._db);
  $$FolderTableTableTableManager get folderTable =>
      $$FolderTableTableTableManager(_db, _db.folderTable);
  $$DocumentPathTableTableTableManager get documentPathTable =>
      $$DocumentPathTableTableTableManager(_db, _db.documentPathTable);
  $$FolderDocumentTableTableTableManager get folderDocumentTable =>
      $$FolderDocumentTableTableTableManager(_db, _db.folderDocumentTable);
  $$DocumentTableTableTableManager get documentTable =>
      $$DocumentTableTableTableManager(_db, _db.documentTable);
}
