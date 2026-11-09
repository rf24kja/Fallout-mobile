.class public final Lorg/godotengine/godot/io/file/SAFData;
.super Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;
.source "SAFData.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/file/SAFData$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0000\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0012\u001a\u00020\u0013H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\n\u001a\u00020\u000bX\u0090\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0015"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/SAFData;",
        "Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;",
        "context",
        "Landroid/content/Context;",
        "path",
        "",
        "accessFlag",
        "Lorg/godotengine/godot/io/file/FileAccessFlags;",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V",
        "fileChannel",
        "Ljava/nio/channels/FileChannel;",
        "getFileChannel$lib_templateDebug",
        "()Ljava/nio/channels/FileChannel;",
        "parcelFileDescriptor",
        "Landroid/os/ParcelFileDescriptor;",
        "getParcelFileDescriptor",
        "()Landroid/os/ParcelFileDescriptor;",
        "close",
        "",
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
.field public static final Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final fileChannel:Ljava/nio/channels/FileChannel;

.field private final parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private final path:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/io/file/SAFData$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/io/file/SAFData$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    .line 53
    const-class v0, Lorg/godotengine/godot/io/file/SAFData;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "path"    # Ljava/lang/String;
    .param p3, "accessFlag"    # Lorg/godotengine/godot/io/file/FileAccessFlags;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "path"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "accessFlag"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 50
    invoke-direct {p0, p2}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;-><init>(Ljava/lang/String;)V

    .line 49
    iput-object p2, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

    .line 179
    nop

    .line 180
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->Companion:Lorg/godotengine/godot/io/file/SAFData$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

    invoke-static {v0, p1, v1, p3}, Lorg/godotengine/godot/io/file/SAFData$Companion;->access$resolvePath(Lorg/godotengine/godot/io/file/SAFData$Companion;Landroid/content/Context;Ljava/lang/String;Lorg/godotengine/godot/io/file/FileAccessFlags;)Landroid/net/Uri;

    move-result-object v0

    .line 181
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->getMode()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    if-eqz v1, :cond_2

    iput-object v1, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    .line 183
    sget-object v1, Lorg/godotengine/godot/io/file/FileAccessFlags;->READ:Lorg/godotengine/godot/io/file/FileAccessFlags;

    if-ne p3, v1, :cond_0

    .line 184
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-virtual {v1}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    goto :goto_0

    .line 186
    :cond_0
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 183
    :goto_0
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/godotengine/godot/io/file/SAFData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 189
    invoke-virtual {p3}, Lorg/godotengine/godot/io/file/FileAccessFlags;->shouldTruncate()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 190
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/SAFData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    const-wide/16 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 192
    .end local v0    # "uri":Landroid/net/Uri;
    :cond_1
    nop

    .line 49
    return-void

    .line 182
    .restart local v0    # "uri":Landroid/net/Uri;
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unable to access file descriptor"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 49
    sget-object v0, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 7

    .line 195
    const-string v0, "Exception when closing ParcelFileDescriptor for "

    const-string v1, "."

    .line 196
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/SAFData;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    nop

    .line 201
    :try_start_1
    iget-object v2, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 202
    :catch_0
    move-exception v2

    .line 203
    .local v2, "e":Ljava/io/IOException;
    sget-object v3, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

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

    .line 205
    .end local v2    # "e":Ljava/io/IOException;
    :goto_1
    goto :goto_2

    .line 200
    :catchall_0
    move-exception v2

    goto :goto_3

    .line 197
    :catch_1
    move-exception v2

    .line 198
    .restart local v2    # "e":Ljava/io/IOException;
    :try_start_2
    sget-object v3, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

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

    .line 200
    .end local v2    # "e":Ljava/io/IOException;
    nop

    .line 201
    :try_start_3
    iget-object v2, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    .line 202
    :catch_2
    move-exception v2

    .line 203
    .restart local v2    # "e":Ljava/io/IOException;
    sget-object v3, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    iget-object v4, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_0

    .line 206
    .end local v2    # "e":Ljava/io/IOException;
    :goto_2
    return-void

    .line 201
    :goto_3
    :try_start_4
    iget-object v3, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v3}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_4

    .line 202
    :catch_3
    move-exception v3

    .line 203
    .local v3, "e":Ljava/io/IOException;
    sget-object v4, Lorg/godotengine/godot/io/file/SAFData;->TAG:Ljava/lang/String;

    iget-object v5, p0, Lorg/godotengine/godot/io/file/SAFData;->path:Ljava/lang/String;

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

    .line 177
    iget-object v0, p0, Lorg/godotengine/godot/io/file/SAFData;->fileChannel:Ljava/nio/channels/FileChannel;

    return-object v0
.end method

.method public final getParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;
    .locals 1

    .line 178
    iget-object v0, p0, Lorg/godotengine/godot/io/file/SAFData;->parcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object v0
.end method
