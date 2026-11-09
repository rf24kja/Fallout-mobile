.class public final Lorg/godotengine/godot/io/file/MediaStoreData$Companion;
.super Ljava/lang/Object;
.source "MediaStoreData.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/file/MediaStoreData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0008\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001b\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00050\n2\u0006\u0010\u000e\u001a\u00020\u0005H\u0002\u00a2\u0006\u0002\u0010\u000fJ\u001b\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00050\n2\u0006\u0010\u0012\u001a\u00020\u0013H\u0002\u00a2\u0006\u0002\u0010\u0014J\u0018\u0010\u0015\u001a\n \u0006*\u0004\u0018\u00010\u00050\u00052\u0006\u0010\u000e\u001a\u00020\u0005H\u0002J\u0010\u0010\u0016\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u0005H\u0002J\u001e\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u00182\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0012\u001a\u00020\u0013H\u0002J\u001e\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u00182\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005H\u0002J\u0018\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00190\u00182\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0002J\u001a\u0010 \u001a\u0004\u0018\u00010\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005H\u0002J\u0016\u0010!\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005J\u0016\u0010#\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005J\u0016\u0010$\u001a\u00020\u00132\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005J\u0016\u0010%\u001a\u00020\u00132\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u0005J\u001e\u0010&\u001a\u00020\"2\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\'\u001a\u00020\u00052\u0006\u0010(\u001a\u00020\u0005R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0007\u001a\n \u0006*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u00050\nX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000bR\u000e\u0010\u000c\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/MediaStoreData$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "COLLECTION",
        "Landroid/net/Uri;",
        "PROJECTION",
        "",
        "[Ljava/lang/String;",
        "SELECTION_BY_PATH",
        "getSelectionByPathArguments",
        "path",
        "(Ljava/lang/String;)[Ljava/lang/String;",
        "SELECTION_BY_ID",
        "getSelectionByIdArgument",
        "id",
        "",
        "(J)[Ljava/lang/String;",
        "getMediaStoreDisplayName",
        "getMediaStoreRelativePath",
        "queryById",
        "",
        "Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;",
        "context",
        "Landroid/content/Context;",
        "queryByPath",
        "dataItemFromCursor",
        "query",
        "Landroid/database/Cursor;",
        "addFile",
        "delete",
        "",
        "fileExists",
        "fileLastModified",
        "fileSize",
        "rename",
        "from",
        "to",
        "lib_templateDebug"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$addFile(Lorg/godotengine/godot/io/file/MediaStoreData$Companion;Landroid/content/Context;Ljava/lang/String;)Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/io/file/MediaStoreData$Companion;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    .line 71
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->addFile(Landroid/content/Context;Ljava/lang/String;)Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$queryByPath(Lorg/godotengine/godot/io/file/MediaStoreData$Companion;Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/io/file/MediaStoreData$Companion;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    .line 71
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private final addFile(Landroid/content/Context;Ljava/lang/String;)Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    .line 167
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    move-object v1, v0

    .local v1, "$this$addFile_u24lambda_u241":Landroid/content/ContentValues;
    const/4 v2, 0x0

    .line 168
    .local v2, "$i$a$-apply-MediaStoreData$Companion$addFile$fileDetails$1":I
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "_id"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 169
    sget-object v4, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-direct {v4, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreDisplayName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "_display_name"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    sget-object v4, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-direct {v4, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "relative_path"

    invoke-virtual {v1, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    nop

    .line 167
    .end local v1    # "$this$addFile_u24lambda_u241":Landroid/content/ContentValues;
    .end local v2    # "$i$a$-apply-MediaStoreData$Companion$addFile$fileDetails$1":I
    nop

    .line 173
    .local v0, "fileDetails":Landroid/content/ContentValues;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getCOLLECTION$cp()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    .line 176
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 177
    .local v1, "infos":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 178
    return-object v2

    .line 181
    :cond_1
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    return-object v2
.end method

.method private final dataItemFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    .locals 25
    .param p1, "query"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;",
            ">;"
        }
    .end annotation

    .line 131
    const-string v0, "getString(...)"

    if-eqz p1, :cond_2

    move-object/from16 v1, p1

    check-cast v1, Ljava/io/Closeable;

    :try_start_0
    move-object v2, v1

    check-cast v2, Landroid/database/Cursor;

    .local v2, "cursor":Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 132
    .local v3, "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    .line 133
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_0

    .line 134
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v3    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    invoke-static {v1, v5}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v0

    .line 136
    .restart local v2    # "cursor":Landroid/database/Cursor;
    .restart local v3    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    :cond_0
    :try_start_1
    const-string v4, "_id"

    invoke-interface {v2, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    .line 138
    .local v4, "idColumn":I
    const-string v6, "_display_name"

    invoke-interface {v2, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 137
    nop

    .line 140
    .local v6, "displayNameColumn":I
    const-string v7, "relative_path"

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    .line 139
    nop

    .line 141
    .local v7, "relativePathColumn":I
    const-string v8, "_size"

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v8

    .line 143
    .local v8, "sizeColumn":I
    const-string v9, "date_modified"

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    .line 142
    nop

    .line 144
    .local v9, "dateModifiedColumn":I
    const-string v10, "media_type"

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    .line 146
    .local v10, "mediaTypeColumn":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 147
    .local v11, "result":Ljava/util/ArrayList;
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v12

    if-eqz v12, :cond_1

    .line 148
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 149
    .local v12, "id":J
    nop

    .line 150
    new-instance v15, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 151
    nop

    .line 152
    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getCOLLECTION$cp()Landroid/net/Uri;

    move-result-object v14

    invoke-static {v14, v12, v13}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v14

    const-string v5, "withAppendedId(...)"

    invoke-static {v14, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    move/from16 v23, v3

    .end local v3    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    .local v23, "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    invoke-interface {v2, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 156
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 157
    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    .line 150
    move-object/from16 v17, v14

    move-object v14, v15

    move-object/from16 v24, v0

    move-object v0, v15

    move-wide v15, v12

    move-object/from16 v18, v5

    move-object/from16 v19, v3

    invoke-direct/range {v14 .. v22}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;-><init>(JLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;III)V

    .line 149
    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v3, v23

    move-object/from16 v0, v24

    const/4 v5, 0x0

    goto :goto_0

    .line 161
    .end local v12    # "id":J
    .end local v23    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    .restart local v3    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    :cond_1
    move/from16 v23, v3

    .end local v3    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    .restart local v23    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    move-object v0, v11

    check-cast v0, Ljava/util/List;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v2, 0x0

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v4    # "idColumn":I
    .end local v6    # "displayNameColumn":I
    .end local v7    # "relativePathColumn":I
    .end local v8    # "sizeColumn":I
    .end local v9    # "dateModifiedColumn":I
    .end local v10    # "mediaTypeColumn":I
    .end local v11    # "result":Ljava/util/ArrayList;
    .end local v23    # "$i$a$-use-MediaStoreData$Companion$dataItemFromCursor$1":I
    invoke-static {v1, v2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v0

    :catchall_0
    move-exception v0

    move-object v2, v0

    .end local p1    # "query":Landroid/database/Cursor;
    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .restart local p1    # "query":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    move-object v3, v0

    invoke-static {v1, v2}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v3

    .line 163
    :cond_2
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private final getMediaStoreDisplayName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .line 96
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final getMediaStoreRelativePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "path"    # Ljava/lang/String;

    .line 99
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 100
    .local v0, "pathFile":Ljava/io/File;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    .line 101
    .local v1, "environmentDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "getAbsolutePath(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v6, 0x4

    const/4 v7, 0x0

    const-string v4, ""

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Lkotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    :cond_0
    const-string v2, ""

    :cond_1
    const/4 v3, 0x1

    new-array v3, v3, [C

    const/16 v4, 0x2f

    const/4 v5, 0x0

    aput-char v4, v3, v5

    invoke-static {v2, v3}, Lkotlin/text/StringsKt;->trim(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "relativePath":Ljava/lang/String;
    move-object v3, v2

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 103
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 105
    :cond_2
    return-object v2
.end method

.method private final getSelectionByIdArgument(J)[Ljava/lang/String;
    .locals 3
    .param p1, "id"    # J

    .line 94
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method private final getSelectionByPathArguments(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .line 89
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreDisplayName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method private final queryById(Landroid/content/Context;J)Ljava/util/List;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Ljava/util/List<",
            "Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;",
            ">;"
        }
    .end annotation

    .line 109
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 110
    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getCOLLECTION$cp()Landroid/net/Uri;

    move-result-object v1

    .line 111
    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getPROJECTION$cp()[Ljava/lang/String;

    move-result-object v2

    .line 112
    nop

    .line 113
    invoke-direct {p0, p2, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getSelectionByIdArgument(J)[Ljava/lang/String;

    move-result-object v4

    .line 114
    nop

    .line 109
    const-string v3, "_id = ? "

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 116
    .local v0, "query":Landroid/database/Cursor;
    invoke-direct {p0, v0}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->dataItemFromCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private final queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;",
            ">;"
        }
    .end annotation

    .line 120
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 121
    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getCOLLECTION$cp()Landroid/net/Uri;

    move-result-object v1

    .line 122
    invoke-static {}, Lorg/godotengine/godot/io/file/MediaStoreData;->access$getPROJECTION$cp()[Ljava/lang/String;

    move-result-object v2

    .line 123
    nop

    .line 124
    invoke-direct {p0, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getSelectionByPathArguments(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 125
    nop

    .line 120
    const-string v3, "_display_name = ?  AND relative_path = ?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 127
    .local v0, "query":Landroid/database/Cursor;
    invoke-direct {p0, v0}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->dataItemFromCursor(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public final delete(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 185
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 186
    .local v0, "itemsToDelete":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 187
    return v2

    .line 190
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 191
    .local v1, "resolver":Landroid/content/ContentResolver;
    const/4 v3, 0x0

    .line 192
    .local v3, "itemsDeleted":I
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 193
    .local v5, "item":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    invoke-virtual {v5}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getUri()Landroid/net/Uri;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    add-int/2addr v3, v6

    .end local v5    # "item":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    goto :goto_0

    .line 196
    :cond_1
    if-lez v3, :cond_2

    const/4 v2, 0x1

    :cond_2
    return v2
.end method

.method public final fileExists(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 200
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public final fileLastModified(Landroid/content/Context;Ljava/lang/String;)J
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 204
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 205
    .local v0, "result":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 206
    const-wide/16 v1, 0x0

    return-wide v1

    .line 209
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 210
    .local v1, "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    invoke-virtual {v1}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getDateModified()I

    move-result v2

    int-to-long v2, v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    return-wide v2
.end method

.method public final fileSize(Landroid/content/Context;Ljava/lang/String;)J
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 214
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 215
    .local v0, "result":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 216
    const-wide/16 v1, -0x1

    return-wide v1

    .line 219
    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 220
    .local v1, "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    invoke-virtual {v1}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getSize()I

    move-result v2

    int-to-long v2, v2

    return-wide v2
.end method

.method public final rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "from"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 225
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->queryByPath(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 226
    .local v0, "sources":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 227
    return v2

    .line 231
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 234
    .local v1, "source":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    move-object v4, v3

    .local v4, "$this$rename_u24lambda_u242":Landroid/content/ContentValues;
    const/4 v5, 0x0

    .line 235
    .local v5, "$i$a$-apply-MediaStoreData$Companion$rename$updatedDetails$1":I
    sget-object v6, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-direct {v6, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreDisplayName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "_display_name"

    invoke-virtual {v4, v7, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    sget-object v6, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-direct {v6, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getMediaStoreRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "relative_path"

    invoke-virtual {v4, v7, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    nop

    .line 234
    .end local v4    # "$this$rename_u24lambda_u242":Landroid/content/ContentValues;
    .end local v5    # "$i$a$-apply-MediaStoreData$Companion$rename$updatedDetails$1":I
    nop

    .line 239
    .local v3, "updatedDetails":Landroid/content/ContentValues;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 240
    invoke-virtual {v1}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getUri()Landroid/net/Uri;

    move-result-object v5

    .line 241
    nop

    .line 242
    nop

    .line 243
    invoke-virtual {v1}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getId()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->getSelectionByIdArgument(J)[Ljava/lang/String;

    move-result-object v6

    .line 239
    const-string v7, "_id = ? "

    invoke-virtual {v4, v5, v3, v7, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v4

    .line 245
    .local v4, "updated":I
    if-lez v4, :cond_1

    const/4 v2, 0x1

    :cond_1
    return v2
.end method
