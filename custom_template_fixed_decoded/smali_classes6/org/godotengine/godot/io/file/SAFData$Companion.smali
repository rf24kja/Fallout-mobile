.class public final Lorg/godotengine/godot/io/file/SAFData$Companion;
.super Ljava/lang/Object;
.source "SAFData.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/file/SAFData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/SAFData$Companion$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSAFData.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SAFData.kt\norg/godotengine/godot/io/file/SAFData$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 Uri.kt\nandroidx/core/net/UriKt\n*L\n1#1,208:1\n1#2:209\n29#3:210\n*S KotlinDebug\n*F\n+ 1 SAFData.kt\norg/godotengine/godot/io/file/SAFData$Companion\n*L\n120#1:210\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0005J\u0016\u0010\u000c\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0005J\u0016\u0010\u000e\u001a\u00020\r2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0005J\u0016\u0010\u000f\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0005J\u001e\u0010\u0010\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0011\u001a\u00020\u00052\u0006\u0010\u0012\u001a\u00020\u0005J \u0010\u0013\u001a\u00020\u00142\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u0015\u001a\u00020\u0016H\u0002R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/SAFData$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "fileExists",
        "",
        "context",
        "Landroid/content/Context;",
        "path",
        "fileLastModified",
        "",
        "fileSize",
        "delete",
        "rename",
        "from",
        "to",
        "resolvePath",
        "Landroid/net/Uri;",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
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

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/io/file/SAFData$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$resolvePath(Lorg/godotengine/godot/io/file/SAFData$Companion;Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/io/file/SAFData$Companion;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;

    .line 52
    invoke-direct {p0, p1, p2, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private final resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;

    .line 120
    move-object/from16 v0, p2

    .local v0, "$this$toUri$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 210
    .local v1, "$i$f$toUri":I
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "Uri.parse(this)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 120
    .end local v0    # "$this$toUri$iv":Ljava/lang/String;
    .end local v1    # "$i$f$toUri":I
    move-object v0, v2

    .line 121
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v1

    .line 123
    .local v1, "fragment":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 124
    return-object v0

    .line 128
    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    .line 129
    .local v2, "treeUri":Landroid/net/Uri;
    move-object v3, v1

    .line 131
    .local v3, "relativePath":Ljava/lang/String;
    move-object/from16 v4, p1

    invoke-static {v4, v2}, Landroidx/documentfile/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v5

    if-eqz v5, :cond_8

    .line 134
    .local v5, "rootDir":Landroidx/documentfile/provider/DocumentFile;
    move-object v6, v3

    check-cast v6, Ljava/lang/CharSequence;

    const/4 v12, 0x1

    new-array v7, v12, [C

    const/16 v8, 0x2f

    const/4 v13, 0x0

    aput-char v8, v7, v13

    const/4 v10, 0x6

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v6

    .line 135
    .local v6, "parts":Ljava/util/List;
    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->last(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 136
    .local v7, "filename":Ljava/lang/String;
    invoke-static {v6, v12}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v8

    .line 138
    .local v8, "folderParts":Ljava/util/List;
    move-object v9, v5

    .line 140
    .local v9, "current":Landroidx/documentfile/provider/DocumentFile;
    sget-object v10, Lorg/godotengine/godot/io/file/SAFData$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual/range {p3 .. p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 144
    move v12, v13

    goto :goto_0

    .line 143
    :pswitch_0
    nop

    .line 140
    :goto_0
    move v10, v12

    .line 147
    .local v10, "isWriteMode":Z
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 148
    .local v12, "folder":Ljava/lang/String;
    invoke-virtual {v9, v12}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v13

    .line 150
    .local v13, "next":Landroidx/documentfile/provider/DocumentFile;
    if-nez v13, :cond_3

    .line 151
    if-eqz v10, :cond_2

    .line 152
    invoke-virtual {v9, v12}, Landroidx/documentfile/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v14

    if-eqz v14, :cond_1

    move-object v13, v14

    goto :goto_2

    .line 153
    :cond_1
    new-instance v11, Ljava/lang/IllegalStateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Failed to create directory: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 155
    :cond_2
    new-instance v11, Ljava/lang/IllegalStateException;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Directory not found: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 159
    :cond_3
    :goto_2
    move-object v9, v13

    .end local v12    # "folder":Ljava/lang/String;
    .end local v13    # "next":Landroidx/documentfile/provider/DocumentFile;
    goto :goto_1

    .line 162
    :cond_4
    invoke-virtual {v9, v7}, Landroidx/documentfile/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v11

    .line 164
    .local v11, "file":Landroidx/documentfile/provider/DocumentFile;
    if-nez v11, :cond_7

    .line 165
    if-eqz v10, :cond_6

    .line 166
    const-string v12, "*/*"

    invoke-virtual {v9, v12, v7}, Landroidx/documentfile/provider/DocumentFile;->createFile(Ljava/lang/String;Ljava/lang/String;)Landroidx/documentfile/provider/DocumentFile;

    move-result-object v12

    if-eqz v12, :cond_5

    move-object v11, v12

    goto :goto_3

    .line 167
    :cond_5
    new-instance v12, Ljava/lang/IllegalStateException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Failed to create file: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 169
    :cond_6
    new-instance v12, Ljava/lang/IllegalStateException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "File does not exist: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 173
    :cond_7
    :goto_3
    invoke-virtual {v11}, Landroidx/documentfile/provider/DocumentFile;->getUri()Landroid/net/Uri;

    move-result-object v12

    const-string v13, "getUri(...)"

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v12

    .line 132
    .end local v5    # "rootDir":Landroidx/documentfile/provider/DocumentFile;
    .end local v6    # "parts":Ljava/util/List;
    .end local v7    # "filename":Ljava/lang/String;
    .end local v8    # "folderParts":Ljava/util/List;
    .end local v9    # "current":Landroidx/documentfile/provider/DocumentFile;
    .end local v10    # "isWriteMode":Z
    .end local v11    # "file":Landroidx/documentfile/provider/DocumentFile;
    :cond_8
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unable to resolve tree URI: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final delete(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    nop

    .line 106
    :try_start_0
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {p0, p1, p2, v0}, Lorg/godotengine/godot/io/file/SAFData$Companion;->resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v0

    .line 107
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, v0}, Landroid/provider/DocumentsContract;->deleteDocument(Landroid/content/ContentResolver;Landroid/net/Uri;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "uri":Landroid/net/Uri;
    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/io/file/SAFData;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error deleting file"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 110
    const/4 v1, 0x0

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return v1
.end method

.method public final fileExists(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    nop

    .line 57
    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {p0, p1, p2, v1}, Lorg/godotengine/godot/io/file/SAFData$Companion;->resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v3

    .line 59
    .local v3, "uri":Landroid/net/Uri;
    nop

    .line 58
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const-string v5, "_display_name"

    aput-object v5, v4, v0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 59
    if-eqz v2, :cond_0

    .line 58
    check-cast v2, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :try_start_1
    move-object v4, v2

    check-cast v4, Landroid/database/Cursor;

    .line 209
    .local v4, "cursor":Landroid/database/Cursor;
    const/4 v5, 0x0

    .line 59
    .local v5, "$i$a$-use-SAFData$Companion$fileExists$1":I
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v5    # "$i$a$-use-SAFData$Companion$fileExists$1":I
    const/4 v4, 0x0

    :try_start_2
    invoke-static {v2, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 58
    if-ne v6, v1, :cond_1

    move v0, v1

    goto :goto_0

    .line 59
    :catchall_0
    move-exception v1

    .end local v3    # "uri":Landroid/net/Uri;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v4

    :try_start_4
    invoke-static {v2, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    throw v4
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 58
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 60
    .end local v3    # "uri":Landroid/net/Uri;
    :catch_0
    move-exception v1

    .line 61
    .local v1, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/io/file/SAFData;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Error checking file existence"

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 62
    nop

    .line 56
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    return v0
.end method

.method public final fileLastModified(Landroid/content/Context;Ljava/lang/String;)J
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "last_modified"

    const-string v1, "context"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "path"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    nop

    .line 68
    :try_start_0
    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {p0, p1, p2, v1}, Lorg/godotengine/godot/io/file/SAFData$Companion;->resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v3

    .line 69
    .local v3, "uri":Landroid/net/Uri;
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, v4, v1

    .line 70
    .local v4, "projection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_1

    check-cast v1, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v2, v1

    check-cast v2, Landroid/database/Cursor;

    .local v2, "cursor":Landroid/database/Cursor;
    const/4 v5, 0x0

    .line 71
    .local v5, "$i$a$-use-SAFData$Companion$fileLastModified$1":I
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_0

    .line 72
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 73
    .local v0, "index":I
    const/4 v6, -0x1

    if-eq v0, v6, :cond_0

    .line 74
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "index":I
    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v5    # "$i$a$-use-SAFData$Companion$fileLastModified$1":I
    :try_start_2
    invoke-static {v1, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-wide v8

    .line 77
    .restart local v2    # "cursor":Landroid/database/Cursor;
    .restart local v5    # "$i$a$-use-SAFData$Companion$fileLastModified$1":I
    :cond_0
    nop

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v5    # "$i$a$-use-SAFData$Companion$fileLastModified$1":I
    :try_start_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 70
    :try_start_4
    invoke-static {v1, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "projection":[Ljava/lang/String;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local v4    # "projection":[Ljava/lang/String;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v2

    :try_start_6
    invoke-static {v1, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 78
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :cond_1
    :goto_0
    nop

    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "projection":[Ljava/lang/String;
    goto :goto_1

    .line 79
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/io/file/SAFData;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error reading last modified for"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 81
    nop

    .line 67
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final fileSize(Landroid/content/Context;Ljava/lang/String;)J
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;

    const-string v0, "_size"

    const-string v1, "context"

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "path"

    invoke-static {p2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    nop

    .line 87
    :try_start_0
    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {p0, p1, p2, v1}, Lorg/godotengine/godot/io/file/SAFData$Companion;->resolvePath(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v3

    .line 88
    .local v3, "uri":Landroid/net/Uri;
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object v0, v4, v1

    .line 89
    .local v4, "projection":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_1

    check-cast v1, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v2, v1

    check-cast v2, Landroid/database/Cursor;

    .local v2, "cursor":Landroid/database/Cursor;
    const/4 v5, 0x0

    .line 90
    .local v5, "$i$a$-use-SAFData$Companion$fileSize$1":I
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_0

    .line 91
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    .line 92
    .local v0, "index":I
    const/4 v6, -0x1

    if-eq v0, v6, :cond_0

    .line 93
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "index":I
    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v5    # "$i$a$-use-SAFData$Companion$fileSize$1":I
    :try_start_2
    invoke-static {v1, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-wide v8

    .line 96
    .restart local v2    # "cursor":Landroid/database/Cursor;
    .restart local v5    # "$i$a$-use-SAFData$Companion$fileSize$1":I
    :cond_0
    nop

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v5    # "$i$a$-use-SAFData$Companion$fileSize$1":I
    :try_start_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    :try_start_4
    invoke-static {v1, v7}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "projection":[Ljava/lang/String;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    :try_start_5
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .restart local v3    # "uri":Landroid/net/Uri;
    .restart local v4    # "projection":[Ljava/lang/String;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :catchall_1
    move-exception v2

    :try_start_6
    invoke-static {v1, v0}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "path":Ljava/lang/String;
    throw v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 97
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "path":Ljava/lang/String;
    :cond_1
    :goto_0
    nop

    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "projection":[Ljava/lang/String;
    goto :goto_1

    .line 98
    :catch_0
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/io/file/SAFData;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error reading file size"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 100
    nop

    .line 86
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "from"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    const/4 v0, 0x0

    return v0
.end method
