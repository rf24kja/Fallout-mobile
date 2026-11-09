.class public final Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;
.super Ljava/lang/Object;
.source "FileAccessHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/file/FileAccessHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J)\u0010\r\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0005H\u0000\u00a2\u0006\u0002\u0008\u0014J\'\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0005H\u0000\u00a2\u0006\u0002\u0008\u0017J\'\u0010\u0018\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0005H\u0000\u00a2\u0006\u0002\u0008\u0019J-\u0010\u001a\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u0005H\u0000\u00a2\u0006\u0002\u0008\u001dR\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0008X\u0082T\u00a2\u0006\u0002\n\u0000R\u001a\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u00080\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "INVALID_FILE_ID",
        "",
        "STARTING_FILE_ID",
        "FILE_OPEN_FAILED",
        "Lkotlin/Pair;",
        "Lorg/godotengine/godot/error/Error;",
        "getInputStream",
        "Ljava/io/InputStream;",
        "context",
        "Landroid/content/Context;",
        "storageScopeIdentifier",
        "Lorg/godotengine/godot/io/StorageScope$Identifier;",
        "path",
        "getInputStream$lib_templateDebug",
        "fileExists",
        "",
        "fileExists$lib_templateDebug",
        "removeFile",
        "removeFile$lib_templateDebug",
        "renameFile",
        "from",
        "to",
        "renameFile$lib_templateDebug",
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

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/io/file/FileAccessHandler$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fileExists$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "storageScopeIdentifier"    # Lorg/godotengine/godot/io/StorageScope$Identifier;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storageScopeIdentifier"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    invoke-virtual {p2, p3}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 70
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 71
    return v2

    .line 74
    :cond_0
    nop

    .line 75
    if-eqz p3, :cond_1

    move-object v1, p3

    .local v1, "it":Ljava/lang/String;
    const/4 v3, 0x0

    .line 76
    .local v3, "$i$a$-let-FileAccessHandler$Companion$fileExists$1":I
    :try_start_0
    sget-object v4, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    invoke-virtual {v4, v0, p1, v1}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->fileExists(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .end local v1    # "it":Ljava/lang/String;
    .end local v3    # "$i$a$-let-FileAccessHandler$Companion$fileExists$1":I
    goto :goto_0

    .line 78
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Ljava/lang/SecurityException;
    goto :goto_1

    .line 77
    .end local v1    # "e":Ljava/lang/SecurityException;
    :cond_1
    nop

    :goto_0
    nop

    .line 74
    :goto_1
    return v2
.end method

.method public final getInputStream$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "storageScopeIdentifier"    # Lorg/godotengine/godot/io/StorageScope$Identifier;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storageScopeIdentifier"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 58
    invoke-virtual {p2, p3}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 59
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    nop

    .line 60
    const/4 v1, 0x0

    if-eqz p3, :cond_0

    move-object v2, p3

    .local v2, "it":Ljava/lang/String;
    const/4 v3, 0x0

    .line 61
    .local v3, "$i$a$-let-FileAccessHandler$Companion$getInputStream$1":I
    :try_start_0
    sget-object v4, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    invoke-virtual {v4, v0, p1, p3}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->getInputStream(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "it":Ljava/lang/String;
    .end local v3    # "$i$a$-let-FileAccessHandler$Companion$getInputStream$1":I
    goto :goto_0

    .line 63
    :catch_0
    move-exception v2

    .line 64
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_1

    .line 60
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    nop

    .line 59
    :goto_1
    return-object v1
.end method

.method public final removeFile$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "storageScopeIdentifier"    # Lorg/godotengine/godot/io/StorageScope$Identifier;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storageScopeIdentifier"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    invoke-virtual {p2, p3}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 85
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 86
    return v2

    .line 89
    :cond_0
    nop

    .line 90
    if-eqz p3, :cond_1

    move-object v1, p3

    .local v1, "it":Ljava/lang/String;
    const/4 v3, 0x0

    .line 91
    .local v3, "$i$a$-let-FileAccessHandler$Companion$removeFile$1":I
    :try_start_0
    sget-object v4, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    invoke-virtual {v4, v0, p1, v1}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->removeFile(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    .end local v1    # "it":Ljava/lang/String;
    .end local v3    # "$i$a$-let-FileAccessHandler$Companion$removeFile$1":I
    goto :goto_0

    .line 93
    :catch_0
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_1

    .line 92
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    nop

    :goto_0
    nop

    .line 89
    :goto_1
    return v2
.end method

.method public final renameFile$lib_templateDebug(Landroid/content/Context;Lorg/godotengine/godot/io/StorageScope$Identifier;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "storageScopeIdentifier"    # Lorg/godotengine/godot/io/StorageScope$Identifier;
    .param p3, "from"    # Ljava/lang/String;
    .param p4, "to"    # Ljava/lang/String;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "storageScopeIdentifier"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "from"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p2, p3}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 100
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 101
    return v2

    .line 104
    :cond_0
    nop

    .line 105
    :try_start_0
    sget-object v1, Lorg/godotengine/godot/io/file/DataAccess;->Companion:Lorg/godotengine/godot/io/file/DataAccess$Companion;

    invoke-virtual {v1, v0, p1, p3, p4}, Lorg/godotengine/godot/io/file/DataAccess$Companion;->renameFile(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v1

    .line 107
    .local v1, "e":Ljava/lang/Exception;
    nop

    .line 104
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return v2
.end method
