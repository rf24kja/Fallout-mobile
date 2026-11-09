.class public final Lorg/godotengine/godot/io/file/FileData;
.super Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;
.source "FileData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/FileData$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000 \u000c2\u00020\u0001:\u0001\u000cB\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0090\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\r"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/FileData;",
        "Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;",
        "filePath",
        "",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
        "<init>",
        "(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V",
        "fileChannel",
        "Ljava/nio/channels/FileChannel;",
        "getFileChannel$lib_templateDebug",
        "()Ljava/nio/channels/FileChannel;",
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
.field public static final Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final fileChannel:Ljava/nio/channels/FileChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/io/file/FileData$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/file/FileData$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/file/FileData;->Companion:Lorg/godotengine/godot/io/file/FileData$Companion;

    .line 50
    const-class v0, Lorg/godotengine/godot/io/file/FileData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/file/FileData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V
    .locals 3
    .param p1, "filePath"    # Ljava/lang/String;
    .param p2, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;

    const-string v0, "filePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "accessFlag"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;-><init>(Ljava/lang/String;)V

    .line 112
    nop

    .line 113
    sget-object v0, Lorg/godotengine/godot/io/file/FileAccessFlags;->WRITE:Lorg/godotengine/godot/io/file/FileAccessFlags;

    if-ne p2, v0, :cond_1

    .line 115
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 116
    .local v0, "parentDir":Ljava/io/File;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 117
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 120
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {p2}, Lorg/godotengine/godot/io/file/FileAccessFlags;->shouldTruncate()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-direct {v1, p1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .end local v0    # "parentDir":Ljava/io/File;
    goto :goto_0

    .line 122
    :cond_1
    new-instance v0, Ljava/io/RandomAccessFile;

    invoke-virtual {p2}, Lorg/godotengine/godot/io/file/FileAccessFlags;->getMode()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    .line 113
    :goto_0
    nop

    .line 116
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 113
    iput-object v0, p0, Lorg/godotengine/godot/io/file/FileData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 125
    invoke-virtual {p2}, Lorg/godotengine/godot/io/file/FileAccessFlags;->shouldTruncate()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 126
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/FileData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 128
    :cond_2
    nop

    .line 47
    return-void
.end method


# virtual methods
.method public getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;
    .locals 1

    .line 110
    iget-object v0, p0, Lorg/godotengine/godot/io/file/FileData;->fileChannel:Ljava/nio/channels/FileChannel;

    return-object v0
.end method
