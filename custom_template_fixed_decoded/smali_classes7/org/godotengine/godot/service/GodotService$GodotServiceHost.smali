.class final Lorg/godotengine/godot/service/GodotService$GodotServiceHost;
.super Ljava/lang/Object;
.source "GodotService.kt"

# interfaces
.implements Lorg/godotengine/godot/GodotHost;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/GodotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "GodotServiceHost"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\n\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u0012\u0012\u0004\u0012\u00020\n0\tj\u0008\u0012\u0004\u0012\u00020\n`\u000bH\u0016J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\u0010\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0007H\u0016J\u0010\u0010\u0012\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0007H\u0016\u00a8\u0006\u0013"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService$GodotServiceHost;",
        "Lorg/godotengine/godot/GodotHost;",
        "<init>",
        "(Lorg/godotengine/godot/service/GodotService;)V",
        "getActivity",
        "",
        "getGodot",
        "Lorg/godotengine/godot/Godot;",
        "getCommandLine",
        "Ljava/util/ArrayList;",
        "",
        "Lkotlin/collections/ArrayList;",
        "runOnHostThread",
        "",
        "action",
        "Ljava/lang/Runnable;",
        "onGodotForceQuit",
        "instance",
        "onGodotRestartRequested",
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
.field final synthetic this$0:Lorg/godotengine/godot/service/GodotService;


# direct methods
.method public constructor <init>(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0
    .param p1, "this$0"    # Lorg/godotengine/godot/service/GodotService;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 260
    iput-object p1, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic getActivity()Landroid/app/Activity;
    .locals 1

    .line 260
    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getActivity()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public getActivity()Ljava/lang/Void;
    .locals 1

    .line 261
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCommandLine()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 263
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v0}, Lorg/godotengine/godot/service/GodotService;->access$getCommandLineParams$p(Lorg/godotengine/godot/service/GodotService;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getCommandLine()Ljava/util/List;
    .locals 1

    .line 260
    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getCommandLine()Ljava/util/ArrayList;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getGodot()Lorg/godotengine/godot/Godot;
    .locals 1

    .line 262
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v0}, Lorg/godotengine/godot/service/GodotService;->access$getGodot(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;

    move-result-object v0

    return-object v0
.end method

.method public onGodotForceQuit(Lorg/godotengine/godot/Godot;)V
    .locals 2
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    const-string v0, "instance"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 274
    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 275
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Force quitting Godot service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v0}, Lorg/godotengine/godot/service/GodotService;->access$forceQuitService(Lorg/godotengine/godot/service/GodotService;)V

    .line 278
    :cond_0
    return-void
.end method

.method public onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V
    .locals 2
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    const-string v0, "instance"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 281
    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    if-ne p1, v0, :cond_0

    .line 282
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Restarting Godot service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v0}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineRestartRequested()V

    .line 285
    :cond_0
    return-void
.end method

.method public runOnHostThread(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "action"    # Ljava/lang/Runnable;

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 266
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v1}, Lorg/godotengine/godot/service/GodotService;->access$getHandler$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    move-result-object v1

    invoke-virtual {v1}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 267
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->this$0:Lorg/godotengine/godot/service/GodotService;

    invoke-static {v0}, Lorg/godotengine/godot/service/GodotService;->access$getHandler$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 269
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 271
    :goto_0
    return-void
.end method
