.class public final Lorg/godotengine/godot/io/file/DataAccess$Companion;
.super Ljava/lang/Object;
.source "DataAccess.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/file/DataAccess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J \u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u0005J(\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u00052\u0006\u0010\u0010\u001a\u00020\u0011J\u001e\u0010\u0012\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0005J\u001e\u0010\u0015\u001a\u00020\u00162\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0005J\u001e\u0010\u0017\u001a\u00020\u00162\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0005J\u001e\u0010\u0018\u001a\u00020\u00162\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0005J\u001e\u0010\u0019\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0014\u001a\u00020\u0005J&\u0010\u001a\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u0005R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001d"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/DataAccess$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "getInputStream",
        "Ljava/io/InputStream;",
        "storageScope",
        "Lorg/godotengine/godot/io/StorageScope;",
        "context",
        "Landroid/content/Context;",
        "filePath",
        "generateDataAccess",
        "Lorg/godotengine/godot/io/file/DataAccess;",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
        "fileExists",
        "",
        "path",
        "fileLastModified",
        "",
        "fileLastAccessed",
        "fileSize",
        "removeFile",
        "renameFile",
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

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/io/file/DataAccess$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fileExists(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 122
    :pswitch_0
    goto :goto_0

    .line 120
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->fileExists(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 115
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    .line 116
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->fileExists(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 118
    :cond_0
    goto :goto_0

    .line 113
    :pswitch_3
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/FileData$Companion;->fileExists(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 114
    :pswitch_4
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/AssetData$Companion;->fileExists(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    .line 112
    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final fileLastAccessed(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J
    .locals 2
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 145
    :pswitch_0
    const-wide/16 v0, 0x0

    goto :goto_0

    .line 143
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/FileData$Companion;->fileLastAccessed(Ljava/lang/String;)J

    move-result-wide v0

    goto :goto_0

    .line 144
    :pswitch_2
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/AssetData$Companion;->fileLastAccessed(Ljava/lang/String;)J

    move-result-wide v0

    .line 142
    :goto_0
    return-wide v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final fileLastModified(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J
    .locals 4
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-wide/16 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 137
    :pswitch_0
    goto :goto_0

    .line 135
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->fileLastModified(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 130
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v0, v3, :cond_0

    .line 131
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->fileLastModified(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 133
    :cond_0
    goto :goto_0

    .line 128
    :pswitch_3
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/FileData$Companion;->fileLastModified(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 129
    :pswitch_4
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/AssetData$Companion;->fileLastModified(Ljava/lang/String;)J

    move-result-wide v1

    .line 127
    :goto_0
    return-wide v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final fileSize(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)J
    .locals 4
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const-wide/16 v1, -0x1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 160
    :pswitch_0
    goto :goto_0

    .line 158
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->fileSize(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 153
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v0, v3, :cond_0

    .line 154
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->fileSize(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 156
    :cond_0
    goto :goto_0

    .line 151
    :pswitch_3
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/FileData$Companion;->fileSize(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_0

    .line 152
    :pswitch_4
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/AssetData$Companion;->fileSize(Ljava/lang/String;)J

    move-result-wide v1

    .line 150
    :goto_0
    return-wide v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final generateDataAccess(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Lorg/godotengine/godot/io/file/DataAccess;
    .locals 3
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "filePath"    # Ljava/lang/String;
    .param p4, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filePath"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "accessFlag"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 107
    :pswitch_0
    goto :goto_1

    .line 105
    :pswitch_1
    new-instance v0, Lorg/godotengine/godot/io/file/SAFData;

    invoke-direct {v0, p2, p3, p4}, Lorg/godotengine/godot/io/file/SAFData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/io/file/DataAccess;

    goto :goto_1

    .line 100
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    .line 101
    new-instance v1, Lorg/godotengine/godot/io/file/MediaStoreData;

    invoke-direct {v1, p2, p3, p4}, Lorg/godotengine/godot/io/file/MediaStoreData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    goto :goto_0

    .line 103
    :cond_0
    nop

    :goto_0
    check-cast v1, Lorg/godotengine/godot/io/file/DataAccess;

    goto :goto_1

    .line 98
    :pswitch_3
    new-instance v0, Lorg/godotengine/godot/io/file/FileData;

    invoke-direct {v0, p3, p4}, Lorg/godotengine/godot/io/file/FileData;-><init>(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/io/file/DataAccess;

    goto :goto_1

    .line 99
    :pswitch_4
    new-instance v0, Lorg/godotengine/godot/io/file/AssetData;

    invoke-direct {v0, p2, p3, p4}, Lorg/godotengine/godot/io/file/AssetData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/io/file/DataAccess;

    .line 97
    :goto_1
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final getInputStream(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .locals 3
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "filePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "filePath"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 86
    :pswitch_0
    goto :goto_0

    .line 82
    :pswitch_1
    new-instance v0, Lorg/godotengine/godot/io/file/SAFData;

    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {v0, p2, p3, v1}, Lorg/godotengine/godot/io/file/SAFData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    .line 83
    .local v0, "safData":Lorg/godotengine/godot/io/file/SAFData;
    invoke-virtual {v0}, Lorg/godotengine/godot/io/file/SAFData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/ReadableByteChannel;

    invoke-static {v1}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v1

    .end local v0    # "safData":Lorg/godotengine/godot/io/file/SAFData;
    goto :goto_0

    .line 74
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    .line 75
    new-instance v0, Lorg/godotengine/godot/io/file/MediaStoreData;

    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {v0, p2, p3, v1}, Lorg/godotengine/godot/io/file/MediaStoreData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    .line 76
    .local v0, "mediaStoreData":Lorg/godotengine/godot/io/file/MediaStoreData;
    invoke-virtual {v0}, Lorg/godotengine/godot/io/file/MediaStoreData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/ReadableByteChannel;

    invoke-static {v1}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v1

    .end local v0    # "mediaStoreData":Lorg/godotengine/godot/io/file/MediaStoreData;
    goto :goto_0

    .line 78
    :cond_0
    goto :goto_0

    .line 70
    :pswitch_3
    new-instance v0, Lorg/godotengine/godot/io/file/FileData;

    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {v0, p3, v1}, Lorg/godotengine/godot/io/file/FileData;-><init>(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    .line 71
    .local v0, "fileData":Lorg/godotengine/godot/io/file/FileData;
    invoke-virtual {v0}, Lorg/godotengine/godot/io/file/FileData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    check-cast v1, Ljava/nio/channels/ReadableByteChannel;

    invoke-static {v1}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v1

    .end local v0    # "fileData":Lorg/godotengine/godot/io/file/FileData;
    goto :goto_0

    .line 66
    :pswitch_4
    new-instance v0, Lorg/godotengine/godot/io/file/AssetData;

    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    invoke-direct {v0, p2, p3, v1}, Lorg/godotengine/godot/io/file/AssetData;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V

    .line 67
    .local v0, "assetData":Lorg/godotengine/godot/io/file/AssetData;
    invoke-virtual {v0}, Lorg/godotengine/godot/io/file/AssetData;->getReadChannel$lib_templateDebug()Ljava/nio/channels/ReadableByteChannel;

    move-result-object v1

    invoke-static {v1}, Ljava/nio/channels/Channels;->newInputStream(Ljava/nio/channels/ReadableByteChannel;)Ljava/io/InputStream;

    move-result-object v1

    .line 64
    .end local v0    # "assetData":Lorg/godotengine/godot/io/file/AssetData;
    :goto_0
    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final removeFile(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "path"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 165
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 175
    :pswitch_0
    goto :goto_0

    .line 173
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->delete(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 168
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    .line 169
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-virtual {v0, p2, p3}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->delete(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 171
    :cond_0
    goto :goto_0

    .line 166
    :pswitch_3
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/FileData$Companion;->delete(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 167
    :pswitch_4
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p3}, Lorg/godotengine/godot/io/file/AssetData$Companion;->delete(Ljava/lang/String;)Z

    move-result v1

    .line 165
    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final renameFile(Lorg/godotengine/godot/io/StorageScope;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .param p1, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "from"    # Ljava/lang/String;
    .param p4, "to"    # Ljava/lang/String;

    const-string v0, "storageScope"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "context"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "from"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "to"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 180
    sget-object v0, Lorg/godotengine/godot/io/file/DataAccess$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    new-instance v0, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v0}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v0

    .line 190
    :pswitch_0
    goto :goto_0

    .line 188
    :pswitch_1
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    invoke-virtual {v0, p2, p3, p4}, Lorg/godotengine/godot/io/file/SAFData$Companion;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 183
    :pswitch_2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    .line 184
    sget-object v0, Lorg/godotengine/godot/io/file/MediaStoreData;->Companion:Lorg/godotengine/godot/io/file/MediaStoreData$Companion;

    invoke-virtual {v0, p2, p3, p4}, Lorg/godotengine/godot/io/file/MediaStoreData$Companion;->rename(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 186
    :cond_0
    goto :goto_0

    .line 181
    :pswitch_3
    sget-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    invoke-virtual {v0, p3, p4}, Lorg/godotengine/godot/io/file/FileData$Companion;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 182
    :pswitch_4
    sget-object v0, Lorg/godotengine/godot/io/file/AssetData;->Companion:Lorg/godotengine/godot/io/file/AssetData$Companion;

    invoke-virtual {v0, p3, p4}, Lorg/godotengine/godot/io/file/AssetData$Companion;->rename(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 180
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
