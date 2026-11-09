.class final Lorg/godotengine/godot/service/GodotService$RemoteListener;
.super Ljava/lang/Object;
.source "GodotService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/GodotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RemoteListener"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u001a\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0012J\u001a\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u00152\n\u0008\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0012J\u0006\u0010\u0016\u001a\u00020\u000eR\u0017\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0017"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService$RemoteListener;",
        "",
        "handlerRef",
        "Ljava/lang/ref/WeakReference;",
        "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
        "replyTo",
        "Landroid/os/Messenger;",
        "<init>",
        "(Ljava/lang/ref/WeakReference;Landroid/os/Messenger;)V",
        "getHandlerRef",
        "()Ljava/lang/ref/WeakReference;",
        "getReplyTo",
        "()Landroid/os/Messenger;",
        "onEngineError",
        "",
        "error",
        "Lorg/godotengine/godot/service/GodotService$EngineError;",
        "extras",
        "Landroid/os/Bundle;",
        "onEngineStatusUpdate",
        "status",
        "Lorg/godotengine/godot/service/GodotService$EngineStatus;",
        "onEngineRestartRequested",
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
.field private final handlerRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final replyTo:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;Landroid/os/Messenger;)V
    .locals 1
    .param p1, "handlerRef"    # Ljava/lang/ref/WeakReference;
    .param p2, "replyTo"    # Landroid/os/Messenger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
            ">;",
            "Landroid/os/Messenger;",
            ")V"
        }
    .end annotation

    const-string v0, "handlerRef"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "replyTo"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->handlerRef:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->replyTo:Landroid/os/Messenger;

    return-void
.end method

.method public static synthetic onEngineError$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;ILjava/lang/Object;)V
    .locals 0

    .line 115
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineError(Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic onEngineStatusUpdate$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;ILjava/lang/Object;)V
    .locals 0

    .line 129
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate(Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;)V

    return-void
.end method


# virtual methods
.method public final getHandlerRef()Ljava/lang/ref/WeakReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
            ">;"
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->handlerRef:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method public final getReplyTo()Landroid/os/Messenger;
    .locals 1

    .line 114
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->replyTo:Landroid/os/Messenger;

    return-object v0
.end method

.method public final onEngineError(Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "error"    # Lorg/godotengine/godot/service/GodotService$EngineError;
    .param p2, "extras"    # Landroid/os/Bundle;

    const-string v0, "error"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    nop

    .line 117
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->replyTo:Landroid/os/Messenger;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    move-object v2, v1

    .local v2, "$this$onEngineError_u24lambda_u240":Landroid/os/Message;
    const/4 v3, 0x0

    .line 118
    .local v3, "$i$a$-apply-GodotService$RemoteListener$onEngineError$1":I
    const/16 v4, 0x64

    iput v4, v2, Landroid/os/Message;->what:I

    .line 119
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "engineError"

    invoke-virtual {p1}, Lorg/godotengine/godot/service/GodotService$EngineError;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 121
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 123
    :cond_0
    nop

    .line 117
    .end local v2    # "$this$onEngineError_u24lambda_u240":Landroid/os/Message;
    .end local v3    # "$i$a$-apply-GodotService$RemoteListener$onEngineError$1":I
    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 124
    :catch_0
    move-exception v0

    .line 125
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to send engine error"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 127
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method

.method public final onEngineRestartRequested()V
    .locals 4

    .line 153
    nop

    .line 154
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->replyTo:Landroid/os/Messenger;

    const/4 v1, 0x0

    const/16 v2, 0x66

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to send restart request"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 158
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    return-void
.end method

.method public final onEngineStatusUpdate(Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;)V
    .locals 7
    .param p1, "status"    # Lorg/godotengine/godot/service/GodotService$EngineStatus;
    .param p2, "extras"    # Landroid/os/Bundle;

    const-string v0, "status"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 130
    nop

    .line 131
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->replyTo:Landroid/os/Messenger;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    move-object v2, v1

    .local v2, "$this$onEngineStatusUpdate_u24lambda_u241":Landroid/os/Message;
    const/4 v3, 0x0

    .line 132
    .local v3, "$i$a$-apply-GodotService$RemoteListener$onEngineStatusUpdate$1":I
    const/16 v4, 0x65

    iput v4, v2, Landroid/os/Message;->what:I

    .line 133
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    const-string v5, "engineStatus"

    invoke-virtual {p1}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/os/Bundle;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 135
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    invoke-virtual {v4, p2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 137
    :cond_0
    nop

    .line 131
    .end local v2    # "$this$onEngineStatusUpdate_u24lambda_u241":Landroid/os/Message;
    .end local v3    # "$i$a$-apply-GodotService$RemoteListener$onEngineStatusUpdate$1":I
    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Unable to send engine status update"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 142
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_0
    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    if-ne p1, v0, :cond_3

    .line 143
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$RemoteListener;->handlerRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    if-nez v0, :cond_1

    return-void

    .line 144
    .local v0, "handler":Lorg/godotengine/godot/service/GodotService$IncomingHandler;
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_3

    invoke-virtual {v0}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->getViewHost()Landroid/view/SurfaceControlViewHost;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 145
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Releasing SurfaceControlViewHost"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-virtual {v0}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->getViewHost()Landroid/view/SurfaceControlViewHost;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/SurfaceControlViewHost;->release()V

    .line 147
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->setViewHost(Landroid/view/SurfaceControlViewHost;)V

    .line 150
    .end local v0    # "handler":Lorg/godotengine/godot/service/GodotService$IncomingHandler;
    :cond_3
    return-void
.end method
