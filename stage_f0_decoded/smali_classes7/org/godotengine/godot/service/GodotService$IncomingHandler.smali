.class final Lorg/godotengine/godot/service/GodotService$IncomingHandler;
.super Landroid/os/Handler;
.source "GodotService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/GodotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IncomingHandler"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0015\u0012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0016R\u0014\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0011"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
        "Landroid/os/Handler;",
        "serviceRef",
        "Ljava/lang/ref/WeakReference;",
        "Lorg/godotengine/godot/service/GodotService;",
        "<init>",
        "(Ljava/lang/ref/WeakReference;)V",
        "viewHost",
        "Landroid/view/SurfaceControlViewHost;",
        "getViewHost",
        "()Landroid/view/SurfaceControlViewHost;",
        "setViewHost",
        "(Landroid/view/SurfaceControlViewHost;)V",
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
.field private final serviceRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/GodotService;",
            ">;"
        }
    .end annotation
.end field

.field private viewHost:Landroid/view/SurfaceControlViewHost;


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 1
    .param p1, "serviceRef"    # Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/service/GodotService;",
            ">;)V"
        }
    .end annotation

    const-string v0, "serviceRef"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 164
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->serviceRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final getViewHost()Landroid/view/SurfaceControlViewHost;
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->viewHost:Landroid/view/SurfaceControlViewHost;

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 19
    .param p1, "msg"    # Landroid/os/Message;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "msg"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 169
    iget-object v0, v1, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->serviceRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/service/GodotService;

    if-nez v0, :cond_0

    return-void

    :cond_0
    move-object v3, v0

    .line 171
    .local v3, "service":Lorg/godotengine/godot/service/GodotService;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "HandleMessage: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    iget-object v0, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    if-nez v0, :cond_1

    .line 175
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 176
    return-void

    .line 179
    :cond_1
    nop

    .line 180
    :try_start_0
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v0

    .line 181
    .local v0, "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    if-nez v0, :cond_2

    .line 182
    new-instance v4, Lorg/godotengine/godot/service/GodotService$RemoteListener;

    new-instance v5, Ljava/lang/ref/WeakReference;

    invoke-direct {v5, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iget-object v6, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    const-string v7, "replyTo"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v4, v5, v6}, Lorg/godotengine/godot/service/GodotService$RemoteListener;-><init>(Ljava/lang/ref/WeakReference;Landroid/os/Messenger;)V

    invoke-static {v3, v4}, Lorg/godotengine/godot/service/GodotService;->access$setListener$p(Lorg/godotengine/godot/service/GodotService;Lorg/godotengine/godot/service/GodotService$RemoteListener;)V

    goto :goto_0

    .line 183
    :cond_2
    invoke-virtual {v0}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->getReplyTo()Landroid/os/Messenger;

    move-result-object v4

    iget-object v5, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 184
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Engine is already bound to another client"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    iget-object v4, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v5

    move-object v6, v5

    .local v6, "$this$handleMessage_u24lambda_u240":Landroid/os/Message;
    const/4 v7, 0x0

    .line 186
    .local v7, "$i$a$-apply-GodotService$IncomingHandler$handleMessage$1":I
    const/16 v8, 0x64

    iput v8, v6, Landroid/os/Message;->what:I

    .line 187
    invoke-virtual {v6}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v8

    const-string v9, "engineError"

    const-string v10, "ALREADY_BOUND"

    invoke-virtual {v8, v9, v10}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 188
    nop

    .line 185
    .end local v6    # "$this$handleMessage_u24lambda_u240":Landroid/os/Message;
    .end local v7    # "$i$a$-apply-GodotService$IncomingHandler$handleMessage$1":I
    invoke-virtual {v4, v5}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 189
    return-void

    .line 192
    :cond_3
    :goto_0
    iget v4, v2, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_0

    .line 252
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .local v18, "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    invoke-super/range {p0 .. p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_2

    .line 202
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :pswitch_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    const/4 v6, 0x2

    const/4 v7, 0x0

    if-ge v4, v5, :cond_5

    .line 203
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v4

    const-string v5, "SDK version is less than the minimum required (30)"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v4

    if-eqz v4, :cond_4

    sget-object v5, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {v4, v5, v7, v6, v7}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineError$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 205
    :cond_4
    return-void

    .line 208
    :cond_5
    iget-object v4, v1, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->viewHost:Landroid/view/SurfaceControlViewHost;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 209
    .local v4, "currentViewHost":Landroid/view/SurfaceControlViewHost;
    const-string v5, "surfacePackage"

    const/4 v8, 0x0

    const/4 v9, 0x1

    const-string v10, "Attached Godot engine to SurfaceControlViewHost"

    if-eqz v4, :cond_7

    .line 210
    :try_start_1
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 211
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v6

    if-eqz v6, :cond_6

    .line 212
    sget-object v7, Lorg/godotengine/godot/service/GodotService$EngineStatus;->SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 213
    new-array v9, v9, [Lkotlin/Pair;

    invoke-virtual {v4}, Landroid/view/SurfaceControlViewHost;->getSurfacePackage()Landroid/view/SurfaceControlViewHost$SurfacePackage;

    move-result-object v10

    invoke-static {v5, v10}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v5

    aput-object v5, v9, v8

    invoke-static {v9}, Landroidx/core/os/BundleKt;->bundleOf([Lkotlin/Pair;)Landroid/os/Bundle;

    move-result-object v5

    .line 211
    invoke-virtual {v6, v7, v5}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate(Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;)V

    .line 215
    :cond_6
    return-void

    .line 218
    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v11

    .line 219
    .local v11, "msgData":Landroid/os/Bundle;
    invoke-virtual {v11}, Landroid/os/Bundle;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 220
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v5

    const-string v8, "Invalid message data from binding client.. Aborting"

    invoke-static {v5, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v5

    if-eqz v5, :cond_8

    sget-object v8, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {v5, v8, v7, v6, v7}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineError$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 222
    :cond_8
    return-void

    .line 225
    :cond_9
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getGodot(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;

    move-result-object v12

    invoke-virtual {v12}, Lorg/godotengine/godot/Godot;->getContainerLayout$lib_templateDebug()Landroid/widget/FrameLayout;

    move-result-object v12

    .line 226
    .local v12, "godotContainerLayout":Landroid/widget/FrameLayout;
    if-nez v12, :cond_b

    .line 227
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v5

    const-string v8, "Invalid godot layout.. Aborting"

    invoke-static {v5, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v5

    if-eqz v5, :cond_a

    sget-object v8, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {v5, v8, v7, v6, v7}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineError$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 229
    :cond_a
    return-void

    .line 232
    :cond_b
    const-string v6, "hostToken"

    invoke-virtual {v11, v6}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    .line 233
    .local v6, "hostToken":Landroid/os/IBinder;
    const-string v7, "width"

    invoke-virtual {v11, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v7

    .line 234
    .local v7, "width":I
    const-string v13, "height"

    invoke-virtual {v11, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v13

    .line 235
    .local v13, "height":I
    const-string v14, "displayId"

    invoke-virtual {v11, v14}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v14

    .line 236
    .local v14, "displayId":I
    const-class v15, Landroid/hardware/display/DisplayManager;

    invoke-virtual {v3, v15}, Lorg/godotengine/godot/service/GodotService;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/hardware/display/DisplayManager;

    .line 237
    invoke-virtual {v15, v14}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object v15

    .line 236
    nop

    .line 239
    .local v15, "display":Landroid/view/Display;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Setting up SurfaceControlViewHost"

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v8, Landroid/view/SurfaceControlViewHost;

    move-object v9, v3

    check-cast v9, Landroid/content/Context;

    invoke-direct {v8, v9, v15, v6}, Landroid/view/SurfaceControlViewHost;-><init>(Landroid/content/Context;Landroid/view/Display;Landroid/os/IBinder;)V

    move-object v9, v8

    .local v9, "$this$handleMessage_u24lambda_u241":Landroid/view/SurfaceControlViewHost;
    const/16 v17, 0x0

    .line 241
    .local v17, "$i$a$-apply-GodotService$IncomingHandler$handleMessage$2":I
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    move-object v0, v12

    check-cast v0, Landroid/view/View;

    invoke-virtual {v9, v0, v7, v13}, Landroid/view/SurfaceControlViewHost;->setView(Landroid/view/View;II)V

    .line 243
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 245
    sget-object v10, Lorg/godotengine/godot/service/GodotService$EngineStatus;->SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 246
    const/4 v2, 0x1

    new-array v2, v2, [Lkotlin/Pair;

    move-object/from16 v16, v4

    .end local v4    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    .local v16, "currentViewHost":Landroid/view/SurfaceControlViewHost;
    invoke-virtual {v9}, Landroid/view/SurfaceControlViewHost;->getSurfacePackage()Landroid/view/SurfaceControlViewHost$SurfacePackage;

    move-result-object v4

    invoke-static {v5, v4}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v2, v5

    invoke-static {v2}, Landroidx/core/os/BundleKt;->bundleOf([Lkotlin/Pair;)Landroid/os/Bundle;

    move-result-object v2

    .line 244
    invoke-virtual {v0, v10, v2}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate(Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;)V

    goto :goto_1

    .end local v16    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    .restart local v4    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    :cond_c
    move-object/from16 v16, v4

    .line 248
    .end local v4    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    .restart local v16    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    :goto_1
    nop

    .line 240
    .end local v9    # "$this$handleMessage_u24lambda_u241":Landroid/view/SurfaceControlViewHost;
    .end local v17    # "$i$a$-apply-GodotService$IncomingHandler$handleMessage$2":I
    move-object v0, v8

    .line 249
    .end local v16    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    .local v0, "currentViewHost":Landroid/view/SurfaceControlViewHost;
    iput-object v0, v1, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->viewHost:Landroid/view/SurfaceControlViewHost;

    .end local v0    # "currentViewHost":Landroid/view/SurfaceControlViewHost;
    .end local v6    # "hostToken":Landroid/os/IBinder;
    .end local v7    # "width":I
    .end local v11    # "msgData":Landroid/os/Bundle;
    .end local v12    # "godotContainerLayout":Landroid/widget/FrameLayout;
    .end local v13    # "height":I
    .end local v14    # "displayId":I
    .end local v15    # "display":Landroid/view/Display;
    goto :goto_3

    .line 199
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .local v0, "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :pswitch_1
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$destroyEngine(Lorg/godotengine/godot/service/GodotService;)V

    goto :goto_3

    .line 197
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :pswitch_2
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$stopEngine(Lorg/godotengine/godot/service/GodotService;)V

    goto :goto_3

    .line 195
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :pswitch_3
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    invoke-static {v3}, Lorg/godotengine/godot/service/GodotService;->access$startEngine(Lorg/godotengine/godot/service/GodotService;)V

    goto :goto_3

    .line 193
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :pswitch_4
    move-object/from16 v18, v0

    .end local v0    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .restart local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    invoke-virtual/range {p1 .. p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "commandLineParameters"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lorg/godotengine/godot/service/GodotService;->access$initEngine(Lorg/godotengine/godot/service/GodotService;[Ljava/lang/String;)Landroid/widget/FrameLayout;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    .line 252
    .end local v18    # "serviceListener":Lorg/godotengine/godot/service/GodotService$RemoteListener;
    :goto_2
    goto :goto_3

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Landroid/os/RemoteException;
    invoke-static {}, Lorg/godotengine/godot/service/GodotService;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v2

    const-string v4, "Unable to handle message"

    move-object v5, v0

    check-cast v5, Ljava/lang/Throwable;

    invoke-static {v2, v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 257
    .end local v0    # "e":Landroid/os/RemoteException;
    :goto_3
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final setViewHost(Landroid/view/SurfaceControlViewHost;)V
    .locals 0
    .param p1, "<set-?>"    # Landroid/view/SurfaceControlViewHost;

    .line 166
    iput-object p1, p0, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->viewHost:Landroid/view/SurfaceControlViewHost;

    return-void
.end method
