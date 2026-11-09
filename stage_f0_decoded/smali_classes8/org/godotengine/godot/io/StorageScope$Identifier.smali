.class public final Lorg/godotengine/godot/io/StorageScope$Identifier;
.super Ljava/lang/Object;
.source "StorageScope.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/StorageScope;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Identifier"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/StorageScope$Identifier$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u000e\u001a\u00020\u000f2\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0007J\u0010\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0007R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "Lorg/godotengine/godot/io/StorageScope$Identifier;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "internalAppDir",
        "",
        "internalCacheDir",
        "externalAppDir",
        "obbDir",
        "sharedDir",
        "downloadsSharedDir",
        "documentsSharedDir",
        "canAccess",
        "",
        "path",
        "identifyStorageScope",
        "Lorg/godotengine/godot/io/StorageScope;",
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
.field public static final ACCESS_RESOURCES_PREFIX:Ljava/lang/String; = "res://"

.field public static final ASSETS_PREFIX:Ljava/lang/String; = "assets://"

.field public static final CONTENT_PREFIX:Ljava/lang/String; = "content://"

.field public static final Companion:Lorg/godotengine/godot/io/StorageScope$Identifier$Companion;


# instance fields
.field private final documentsSharedDir:Ljava/lang/String;

.field private final downloadsSharedDir:Ljava/lang/String;

.field private final externalAppDir:Ljava/lang/String;

.field private final internalAppDir:Ljava/lang/String;

.field private final internalCacheDir:Ljava/lang/String;

.field private final obbDir:Ljava/lang/String;

.field private final sharedDir:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/io/StorageScope$Identifier$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/StorageScope$Identifier$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope$Identifier;->Companion:Lorg/godotengine/godot/io/StorageScope$Identifier$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalAppDir:Ljava/lang/String;

    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalCacheDir:Ljava/lang/String;

    .line 79
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    iput-object v1, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->externalAppDir:Ljava/lang/String;

    .line 80
    invoke-virtual {p1}, Landroid/content/Context;->getObbDir()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    :cond_1
    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->obbDir:Ljava/lang/String;

    .line 81
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->sharedDir:Ljava/lang/String;

    .line 82
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->downloadsSharedDir:Ljava/lang/String;

    .line 83
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->documentsSharedDir:Ljava/lang/String;

    .line 69
    return-void
.end method


# virtual methods
.method public final canAccess(Ljava/lang/String;)Z
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .line 89
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    .line 90
    .local v0, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    if-eq v0, v1, :cond_1

    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->SHARED:Lorg/godotengine/godot/io/StorageScope;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public final identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;
    .locals 8
    .param p1, "path"    # Ljava/lang/String;

    .line 97
    if-nez p1, :cond_0

    .line 98
    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    return-object v0

    .line 101
    :cond_0
    const-string v0, "assets://"

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->ASSETS:Lorg/godotengine/godot/io/StorageScope;

    return-object v0

    .line 105
    :cond_1
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot$Companion;->isTemplateBuild$lib_templateDebug()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "res://"

    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 106
    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->ASSETS:Lorg/godotengine/godot/io/StorageScope;

    return-object v0

    .line 110
    :cond_2
    const-string v0, "content://"

    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 111
    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->SAF:Lorg/godotengine/godot/io/StorageScope;

    return-object v0

    .line 114
    :cond_3
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 115
    .local v0, "pathFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_4

    .line 116
    new-instance v4, Ljava/io/File;

    invoke-static {}, Lorg/godotengine/godot/GodotLib;->getProjectResourceDir()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v4

    .line 117
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_4

    .line 118
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 124
    :cond_4
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v4, v5, :cond_5

    .line 125
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 126
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 129
    :cond_5
    invoke-virtual {v0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v4

    .line 131
    .local v4, "canonicalPathFile":Ljava/lang/String;
    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalAppDir:Ljava/lang/String;

    if-eqz v6, :cond_6

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalAppDir:Ljava/lang/String;

    invoke-static {v4, v6, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 132
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 135
    :cond_6
    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalCacheDir:Ljava/lang/String;

    if-eqz v6, :cond_7

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->internalCacheDir:Ljava/lang/String;

    invoke-static {v4, v6, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 136
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 139
    :cond_7
    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->externalAppDir:Ljava/lang/String;

    if-eqz v6, :cond_8

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v6, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->externalAppDir:Ljava/lang/String;

    invoke-static {v4, v6, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 140
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 143
    :cond_8
    const-string v6, "ANDROID_ROOT"

    invoke-static {v6}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 144
    .local v6, "rootDir":Ljava/lang/String;
    if-eqz v6, :cond_9

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v4, v6, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 145
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 148
    :cond_9
    iget-object v7, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->obbDir:Ljava/lang/String;

    if-eqz v7, :cond_a

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v7, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->obbDir:Ljava/lang/String;

    invoke-static {v4, v7, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 149
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 152
    :cond_a
    iget-object v7, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->sharedDir:Ljava/lang/String;

    if-eqz v7, :cond_f

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v7, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->sharedDir:Ljava/lang/String;

    invoke-static {v4, v7, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 153
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v7, v5, :cond_b

    .line 156
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 161
    :cond_b
    iget-object v5, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->downloadsSharedDir:Ljava/lang/String;

    if-eqz v5, :cond_c

    iget-object v5, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->downloadsSharedDir:Ljava/lang/String;

    invoke-static {v4, v5, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_d

    .line 162
    :cond_c
    iget-object v5, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->documentsSharedDir:Ljava/lang/String;

    if-eqz v5, :cond_e

    iget-object v5, p0, Lorg/godotengine/godot/io/StorageScope$Identifier;->documentsSharedDir:Ljava/lang/String;

    invoke-static {v4, v5, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 163
    :cond_d
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 166
    :cond_e
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->SHARED:Lorg/godotengine/godot/io/StorageScope;

    return-object v1

    .line 169
    :cond_f
    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    return-object v1
.end method
