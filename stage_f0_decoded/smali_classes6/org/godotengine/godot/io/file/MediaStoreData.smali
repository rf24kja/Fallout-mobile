.class public final Lorg/godotengine/godot/io/file/MediaStoreData;
.super Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;
.source "MediaStoreData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/MediaStoreData$Companion;,
        Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;,
        Lorg/godotengine/godot/io/file/MediaStoreData$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u0001\u0018\u0000 \u00172\u00020\u0001:\u0002\u0016\u0017B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0014\u001a\u00020\u0015H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000e\u001a\u00020\u000fX\u0090\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/MediaStoreData;",
        "Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;",
        "context",
        "Landroid/content/Context;",
        "filePath",
        "",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V",
        "id",
        "",
        "uri",
        "Landroid/net/Uri;",
        "fileChannel",
        "Ljava/nio/channels/FileChannel;",
        "getFileChannel$lib_templateDebug",
        "()Ljava/nio/channels/FileChannel;",
        "parcelFileDescriptor",
        "Landroid/os/ParcelFileDescriptor;",
        "close",
        "",
        "DataItem",
        "Companion",
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


# static fields
.field private static final COLLECTION:Landroid/net/Uri;

.field public static final Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

.field private static final PROJECTION:[Ljava/lang/String;

.field private static final SELECTION_BY_ID:Ljava/lang/String; = "_id = ? "

.field private static final SELECTION_BY_PATH:Ljava/lang/String; = "_display_name = ?  AND relative_path = ?"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final filePath:Ljava/lang/String;

.field private final id:J

.field private final parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private final uri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    .line 72
    const-class v0, Lorg/godotengine/godot/io/file/MediaStoreData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->TAG:Ljava/lang/String;

    .line 74
    const-string v0, "external_primary"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->COLLECTION:Landroid/net/Uri;

    .line 76
    nop

    .line 77
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "_id"

    aput-object v2, v0, v1

    .line 78
    const-string v1, "_display_name"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 77
    nop

    .line 79
    const-string v1, "relative_path"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 77
    nop

    .line 80
    const-string v1, "_size"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 77
    nop

    .line 81
    const-string v1, "date_modified"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 77
    nop

    .line 82
    const-string v1, "media_type"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 77
    nop

    .line 76
    sput-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "filePath"    # Ljava/lang/String;
    .param p3, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filePath"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "accessFlag"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 59
    invoke-direct {p0, p2}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;-><init>(Ljava/lang/String;)V

    .line 58
    iput-object p2, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    .line 255
    nop

    .line 256
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 257
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    sget-object v1, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    invoke-static {v1, p1, v2}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->access$queryByPath(Lorg/godotengine/godot/io/file/MediaStoreData$Companion;Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 259
    .local v1, "dataItems":Ljava/util/List;
    sget-object v2, Lorg/godotengine/godot/io/file/MediaStoreData$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->ordinal()I

    move-result v3

    aget v2, v2, v3

    const-string v3, "Unable to access file "

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_0

    new-instance v2, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v2}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v2

    .line 272
    :pswitch_0
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 273
    sget-object v2, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    invoke-static {v2, p1, v4}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->access$addFile(Lorg/godotengine/godot/io/file/MediaStoreData$Companion;Landroid/content/Context;Ljava/lang/String;)Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    move-result-object v2

    goto :goto_0

    .line 275
    :cond_0
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 272
    :goto_0
    nop

    .line 278
    .local v2, "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    if-eqz v2, :cond_1

    .line 281
    nop

    .end local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    goto :goto_1

    .line 279
    .restart local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :cond_1
    new-instance v4, Ljava/io/FileNotFoundException;

    iget-object v5, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 262
    .end local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :pswitch_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 266
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;

    .line 267
    .restart local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    nop

    .line 259
    .end local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :goto_1
    nop

    .line 285
    .restart local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getId()J

    move-result-wide v3

    iput-wide v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->id:J

    .line 286
    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;->getUri()Landroid/net/Uri;

    move-result-object v3

    iput-object v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->uri:Landroid/net/Uri;

    .line 288
    iget-object v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->uri:Landroid/net/Uri;

    invoke-virtual {p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->getMode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v3

    if-eqz v3, :cond_4

    iput-object v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 290
    sget-object v3, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    if-ne p3, v3, :cond_2

    .line 291
    new-instance v3, Ljava/io/FileInputStream;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-virtual {v3}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    goto :goto_2

    .line 293
    :cond_2
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    .line 290
    :goto_2
    invoke-static {v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iput-object v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 296
    invoke-virtual {p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->shouldTruncate()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 297
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/MediaStoreData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-virtual {v3, v4, v5}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 299
    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v1    # "dataItems":Ljava/util/List;
    .end local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :cond_3
    nop

    .line 58
    return-void

    .line 289
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    .restart local v1    # "dataItems":Ljava/util/List;
    .restart local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :cond_4
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Unable to access file descriptor"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 263
    .end local v2    # "dataItem":Lorg/godotengine/godot/io/file/MediaStoreData$DataItem;
    :cond_5
    new-instance v2, Ljava/io/FileNotFoundException;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static final synthetic access$getCOLLECTION$cp()Landroid/net/Uri;
    .locals 1

    .line 57
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->COLLECTION:Landroid/net/Uri;

    return-object v0
.end method

.method public static final synthetic access$getPROJECTION$cp()[Ljava/lang/String;
    .locals 1

    .line 57
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 7

    .line 302
    const-string v0, "Exception when closing ParcelFileDescriptor for "

    const-string v1, "."

    .line 303
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/MediaStoreData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 307
    nop

    .line 308
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 309
    :catch_0
    move-exception v2

    .line 310
    .local v2, "e":Ljava/io/IOException;
    sget-object v3, Lorg/godotengine/godot/io/file/MediaStoreData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v2

    check-cast v1, Ljava/lang/Throwable;

    invoke-static {v3, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 312
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    goto :goto_2

    .line 307
    :catchall_0
    move-exception v2

    goto :goto_3

    .line 304
    :catch_1
    move-exception v2

    .line 305
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Lorg/godotengine/godot/io/file/MediaStoreData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception when closing file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v5, v2

    check-cast v5, Ljava/lang/Throwable;

    invoke-static {v3, v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 307
    .end local v2    # "e":Ljava/io/IOException;
    nop

    .line 308
    :try_start_3
    iget-object v2, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 309
    :catch_2
    move-exception v2

    .line 310
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v3, Lorg/godotengine/godot/io/file/MediaStoreData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_0

    .line 313
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .line 308
    :goto_3
    :try_start_4
    iget-object v3, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_4

    .line 309
    :catch_3
    move-exception v3

    .line 310
    .local v3, "e":Ljava/io/IOException;
    sget-object v4, Lorg/godotengine/godot/io/file/MediaStoreData;->TAG:Ljava/lang/String;

    iget-object v5, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->filePath:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object v1, v3

    check-cast v1, Ljava/lang/Throwable;

    invoke-static {v4, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v3    # "e":Ljava/io/IOException;
    :goto_4
    throw v2
.end method

.method public getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;
    .locals 1

    .line 252
    iget-object v0, p0, Lorg/godotengine/godot/io/file/MediaStoreData;->fileChannel:Ljava/nio/channels/FileChannel;

    return-object v0
.end method
