.class final Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;
.super Landroid/os/Handler;
.source "RemoteGodotFragment.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/RemoteGodotFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IncomingHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016R\u0014\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;",
        "Landroid/os/Handler;",
        "fragmentRef",
        "Ljava/lang/ref/WeakReference;",
        "Lorg/godotengine/godot/service/RemoteGodotFragment;",
        "<init>",
        "(Ljava/lang/ref/WeakReference;)V",
        "handleMessage",
        "",
        "msg",
        "Landroid/os/Message;",
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
.field private final fragmentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/RemoteGodotFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .param p1, "fragmentRef"    # Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/RemoteGodotFragment;",
            ">;)V"
        }
    .end annotation

    const-string v0, "fragmentRef"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;->fragmentRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 12
    .param p1, "msg"    # Landroid/os/Message;

    const-string v0, "msg"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;->fragmentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/service/RemoteGodotFragment;

    if-nez v0, :cond_0

    return-void

    .line 110
    .local v0, "fragment":Lorg/godotengine/godot/service/RemoteGodotFragment;
    :cond_0
    nop

    .line 111
    :try_start_0
    sget-object v1, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v1}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HandleMessage: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget v1, p1, Landroid/os/Message;->what:I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v2, 0x1

    const-string v3, "getString(...)"

    const-string v4, ""

    const/4 v5, 0x0

    packed-switch v1, :pswitch_data_0

    .line 219
    :try_start_1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_6

    .line 203
    :pswitch_0
    sget-object v1, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v1}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v1

    const-string v3, "Engine restart requested"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 205
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getServiceBound$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getEngineInitialized$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 210
    :cond_1
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getRemoteGameArgs$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)[Ljava/lang/String;

    move-result-object v1

    .line 213
    .local v1, "currentArgs":[Ljava/lang/String;
    const/4 v3, 0x0

    invoke-static {v0, v5, v2, v3}, Lorg/godotengine/godot/service/RemoteGodotFragment;->stopRemoteGame$default(Lorg/godotengine/godot/service/RemoteGodotFragment;ZILjava/lang/Object;)V

    .line 216
    invoke-virtual {v0, v1}, Lorg/godotengine/godot/service/RemoteGodotFragment;->startRemoteGame([Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_3

    .end local v1    # "currentArgs":[Ljava/lang/String;
    goto/16 :goto_6

    .line 206
    :cond_2
    :goto_0
    return-void

    .line 115
    :pswitch_1
    nop

    .line 117
    :try_start_2
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v6, "engineStatus"

    invoke-virtual {v1, v6, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    invoke-static {v1}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->valueOf(Ljava/lang/String;)Lorg/godotengine/godot/service/GodotService$EngineStatus;

    move-result-object v1

    .line 119
    .local v1, "engineStatus":Lorg/godotengine/godot/service/GodotService$EngineStatus;
    sget-object v3, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v3}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Received engine status "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    sget-object v3, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v1}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_1

    new-instance v2, Lkotlin/NoWhenBranchMatchedException;

    goto/16 :goto_3

    .line 158
    :pswitch_2
    sget-object v3, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v3}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v3

    const-string v4, "SurfaceControlViewHost created!"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v3

    .line 161
    const-string v4, "surfacePackage"

    .line 160
    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/view/SurfaceControlViewHost$SurfacePackage;

    .line 162
    .local v3, "surfacePackage":Landroid/view/SurfaceControlViewHost$SurfacePackage;
    if-nez v3, :cond_3

    .line 163
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v4, "Unable to retrieve surface package from GodotService"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    goto/16 :goto_2

    .line 165
    :cond_3
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getRemoteSurface$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/view/SurfaceView;

    move-result-object v4

    if-eqz v4, :cond_4

    invoke-virtual {v4, v3}, Landroid/view/SurfaceView;->setChildSurfacePackage(Landroid/view/SurfaceControlViewHost$SurfacePackage;)V

    .line 166
    :cond_4
    invoke-static {v0, v2}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$setEngineInitialized$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Z)V

    .line 167
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$startGodotEngine(Lorg/godotengine/godot/service/RemoteGodotFragment;)V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .end local v3    # "surfacePackage":Landroid/view/SurfaceControlViewHost$SurfacePackage;
    goto/16 :goto_2

    .line 153
    :pswitch_3
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Engine destroyed!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-static {v0, v5}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$setEngineInitialized$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Z)V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    goto/16 :goto_2

    .line 149
    :pswitch_4
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Engine stopped!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    goto/16 :goto_2

    .line 145
    :pswitch_5
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Engine started!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    goto/16 :goto_2

    .line 123
    :pswitch_6
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Engine initialized!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_3

    .line 125
    nop

    .line 126
    :try_start_3
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Creating SurfaceControlViewHost..."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getRemoteSurface$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/view/SurfaceView;

    move-result-object v2

    if-eqz v2, :cond_6

    .local v2, "it":Landroid/view/SurfaceView;
    const/4 v3, 0x0

    .line 128
    .local v3, "$i$a$-let-RemoteGodotFragment$IncomingHandler$handleMessage$1":I
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getServiceMessenger$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/os/Messenger;

    move-result-object v4

    if-eqz v4, :cond_5

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v5

    move-object v6, v5

    .local v6, "$this$handleMessage_u24lambda_u242_u24lambda_u241":Landroid/os/Message;
    const/4 v7, 0x0

    .line 129
    .local v7, "$i$a$-apply-RemoteGodotFragment$IncomingHandler$handleMessage$1$1":I
    const/4 v8, 0x4

    iput v8, v6, Landroid/os/Message;->what:I

    .line 130
    invoke-virtual {v6}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v8

    .local v8, "$this$handleMessage_u24lambda_u242_u24lambda_u241_u24lambda_u240":Landroid/os/Bundle;
    const/4 v9, 0x0

    .line 131
    .local v9, "$i$a$-apply-RemoteGodotFragment$IncomingHandler$handleMessage$1$1$1":I
    const-string v10, "hostToken"

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHostToken()Landroid/os/IBinder;

    move-result-object v11

    invoke-virtual {v8, v10, v11}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 132
    const-string v10, "displayId"

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getDisplay()Landroid/view/Display;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/Display;->getDisplayId()I

    move-result v11

    invoke-virtual {v8, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 133
    const-string v10, "width"

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getWidth()I

    move-result v11

    invoke-virtual {v8, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 134
    const-string v10, "height"

    invoke-virtual {v2}, Landroid/view/SurfaceView;->getHeight()I

    move-result v11

    invoke-virtual {v8, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 135
    nop

    .line 130
    .end local v8    # "$this$handleMessage_u24lambda_u242_u24lambda_u241_u24lambda_u240":Landroid/os/Bundle;
    .end local v9    # "$i$a$-apply-RemoteGodotFragment$IncomingHandler$handleMessage$1$1$1":I
    nop

    .line 136
    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$getMessengerForReply$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/os/Messenger;

    move-result-object v8

    iput-object v8, v6, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 137
    nop

    .line 128
    .end local v6    # "$this$handleMessage_u24lambda_u242_u24lambda_u241":Landroid/os/Message;
    .end local v7    # "$i$a$-apply-RemoteGodotFragment$IncomingHandler$handleMessage$1$1":I
    invoke-virtual {v4, v5}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1

    .line 137
    :cond_5
    nop

    .line 127
    .end local v2    # "it":Landroid/view/SurfaceView;
    .end local v3    # "$i$a$-let-RemoteGodotFragment$IncomingHandler$handleMessage$1":I
    :cond_6
    goto :goto_1

    .line 139
    :catch_0
    move-exception v2

    .line 140
    .local v2, "e":Landroid/os/RemoteException;
    :try_start_4
    sget-object v3, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v3}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Unable to set up SurfaceControlViewHost"

    move-object v5, v2

    check-cast v5, Ljava/lang/Throwable;

    invoke-static {v3, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .end local v2    # "e":Landroid/os/RemoteException;
    :goto_1
    nop

    .line 121
    .end local v1    # "engineStatus":Lorg/godotengine/godot/service/GodotService$EngineStatus;
    :goto_2
    goto/16 :goto_6

    .restart local v1    # "engineStatus":Lorg/godotengine/godot/service/GodotService$EngineStatus;
    :goto_3
    invoke-direct {v2}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    .end local v0    # "fragment":Lorg/godotengine/godot/service/RemoteGodotFragment;
    .end local p1    # "msg":Landroid/os/Message;
    throw v2
    :try_end_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_3

    .line 171
    .end local v1    # "engineStatus":Lorg/godotengine/godot/service/GodotService$EngineStatus;
    .restart local v0    # "fragment":Lorg/godotengine/godot/service/RemoteGodotFragment;
    .restart local p1    # "msg":Landroid/os/Message;
    :catch_1
    move-exception v1

    .line 172
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    :try_start_5
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to retrieve engine status update from "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_5
    .catch Landroid/os/RemoteException; {:try_start_5 .. :try_end_5} :catch_3

    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    goto/16 :goto_6

    .line 177
    :pswitch_7
    nop

    .line 179
    :try_start_6
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "engineError"

    invoke-virtual {v1, v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 178
    invoke-static {v1}, Lorg/godotengine/godot/service/GodotService$EngineError;->valueOf(Ljava/lang/String;)Lorg/godotengine/godot/service/GodotService$EngineError;

    move-result-object v1

    .line 181
    .local v1, "engineError":Lorg/godotengine/godot/service/GodotService$EngineError;
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received engine error "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 183
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;->$EnumSwitchMapping$1:[I

    invoke-virtual {v1}, Lorg/godotengine/godot/service/GodotService$EngineError;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_2

    new-instance v2, Lkotlin/NoWhenBranchMatchedException;

    goto :goto_5

    .line 194
    :pswitch_8
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "SurfaceControlViewHost creation failed"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    goto :goto_4

    .line 190
    :pswitch_9
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Engine initialization failed"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    goto :goto_4

    .line 186
    :pswitch_a
    invoke-virtual {v0, v5}, Lorg/godotengine/godot/service/RemoteGodotFragment;->stopRemoteGame(Z)V

    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 183
    .end local v1    # "engineError":Lorg/godotengine/godot/service/GodotService$EngineError;
    :goto_4
    goto :goto_6

    .restart local v1    # "engineError":Lorg/godotengine/godot/service/GodotService$EngineError;
    :goto_5
    invoke-direct {v2}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    .end local v0    # "fragment":Lorg/godotengine/godot/service/RemoteGodotFragment;
    .end local p1    # "msg":Landroid/os/Message;
    throw v2
    :try_end_6
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_6 .. :try_end_6} :catch_3

    .line 197
    .end local v1    # "engineError":Lorg/godotengine/godot/service/GodotService$EngineError;
    .restart local v0    # "fragment":Lorg/godotengine/godot/service/RemoteGodotFragment;
    .restart local p1    # "msg":Landroid/os/Message;
    :catch_2
    move-exception v1

    .line 198
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    :try_start_7
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to retrieve engine error from message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_3

    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    goto :goto_6

    .line 221
    :catch_3
    move-exception v1

    .line 222
    .local v1, "e":Landroid/os/RemoteException;
    sget-object v2, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to handle message "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 224
    .end local v1    # "e":Landroid/os/RemoteException;
    :goto_6
    return-void

    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_7
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch
.end method
