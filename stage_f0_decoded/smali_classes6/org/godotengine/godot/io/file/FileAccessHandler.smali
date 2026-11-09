.class public final Lorg/godotengine/godot/io/file/FileAccessHandler;
.super Ljava/lang/Object;
.source "FileAccessHandler.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0011\u0018\u0000 =2\u00020\u0001:\u0001=B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0010H\u0002J\u0010\u0010\u0016\u001a\u00020\u00142\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0018J\u0018\u0010\u0019\u001a\u00020\u00102\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u001b\u001a\u00020\u0010J-\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u001d\u0012\u0004\u0012\u00020\u00100\u001c2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0000\u00a2\u0006\u0002\u0008 J\u000e\u0010!\u001a\u00020\"2\u0006\u0010\u0015\u001a\u00020\u0010J\u0016\u0010#\u001a\u00020$2\u0006\u0010\u0015\u001a\u00020\u00102\u0006\u0010%\u001a\u00020\"J\u0016\u0010&\u001a\u00020$2\u0006\u0010\u0015\u001a\u00020\u00102\u0006\u0010%\u001a\u00020\"J\u0018\u0010\'\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00102\u0008\u0010(\u001a\u0004\u0018\u00010)J\u0018\u0010*\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00102\u0008\u0010(\u001a\u0004\u0018\u00010)J\u000e\u0010+\u001a\u00020$2\u0006\u0010\u0015\u001a\u00020\u0010J\u0012\u0010,\u001a\u0004\u0018\u00010-2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0018J\u0016\u0010.\u001a\u00020\u00142\u0006\u0010/\u001a\u00020\u00182\u0006\u00100\u001a\u00020\u0018J\u0010\u00101\u001a\u00020\u00142\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u0018J\u0010\u00102\u001a\u00020\"2\u0008\u00103\u001a\u0004\u0018\u00010\u0018J\u0010\u00104\u001a\u00020\"2\u0008\u00103\u001a\u0004\u0018\u00010\u0018J\u0016\u00105\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00102\u0006\u00106\u001a\u00020\"J\u0010\u00107\u001a\u00020\"2\u0008\u00103\u001a\u0004\u0018\u00010\u0018J\u000e\u00108\u001a\u00020\"2\u0006\u0010\u0015\u001a\u00020\u0010J\u000e\u00109\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0010J\u0016\u0010:\u001a\u00020$2\u0006\u0010\u0015\u001a\u00020\u00102\u0006\u0010;\u001a\u00020\u0014J\u000e\u0010<\u001a\u00020$2\u0006\u0010\u0015\u001a\u00020\u0010R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006>"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/FileAccessHandler;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "getContext",
        "()Landroid/content/Context;",
        "storageScopeIdentifier",
        "Lorg/godotengine/godot/io/StorageScope$Identifier;",
        "getStorageScopeIdentifier$lib_templateDebug",
        "()Lorg/godotengine/godot/io/StorageScope$Identifier;",
        "files",
        "Landroid/util/SparseArray;",
        "Lorg/godotengine/godot/io/file/DataAccess;",
        "lastFileId",
        "",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "hasFileId",
        "",
        "fileId",
        "canAccess",
        "filePath",
        "",
        "fileOpen",
        "path",
        "modeFlags",
        "Lkotlin/Pair;",
        "Lorg/godotengine/godot/error/Error;",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
        "fileOpen$lib_templateDebug",
        "fileGetSize",
        "",
        "fileSeek",
        "",
        "position",
        "fileSeekFromEnd",
        "fileRead",
        "byteBuffer",
        "Ljava/nio/ByteBuffer;",
        "fileWrite",
        "fileFlush",
        "getInputStream",
        "Ljava/io/InputStream;",
        "renameFile",
        "from",
        "to",
        "fileExists",
        "fileLastModified",
        "filepath",
        "fileLastAccessed",
        "fileResize",
        "length",
        "fileSize",
        "fileGetPosition",
        "isFileEof",
        "setFileEof",
        "eof",
        "fileClose",
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
.field public static final Companion:Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

.field private static final FILE_OPEN_FAILED:Lkotlin/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Pair<",
            "Lorg/godotengine/godot/error/Error;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final INVALID_FILE_ID:I = 0x0

.field private static final STARTING_FILE_ID:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final context:Landroid/content/Context;

.field private final files:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lorg/godotengine/godot/io/file/DataAccess;",
            ">;"
        }
    .end annotation
.end field

