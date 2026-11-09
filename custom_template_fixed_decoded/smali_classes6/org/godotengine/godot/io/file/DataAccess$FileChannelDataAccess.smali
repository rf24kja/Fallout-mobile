.class public abstract Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;
.super Lorg/godotengine/godot/io/file/DataAccess;
.source "DataAccess.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/file/DataAccess;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "FileChannelDataAccess"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\u0008&\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u0008\u0010\u000c\u001a\u00020\u000bH\u0016J\u0010\u0010\r\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u000fH\u0016J\u0008\u0010\u000e\u001a\u00020\u000fH\u0016J\u0008\u0010\u0013\u001a\u00020\u000fH\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0010\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0017H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u0007X\u00a0\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u001a"
    }
    d2 = {
        "Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;",
        "Lorg/godotengine/godot/io/file/DataAccess;",
        "filePath",
        "",
        "<init>",
        "(Ljava/lang/String;)V",
        "fileChannel",
        "Ljava/nio/channels/FileChannel;",
        "getFileChannel$lib_templateDebug",
        "()Ljava/nio/channels/FileChannel;",
        "close",
        "",
        "flush",
        "seek",
        "position",
        "",
        "resize",
        "Lorg/godotengine/godot/error/Error;",
        "length",
        "size",
        "read",
        "",
        "buffer",
        "Ljava/nio/ByteBuffer;",
        "write",
        "",
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


# instance fields
.field private final filePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "filePath"    # Ljava/lang/String;

    const-string v0, "filePath"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 212
    invoke-direct {p0}, Lorg/godotengine/godot/io/file/DataAccess;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 216
    nop

    .line 217
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 218
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when closing file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 221
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public flush()V
    .locals 5

    .line 224
    nop

    .line 225
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 226
    :catch_0
    move-exception v0

    .line 227
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when flushing file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 229
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-void
.end method

.method public abstract getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;
.end method

.method public position()J
    .locals 5

    .line 255
    nop

    .line 256
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->position()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 257
    :catch_0
    move-exception v0

    .line 259
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    .line 260
    iget-object v2, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when retrieving position for file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 261
    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    .line 258
    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 263
    const-wide/16 v1, 0x0

    move-wide v0, v1

    .line 255
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-wide v0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    const-string v0, "buffer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 275
    nop

    .line 276
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 277
    .local v1, "readBytes":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 278
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->setEndOfFile$lib_templateDebug(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 279
    goto :goto_0

    .line 281
    :cond_0
    move v0, v1

    .end local v1    # "readBytes":I
    :goto_0
    goto :goto_1

    .line 283
    :catch_0
    move-exception v1

    .line 284
    .local v1, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception while reading from file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 285
    nop

    .line 275
    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    return v0
.end method

.method public resize(J)Lorg/godotengine/godot/error/Error;
    .locals 2
    .param p1, "length"    # J

    .line 240
    nop

    .line 241
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/nio/channels/FileChannel;->truncate(J)Ljava/nio/channels/FileChannel;

    .line 242
    sget-object v0, Lorg/godotengine/godot/error/Error;->OK:Lorg/godotengine/godot/error/Error;
    :try_end_0
    .catch Ljava/nio/channels/NonWritableChannelException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/nio/channels/ClosedChannelException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 249
    :catch_0
    move-exception v0

    .line 250
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/godotengine/godot/error/Error;->FAILED:Lorg/godotengine/godot/error/Error;

    move-object v0, v1

    goto :goto_0

    .line 247
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lorg/godotengine/godot/error/Error;->ERR_INVALID_PARAMETER:Lorg/godotengine/godot/error/Error;

    move-object v0, v1

    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_0

    .line 245
    :catch_2
    move-exception v0

    .line 246
    .local v0, "e":Ljava/nio/channels/ClosedChannelException;
    sget-object v1, Lorg/godotengine/godot/error/Error;->ERR_FILE_CANT_OPEN:Lorg/godotengine/godot/error/Error;

    move-object v0, v1

    .end local v0    # "e":Ljava/nio/channels/ClosedChannelException;
    goto :goto_0

    .line 243
    :catch_3
    move-exception v0

    .line 244
    .local v0, "e":Ljava/nio/channels/NonWritableChannelException;
    sget-object v1, Lorg/godotengine/godot/error/Error;->ERR_FILE_CANT_OPEN:Lorg/godotengine/godot/error/Error;

    move-object v0, v1

    .line 240
    .end local v0    # "e":Ljava/nio/channels/NonWritableChannelException;
    :goto_0
    return-object v0
.end method

.method public seek(J)V
    .locals 5
    .param p1, "position"    # J

    .line 232
    nop

    .line 233
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 234
    :catch_0
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when seeking file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 237
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public size()J
    .locals 5

    .line 267
    nop

    .line 268
    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 269
    :catch_0
    move-exception v0

    .line 270
    .local v0, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception when retrieving size for file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 271
    const-wide/16 v1, 0x0

    move-wide v0, v1

    .line 272
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    return-wide v0
.end method

.method public write(Ljava/nio/ByteBuffer;)Z
    .locals 6
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    const-string v0, "buffer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 290
    nop

    .line 291
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->getFileChannel$lib_templateDebug()Ljava/nio/channels/FileChannel;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v1

    .line 292
    .local v1, "writtenBytes":I
    if-lez v1, :cond_0

    .line 293
    invoke-virtual {p0, v0}, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->setEndOfFile$lib_templateDebug(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 295
    :cond_0
    const/4 v0, 0x1

    return v0

    .line 296
    .end local v1    # "writtenBytes":I
    :catch_0
    move-exception v1

    .line 297
    .local v1, "e":Ljava/io/IOException;
    invoke-static {}, Lorg/godotengine/godot/io/file/DataAccess;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/godotengine/godot/io/file/DataAccess$FileChannelDataAccess;->filePath:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception while writing to file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 298
    return v0
.end method
