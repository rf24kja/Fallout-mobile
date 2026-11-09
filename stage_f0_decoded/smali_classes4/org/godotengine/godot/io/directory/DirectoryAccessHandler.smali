.class public final Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;
.super Ljava/lang/Object;
.source "DirectoryAccessHandler.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;,
        Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$Companion;,
        Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$DirectoryAccess;,
        Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDirectoryAccessHandler.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DirectoryAccessHandler.kt\norg/godotengine/godot/io/directory/DirectoryAccessHandler\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,321:1\n1#2:322\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0010\t\n\u0002\u0008\t\u0018\u0000 /2\u00020\u0001:\u0003/01B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011J\u000e\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u0011J\u0018\u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018H\u0002J\u0018\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0011J\u000e\u0010\u001b\u001a\u00020\u00112\u0006\u0010\u001c\u001a\u00020\u0018J\u000e\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001c\u001a\u00020\u0018J\u000e\u0010\u001f\u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u0018J\u000e\u0010 \u001a\u00020\u000f2\u0006\u0010\u001c\u001a\u00020\u0018J\u0018\u0010!\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0011J\u0018\u0010\"\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0011J\u000e\u0010#\u001a\u00020\u00182\u0006\u0010\u001a\u001a\u00020\u0018J\u0016\u0010$\u001a\u00020\u00112\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010%\u001a\u00020\u0018J\u0018\u0010&\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010\'\u001a\u0004\u0018\u00010\u0011J\u000e\u0010(\u001a\u00020)2\u0006\u0010\u001a\u001a\u00020\u0018J\u001e\u0010*\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00182\u0006\u0010+\u001a\u00020\u00112\u0006\u0010,\u001a\u00020\u0011J\u0018\u0010-\u001a\u00020\u000f2\u0006\u0010\u001a\u001a\u00020\u00182\u0008\u0010.\u001a\u0004\u0018\u00010\u0011R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00062"
    }
    d2 = {
        "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "storageScopeIdentifier",
        "Lorg/godotengine/godot/io/StorageScope$Identifier;",
        "assetsDirAccess",
        "Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;",
        "fileSystemDirAccess",
        "Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "assetsFileExists",
        "",
        "assetsPath",
        "",
        "filesystemFileExists",
        "path",
        "hasDirId",
        "accessType",
        "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;",
        "dirId",
        "",
        "dirOpen",
        "nativeAccessType",
        "dirNext",
        "dirAccessId",
        "dirClose",
        "",
        "dirIsDir",
        "isCurrentHidden",
        "dirExists",
        "fileExists",
        "getDriveCount",
        "getDrive",
        "drive",
        "makeDir",
        "dir",
        "getSpaceLeft",
        "",
        "rename",
        "from",
        "to",
        "remove",
        "filename",
        "Companion",
        "AccessType",
        "DirectoryAccess",
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
.field public static final Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$Companion;

.field public static final INVALID_DIR_ID:I = -0x1

.field public static final STARTING_DIR_ID:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

.field private final fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$Companion;

    .line 47
    const-class v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    new-instance v0, Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-direct {v0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    .line 148
    new-instance v0, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-direct {v0, p1}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    .line 149
    new-instance v0, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    iget-object v1, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-direct {v0, p1, v1}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;-><init>(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;)V

    iput-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    .line 150
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 44
    return-void
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 44
    sget-object v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private final hasDirId(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;I)Z
    .locals 2
    .param p1, "accessType"    # Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .param p2, "dirId"    # I

    .line 156
    sget-object v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    .line 157
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v0, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->hasDirId(I)Z

    move-result v0

    goto :goto_0

    .line 158
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v0, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->hasDirId(I)Z

    move-result v0

    .line 156
    :goto_0
    return v0
.end method


# virtual methods
.method public final assetsFileExists(Ljava/lang/String;)Z
    .locals 3
    .param p1, "assetsPath"    # Ljava/lang/String;

    const-string v0, "assetsPath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 152
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 322
    const/4 v1, 0x0

    .line 152
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$assetsFileExists$1":I
    :try_start_0
    iget-object v2, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->fileExists(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$assetsFileExists$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final dirClose(I)V
    .locals 7
    .param p1, "dirAccessId"    # I

    .line 195
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 196
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$dirClose$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromDirAccessId(I)Lkotlin/Pair;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .local v3, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 197
    .local v2, "dirId":I
    if-eqz v3, :cond_2

    invoke-direct {p0, v3, v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->hasDirId(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 202
    :cond_0
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 203
    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->dirClose(I)V

    goto :goto_0

    .line 204
    :cond_1
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->dirClose(I)V

    .line 206
    :goto_0
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirClose$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 195
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 206
    return-void

    .line 198
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirClose$1":I
    .restart local v2    # "dirId":I
    .restart local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_2
    :goto_1
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dirClose: Invalid dir id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 199
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirClose$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 195
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final dirExists(ILjava/lang/String;)Z
    .locals 6
    .param p1, "nativeAccessType"    # I
    .param p2, "path"    # Ljava/lang/String;

    .line 233
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 234
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 235
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 238
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v3

    .line 239
    .local v3, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v4, p1, v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :cond_1
    move-object v2, v4

    .line 241
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 242
    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->dirExists(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 243
    :cond_2
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->dirExists(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 241
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirExists$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final dirIsDir(I)Z
    .locals 7
    .param p1, "dirAccessId"    # I

    .line 208
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 209
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$dirIsDir$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromDirAccessId(I)Lkotlin/Pair;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .local v3, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 210
    .local v2, "dirId":I
    if-eqz v3, :cond_2

    invoke-direct {p0, v3, v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->hasDirId(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 215
    :cond_0
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 216
    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->dirIsDir(I)Z

    move-result v4

    goto :goto_0

    .line 217
    :cond_1
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->dirIsDir(I)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 215
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirIsDir$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    .line 211
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirIsDir$1":I
    .restart local v2    # "dirId":I
    .restart local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_2
    :goto_1
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dirIsDir: Invalid dir id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 212
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirIsDir$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 215
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final dirNext(I)Ljava/lang/String;
    .locals 7
    .param p1, "dirAccessId"    # I

    .line 182
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 183
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$dirNext$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromDirAccessId(I)Lkotlin/Pair;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .local v3, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 184
    .local v2, "dirId":I
    if-eqz v3, :cond_2

    invoke-direct {p0, v3, v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->hasDirId(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 189
    :cond_0
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 190
    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->dirNext(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 191
    :cond_1
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->dirNext(I)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirNext$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v4

    .line 185
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirNext$1":I
    .restart local v2    # "dirId":I
    .restart local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_2
    :goto_1
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dirNext: Invalid dir id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    const-string v4, ""
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirNext$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v4

    .line 189
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final dirOpen(ILjava/lang/String;)I
    .locals 7
    .param p1, "nativeAccessType"    # I
    .param p2, "path"    # Ljava/lang/String;

    .line 162
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 163
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    const/4 v2, -0x1

    if-nez p2, :cond_0

    .line 164
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 167
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v3

    .line 168
    .local v3, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v4, p1, v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 170
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    .local v4, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_1
    :try_start_1
    sget-object v5, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v4}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v6

    aget v5, v5, v6

    .line 171
    const/4 v6, 0x1

    if-ne v5, v6, :cond_2

    iget-object v5, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v5, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->dirOpen(Ljava/lang/String;)I

    move-result v5

    goto :goto_0

    .line 172
    :cond_2
    iget-object v5, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v5, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->dirOpen(Ljava/lang/String;)I

    move-result v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    :goto_0
    nop

    .line 174
    .local v5, "dirId":I
    if-ne v5, v2, :cond_3

    .line 175
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    .end local v4    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v5    # "dirId":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 178
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    .restart local v4    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .restart local v5    # "dirId":I
    :cond_3
    :try_start_2
    invoke-virtual {v4, v5}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->generateDirAccessId(I)I

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 179
    .local v2, "dirAccessId":I
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$dirOpen$1":I
    .end local v2    # "dirAccessId":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    .end local v4    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v5    # "dirId":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final fileExists(ILjava/lang/String;)Z
    .locals 6
    .param p1, "nativeAccessType"    # I
    .param p2, "path"    # Ljava/lang/String;

    .line 247
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 248
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 249
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 252
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v3

    .line 253
    .local v3, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v4, p1, v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :cond_1
    move-object v2, v4

    .line 255
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 256
    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->fileExists(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 257
    :cond_2
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->fileExists(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 255
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$fileExists$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final filesystemFileExists(Ljava/lang/String;)Z
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    const-string v0, "path"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 322
    const/4 v1, 0x0

    .line 153
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$filesystemFileExists$1":I
    :try_start_0
    iget-object v2, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->fileExists(Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$filesystemFileExists$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getDrive(II)Ljava/lang/String;
    .locals 5
    .param p1, "nativeAccessType"    # I
    .param p2, "drive"    # I

    .line 269
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 270
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$getDrive$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v2, p1, v4, v3, v4}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative$default(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;ILorg/godotengine/godot/io/StorageScope;ILjava/lang/Object;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v2

    if-nez v2, :cond_0

    const-string v2, ""
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDrive$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v2

    .line 271
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDrive$1":I
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_0
    :try_start_1
    sget-object v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    .line 272
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->getDrive(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 273
    :cond_1
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->getDrive(I)Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 271
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDrive$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v3

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getDriveCount(I)I
    .locals 5
    .param p1, "nativeAccessType"    # I

    .line 261
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 262
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$getDriveCount$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v2, p1, v4, v3, v4}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative$default(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;ILorg/godotengine/godot/io/StorageScope;ILjava/lang/Object;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDriveCount$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 263
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDriveCount$1":I
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_0
    :try_start_1
    sget-object v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    .line 264
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->getDriveCount()I

    move-result v3

    goto :goto_0

    .line 265
    :cond_1
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->getDriveCount()I

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 263
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getDriveCount$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v3

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final getSpaceLeft(I)J
    .locals 5
    .param p1, "nativeAccessType"    # I

    .line 291
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 292
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$getSpaceLeft$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v2, p1, v4, v3, v4}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative$default(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;ILorg/godotengine/godot/io/StorageScope;ILjava/lang/Object;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getSpaceLeft$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const-wide/16 v0, 0x0

    return-wide v0

    .line 293
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$getSpaceLeft$1":I
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_0
    :try_start_1
    sget-object v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    .line 294
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->getSpaceLeft()J

    move-result-wide v3

    goto :goto_0

    .line 295
    :cond_1
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->getSpaceLeft()J

    move-result-wide v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 293
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$getSpaceLeft$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide v3

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final isCurrentHidden(I)Z
    .locals 6
    .param p1, "dirAccessId"    # I

    .line 221
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 222
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$isCurrentHidden$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v2, p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromDirAccessId(I)Lkotlin/Pair;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .local v3, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-virtual {v2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 223
    .local v2, "dirId":I
    if-eqz v3, :cond_2

    invoke-direct {p0, v3, v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->hasDirId(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;I)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 227
    :cond_0
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 228
    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->isCurrentHidden(I)Z

    move-result v4

    goto :goto_0

    .line 229
    :cond_1
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, v2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->isCurrentHidden(I)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 227
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$isCurrentHidden$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    .line 224
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$isCurrentHidden$1":I
    .restart local v2    # "dirId":I
    .restart local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_2
    :goto_1
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$isCurrentHidden$1":I
    .end local v2    # "dirId":I
    .end local v3    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 227
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final makeDir(ILjava/lang/String;)Z
    .locals 6
    .param p1, "nativeAccessType"    # I
    .param p2, "dir"    # Ljava/lang/String;

    .line 277
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 278
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 279
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 282
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v3

    .line 283
    .local v3, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v4, p1, v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :cond_1
    move-object v2, v4

    .line 285
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 286
    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->makeDir(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 287
    :cond_2
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->makeDir(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 285
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$makeDir$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final remove(ILjava/lang/String;)Z
    .locals 6
    .param p1, "nativeAccessType"    # I
    .param p2, "filename"    # Ljava/lang/String;

    .line 307
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 308
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    const/4 v2, 0x0

    if-nez p2, :cond_0

    .line 309
    nop

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .line 312
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    :cond_0
    :try_start_0
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->storageScopeIdentifier:Lorg/godotengine/godot/io/StorageScope$Identifier;

    invoke-virtual {v3, p2}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v3

    .line 313
    .local v3, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    invoke-virtual {v4, p1, v3}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_1

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v2

    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    .restart local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :cond_1
    move-object v2, v4

    .line 314
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    .line 315
    const/4 v5, 0x1

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->remove(Ljava/lang/String;)Z

    move-result v4

    goto :goto_0

    .line 316
    :cond_2
    iget-object v4, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v4, p2}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->remove(Ljava/lang/String;)Z

    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$remove$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .end local v3    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final rename(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p1, "nativeAccessType"    # I
    .param p2, "from"    # Ljava/lang/String;
    .param p3, "to"    # Ljava/lang/String;

    const-string v0, "from"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 299
    iget-object v0, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 300
    .local v1, "$i$a$-withLock-DirectoryAccessHandler$rename$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->Companion:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;

    const/4 v3, 0x2

    const/4 v4, 0x0

    invoke-static {v2, p1, v4, v3, v4}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative$default(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;ILorg/godotengine/godot/io/StorageScope;ILjava/lang/Object;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$rename$1":I
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 v0, 0x0

    return v0

    .line 301
    .restart local v1    # "$i$a$-withLock-DirectoryAccessHandler$rename$1":I
    .local v2, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_0
    :try_start_1
    sget-object v3, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    .line 302
    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsDirAccess:Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;

    invoke-virtual {v3, p2, p3}, Lorg/godotengine/godot/io/directory/AssetsDirectoryAccess;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    goto :goto_0

    .line 303
    :cond_1
    iget-object v3, p0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->fileSystemDirAccess:Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;

    invoke-virtual {v3, p2, p3}, Lorg/godotengine/godot/io/directory/FilesystemDirectoryAccess;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 301
    .end local v1    # "$i$a$-withLock-DirectoryAccessHandler$rename$1":I
    .end local v2    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v3

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method