.field private lastFileId:I

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->Companion:Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

    .line 51
    const-class v0, Lorg/godotengine/godot/io/file/FileAccessHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->TAG:Ljava/lang/String;

    .line 55
    new-instance v0, Lkotlin/Pair;

    sget-object v1, Lorg/godotengine/godot/error/Error;->FAILED:Lorg/godotengine/godot/error/Error;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    .line 112
    new-instance v0, Lorg/godotengine/godot/io/StorageScope$Identifier;

    iget-object v1, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/StorageScope$Identifier;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    .line 113
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    .line 114
    const/4 v0, 0x1

    iput v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lastFileId:I

    .line 115
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 48
    return-void
.end method

.method private final hasFileId(I)Z
    .locals 1
    .param p1, "fileId"    # I

    .line 118
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public final canAccess(Ljava/lang/String;)Z
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;

    .line 122
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->canAccess(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final fileClose(I)V
    .locals 3
    .param p1, "fileId"    # I

    .line 294
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 295
    .local v1, "$i$a$-withLock-FileAccessHandler$fileClose$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 296
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/DataAccess;->close()V

    .line 297
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 299
    :cond_0
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileClose$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 294
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 299
    return-void

    .line 294
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileExists(Ljava/lang/String;)Z
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .line 218
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->Companion:Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, v1, v2, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;->fileExists$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final fileFlush(I)V
    .locals 3
    .param p1, "fileId"    # I

    .line 206
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 207
    .local v1, "$i$a$-withLock-FileAccessHandler$fileFlush$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 208
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileFlush$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 211
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileFlush$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/DataAccess;->flush()V

    .line 212
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileFlush$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 206
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 212
    return-void

    .line 206
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileGetPosition(I)J
    .locals 4
    .param p1, "fileId"    # I

    .line 273
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 274
    .local v1, "$i$a$-withLock-FileAccessHandler$fileGetPosition$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 275
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileGetPosition$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const-wide/16 v0, 0x0

    return-wide v0

    .line 278
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileGetPosition$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/DataAccess;->position()J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileGetPosition$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileGetSize(I)J
    .locals 4
    .param p1, "fileId"    # I

    .line 166
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 167
    .local v1, "$i$a$-withLock-FileAccessHandler$fileGetSize$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 168
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileGetSize$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const-wide/16 v0, 0x0

    return-wide v0

    .line 171
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileGetSize$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/DataAccess;->size()J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileGetSize$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileLastAccessed(Ljava/lang/String;)J
    .locals 7
    .param p1, "filepath"    # Ljava/lang/String;

    .line 236
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 237
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const-wide/16 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 238
    return-wide v2

    .line 241
    :cond_0
    nop

    .line 242
    if-eqz p1, :cond_1

    move-object v1, p1

    .local v1, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 243
    .local v4, "$i$a$-let-FileAccessHandler$fileLastAccessed$1":I
    :try_start_0
    sget-object v5, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    iget-object v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    invoke-virtual {v5, v0, v6, v1}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->fileLastAccessed(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 242
    .end local v1    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-FileAccessHandler$fileLastAccessed$1":I
    goto :goto_0

    .line 245
    :catch_0
    move-exception v1

    .line 246
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_1

    .line 244
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_1
    nop

    :goto_0
    nop

    .line 241
    :goto_1
    return-wide v2
.end method

.method public final fileLastModified(Ljava/lang/String;)J
    .locals 7
    .param p1, "filepath"    # Ljava/lang/String;

    .line 221
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 222
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const-wide/16 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 223
    return-wide v2

    .line 226
    :cond_0
    nop

    .line 227
    if-eqz p1, :cond_1

    move-object v1, p1

    .local v1, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 228
    .local v4, "$i$a$-let-FileAccessHandler$fileLastModified$1":I
    :try_start_0
    sget-object v5, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    iget-object v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    invoke-virtual {v5, v0, v6, v1}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->fileLastModified(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 227
    .end local v1    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-FileAccessHandler$fileLastModified$1":I
    goto :goto_0

    .line 230
    :catch_0
    move-exception v1

    .line 231
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_1

    .line 229
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_1
    nop

    :goto_0
    nop

    .line 226
    :goto_1
    return-wide v2
.end method

.method public final fileOpen(Ljava/lang/String;I)I
    .locals 5
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "modeFlags"    # I

    .line 129
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 130
    .local v1, "$i$a$-withLock-FileAccessHandler$fileOpen$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/file/FileAccessFlags;->Companion:Lorg/godotengine/godot/io/file/FileAccessFlags$Companion;

    invoke-virtual {v2, p2}, Lorg/godotengine/godot/io/file/FileAccessFlags$Companion;->fromNativeModeFlags(I)Lorg/godotengine/godot/io/file/FileAccessFlags;

    move-result-object v2

    invoke-virtual {p0, p1, v2}, Lorg/godotengine/godot/io/file/FileAccessHandler;->fileOpen$lib_templateDebug(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Lkotlin/Pair;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/error/Error;

    .local v3, "fileError":Lorg/godotengine/godot/error/Error;
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 131
    .local v2, "fileId":I
    sget-object v4, Lorg/godotengine/godot/error/Error;->OK:Lorg/godotengine/godot/error/Error;

    if-ne v3, v4, :cond_0

    .line 132
    goto :goto_0

    .line 136
    :cond_0
    invoke-virtual {v3}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    neg-int v4, v4

    move v2, v4

    .line 131
    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileOpen$1":I
    .end local v2    # "fileId":I
    .end local v3    # "fileError":Lorg/godotengine/godot/error/Error;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileOpen$lib_templateDebug(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Lkotlin/Pair;
    .locals 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/godotengine/godot/io/file/FileAccessFlags;",
            ")",
            "Lkotlin/Pair<",
            "Lorg/godotengine/godot/error/Error;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 141
    if-nez p2, :cond_0

    .line 142
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;

    return-object v0

    .line 145
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 146
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    if-ne v0, v1, :cond_1

    .line 147
    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;

    return-object v1

    .line 150
    :cond_1
    nop

    .line 151
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    move-object v2, p1

    .local v2, "it":Ljava/lang/String;
    const/4 v3, 0x0

    .line 152
    .local v3, "$i$a$-let-FileAccessHandler$fileOpen$2":I
    :try_start_0
    sget-object v4, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    iget-object v5, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    invoke-virtual {v4, v0, v5, v2, p2}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->generateDataAccess(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Lorg/godotengine/godot/io/file/DataAccess;

    move-result-object v4

    if-nez v4, :cond_2

    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;

    return-object v1

    .line 153
    .local v4, "dataAccess":Lorg/godotengine/godot/io/file/DataAccess;
    :cond_2
    iget-object v5, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    iget v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lastFileId:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lastFileId:I

    iget v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lastFileId:I

    invoke-virtual {v5, v6, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 154
    new-instance v5, Lkotlin/Pair;

    sget-object v6, Lorg/godotengine/godot/error/Error;->OK:Lorg/godotengine/godot/error/Error;

    iget v7, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lastFileId:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 151
    .end local v2    # "it":Ljava/lang/String;
    .end local v3    # "$i$a$-let-FileAccessHandler$fileOpen$2":I
    .end local v4    # "dataAccess":Lorg/godotengine/godot/io/file/DataAccess;
    goto :goto_0

    .line 155
    :cond_3
    sget-object v5, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    goto :goto_1

    .line 160
    :catch_0
    move-exception v1

    .line 161
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/godotengine/godot/io/file/FileAccessHandler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while opening "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 162
    sget-object v5, Lorg/godotengine/godot/io/file/FileAccessHandler;->FILE_OPEN_FAILED:Lkotlin/Pair;

    goto :goto_1

    .line 158
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v2

    .line 159
    .local v2, "e":Ljava/lang/UnsupportedOperationException;
    new-instance v5, Lkotlin/Pair;

    sget-object v3, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v5, v3, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .end local v2    # "e":Ljava/lang/UnsupportedOperationException;
    goto :goto_1

    .line 156
    :catch_2
    move-exception v2

    .line 157
    .local v2, "e":Ljava/io/FileNotFoundException;
    new-instance v5, Lkotlin/Pair;

    sget-object v3, Lorg/godotengine/godot/error/Error;->ERR_FILE_NOT_FOUND:Lorg/godotengine/godot/error/Error;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v5, v3, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 150
    .end local v2    # "e":Ljava/io/FileNotFoundException;
    :goto_1
    return-object v5
.end method

.method public final fileRead(ILjava/nio/ByteBuffer;)I
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 190
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 191
    .local v1, "$i$a$-withLock-FileAccessHandler$fileRead$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 195
    :cond_0
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2, p2}, Lorg/godotengine/godot/io/file/DataAccess;->read(Ljava/nio/ByteBuffer;)I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileRead$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 192
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileRead$1":I
    :cond_1
    :goto_0
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileRead$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 195
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileResize(IJ)I
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "length"    # J

    .line 250
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 251
    .local v1, "$i$a$-withLock-FileAccessHandler$fileResize$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 252
    sget-object v2, Lorg/godotengine/godot/error/Error;->FAILED:Lorg/godotengine/godot/error/Error;

    invoke-virtual {v2}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileResize$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 255
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileResize$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2, p2, p3}, Lorg/godotengine/godot/io/file/DataAccess;->resize(J)Lorg/godotengine/godot/error/Error;

    move-result-object v2

    invoke-virtual {v2}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileResize$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileSeek(IJ)V
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "position"    # J

    .line 174
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 175
    .local v1, "$i$a$-withLock-FileAccessHandler$fileSeek$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 176
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileSeek$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 179
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileSeek$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2, p2, p3}, Lorg/godotengine/godot/io/file/DataAccess;->seek(J)V

    .line 180
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileSeek$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 180
    return-void

    .line 174
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileSeekFromEnd(IJ)V
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "position"    # J

    .line 182
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 183
    .local v1, "$i$a$-withLock-FileAccessHandler$fileSeekFromEnd$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 184
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileSeekFromEnd$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 187
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileSeekFromEnd$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2, p2, p3}, Lorg/godotengine/godot/io/file/DataAccess;->seekFromEnd(J)V

    .line 188
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileSeekFromEnd$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 182
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 188
    return-void

    .line 182
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileSize(Ljava/lang/String;)J
    .locals 7
    .param p1, "filepath"    # Ljava/lang/String;

    .line 259
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 260
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const-wide/16 v2, -0x1

    if-ne v0, v1, :cond_0

    .line 261
    return-wide v2

    .line 264
    :cond_0
    nop

    .line 265
    if-eqz p1, :cond_1

    move-object v1, p1

    .local v1, "it":Ljava/lang/String;
    const/4 v4, 0x0

    .line 266
    .local v4, "$i$a$-let-FileAccessHandler$fileSize$1":I
    :try_start_0
    sget-object v5, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    iget-object v6, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    invoke-virtual {v5, v0, v6, v1}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->fileSize(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    .end local v1    # "it":Ljava/lang/String;
    .end local v4    # "$i$a$-let-FileAccessHandler$fileSize$1":I
    goto :goto_0

    .line 268
    :catch_0
    move-exception v1

    .line 269
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_1

    .line 267
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_1
    nop

    :goto_0
    nop

    .line 264
    :goto_1
    return-wide v2
.end method

.method public final fileWrite(ILjava/nio/ByteBuffer;)Z
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .line 198
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 199
    .local v1, "$i$a$-withLock-FileAccessHandler$fileWrite$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    .line 203
    :cond_0
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2, p2}, Lorg/godotengine/godot/io/file/DataAccess;->write(Ljava/nio/ByteBuffer;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileWrite$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 200
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$fileWrite$1":I
    :cond_1
    :goto_0
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$fileWrite$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 203
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    .line 48
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .line 214
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->Companion:Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, v1, v2, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;->getInputStream$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public final getStorageScopeIdentifier$lib_templateDebug()Lorg/godotengine/godot/io/StorageScope$Identifier;
    .locals 1

    .line 112
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    return-object v0
.end method

.method public final isFileEof(I)Z
    .locals 3
    .param p1, "fileId"    # I

    .line 281
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 282
    .local v1, "$i$a$-withLock-FileAccessHandler$isFileEof$1":I
    :try_start_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/FileAccessHandler;->hasFileId(I)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 283
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$isFileEof$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 286
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$isFileEof$1":I
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;

    invoke-virtual {v2}, Lorg/godotengine/godot/io/file/DataAccess;->getEndOfFile$lib_templateDebug()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$isFileEof$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final renameFile(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "from"    # Ljava/lang/String;
    .param p2, "to"    # Ljava/lang/String;

    const-string v0, "from"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 216
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessHandler;->Companion:Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->context:Landroid/content/Context;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v0, v1, v2, p1, p2}, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;->renameFile$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final setFileEof(IZ)V
    .locals 3
    .param p1, "fileId"    # I
    .param p2, "eof"    # Z

    .line 289
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 290
    .local v1, "$i$a$-withLock-FileAccessHandler$setFileEof$1":I
    :try_start_0
    iget-object v2, p0, Lorg/godotengine/godot/io/file/FileAccessHandler;->files:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/io/file/DataAccess;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .end local v1    # "$i$a$-withLock-FileAccessHandler$setFileEof$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 291
    .restart local v1    # "$i$a$-withLock-FileAccessHandler$setFileEof$1":I
    .local v2, "file":Lorg/godotengine/godot/io/file/DataAccess;
    :cond_0
    :try_start_1
    invoke-virtual {v2, p2}, Lorg/godotengine/godot/io/file/DataAccess;->setEndOfFile$lib_templateDebug(Z)V

    .line 292
    nop

    .end local v1    # "$i$a$-withLock-FileAccessHandler$setFileEof$1":I
    .end local v2    # "file":Lorg/godotengine/godot/io/file/DataAccess;
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 289
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 292
    return-void

    .line 289
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
