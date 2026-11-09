.class public final Lorg/godotengine/godot/service/RemoteGodotFragment;
.super Landroidx/fragment/app/Fragment;
.source "RemoteGodotFragment.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;,
        Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0010*\u0001\u0014\u0008\u0007\u0018\u0000 02\u00020\u0001:\u000201B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\u001a\u001a\u00020\u0017H\u0016J&\u0010\u001b\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0008\u0010\u001f\u001a\u0004\u0018\u00010 2\u0008\u0010!\u001a\u0004\u0018\u00010\"H\u0016J\u001a\u0010#\u001a\u00020\u00172\u0006\u0010$\u001a\u00020\u001c2\u0008\u0010!\u001a\u0004\u0018\u00010\"H\u0016J\u0019\u0010%\u001a\u00020\u00172\u000c\u0010&\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e\u00a2\u0006\u0002\u0010\'J\u0010\u0010(\u001a\u00020\u00172\u0008\u0008\u0002\u0010)\u001a\u00020\nJ\u0008\u0010*\u001a\u00020\u0017H\u0002J\u0008\u0010+\u001a\u00020\u0017H\u0002J\u0008\u0010,\u001a\u00020\u0017H\u0002J\u0008\u0010-\u001a\u00020\u0017H\u0016J\u0008\u0010.\u001a\u00020\u0017H\u0016J\u0008\u0010/\u001a\u00020\u0017H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000eX\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0010R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u0015\u00a8\u00062"
    }
    d2 = {
        "Lorg/godotengine/godot/service/RemoteGodotFragment;",
        "Landroidx/fragment/app/Fragment;",
        "<init>",
        "()V",
        "messengerForReply",
        "Landroid/os/Messenger;",
        "serviceMessenger",
        "remoteSurface",
        "Landroid/view/SurfaceView;",
        "engineInitialized",
        "",
        "fragmentStarted",
        "serviceBound",
        "remoteGameArgs",
        "",
        "",
        "[Ljava/lang/String;",
        "godotHost",
        "Lorg/godotengine/godot/GodotHost;",
        "serviceConnection",
        "org/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1",
        "Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;",
        "onAttach",
        "",
        "context",
        "Landroid/content/Context;",
        "onDetach",
        "onCreateView",
        "Landroid/view/View;",
        "inflater",
        "Landroid/view/LayoutInflater;",
        "container",
        "Landroid/view/ViewGroup;",
        "bundle",
        "Landroid/os/Bundle;",
        "onViewCreated",
        "view",
        "startRemoteGame",
        "args",
        "([Ljava/lang/String;)V",
        "stopRemoteGame",
        "destroyEngine",
        "initGodotEngine",
        "startGodotEngine",
        "stopGodotEngine",
        "onStart",
        "onStop",
        "onDestroy",
        "Companion",
        "IncomingHandler",
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
.field public static final Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private engineInitialized:Z

.field private fragmentStarted:Z

.field private godotHost:Lorg/godotengine/godot/GodotHost;

.field private final messengerForReply:Landroid/os/Messenger;

.field private remoteGameArgs:[Ljava/lang/String;

.field private remoteSurface:Landroid/view/SurfaceView;

.field private serviceBound:Z

.field private final serviceConnection:Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;

.field private serviceMessenger:Landroid/os/Messenger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    .line 65
    const-class v0, Lorg/godotengine/godot/service/RemoteGodotFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 62
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 71
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v1, v2}, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;-><init>(Ljava/lang/ref/WeakReference;)V

    check-cast v1, Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    .line 83
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteGameArgs:[Ljava/lang/String;

    .line 87
    new-instance v0, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;-><init>(Lorg/godotengine/godot/service/RemoteGodotFragment;)V

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceConnection:Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;

    .line 61
    return-void
.end method

.method public static final synthetic access$getEngineInitialized$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Z
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->engineInitialized:Z

    return v0
.end method

.method public static final synthetic access$getMessengerForReply$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/os/Messenger;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    return-object v0
.end method

.method public static final synthetic access$getRemoteGameArgs$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)[Ljava/lang/String;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteGameArgs:[Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$getRemoteSurface$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/view/SurfaceView;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteSurface:Landroid/view/SurfaceView;

    return-object v0
.end method

.method public static final synthetic access$getServiceBound$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Z
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    return v0
.end method

.method public static final synthetic access$getServiceMessenger$p(Lorg/godotengine/godot/service/RemoteGodotFragment;)Landroid/os/Messenger;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    return-object v0
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 61
    sget-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$initGodotEngine(Lorg/godotengine/godot/service/RemoteGodotFragment;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    invoke-direct {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->initGodotEngine()V

    return-void
.end method

.method public static final synthetic access$setEngineInitialized$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Z)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;
    .param p1, "<set-?>"    # Z

    .line 61
    iput-boolean p1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->engineInitialized:Z

    return-void
.end method

.method public static final synthetic access$setServiceMessenger$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Landroid/os/Messenger;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;
    .param p1, "<set-?>"    # Landroid/os/Messenger;

    .line 61
    iput-object p1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    return-void
.end method

.method public static final synthetic access$startGodotEngine(Lorg/godotengine/godot/service/RemoteGodotFragment;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 61
    invoke-direct {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->startGodotEngine()V

    return-void
.end method

.method private final initGodotEngine()V
    .locals 8

    .line 287
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    if-nez v0, :cond_0

    .line 288
    return-void

    .line 291
    :cond_0
    nop

    .line 292
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    move-object v2, v1

    .local v2, "$this$initGodotEngine_u24lambda_u242":Landroid/os/Message;
    const/4 v3, 0x0

    .line 293
    .local v3, "$i$a$-apply-RemoteGodotFragment$initGodotEngine$1":I
    const/4 v4, 0x0

    iput v4, v2, Landroid/os/Message;->what:I

    .line 294
    invoke-virtual {v2}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v4

    .local v4, "$this$initGodotEngine_u24lambda_u242_u24lambda_u241":Landroid/os/Bundle;
    const/4 v5, 0x0

    .line 295
    .local v5, "$i$a$-apply-RemoteGodotFragment$initGodotEngine$1$1":I
    const-string v6, "commandLineParameters"

    iget-object v7, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteGameArgs:[Ljava/lang/String;

    invoke-virtual {v4, v6, v7}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 296
    nop

    .line 294
    .end local v4    # "$this$initGodotEngine_u24lambda_u242_u24lambda_u241":Landroid/os/Bundle;
    .end local v5    # "$i$a$-apply-RemoteGodotFragment$initGodotEngine$1$1":I
    nop

    .line 297
    iget-object v4, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    iput-object v4, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 298
    nop

    .line 292
    .end local v2    # "$this$initGodotEngine_u24lambda_u242":Landroid/os/Message;
    .end local v3    # "$i$a$-apply-RemoteGodotFragment$initGodotEngine$1":I
    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 299
    :catch_0
    move-exception v0

    .line 300
    .local v0, "e":Landroid/os/RemoteException;
    sget-object v1, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    const-string v2, "Unable to initialize Godot engine"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 302
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    :goto_0
    return-void
.end method

.method private final startGodotEngine()V
    .locals 5

    .line 305
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->engineInitialized:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->fragmentStarted:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 308
    :cond_0
    nop

    .line 309
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    move-object v2, v1

    .local v2, "$this$startGodotEngine_u24lambda_u243":Landroid/os/Message;
    const/4 v3, 0x0

    .line 310
    .local v3, "$i$a$-apply-RemoteGodotFragment$startGodotEngine$1":I
    const/4 v4, 0x1

    iput v4, v2, Landroid/os/Message;->what:I

    .line 311
    iget-object v4, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    iput-object v4, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 312
    nop

    .line 309
    .end local v2    # "$this$startGodotEngine_u24lambda_u243":Landroid/os/Message;
    .end local v3    # "$i$a$-apply-RemoteGodotFragment$startGodotEngine$1":I
    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 313
    :catch_0
    move-exception v0

    .line 314
    .local v0, "e":Landroid/os/RemoteException;
    sget-object v1, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    const-string v2, "Unable to start Godot engine"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 316
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    :goto_0
    return-void

    .line 306
    :cond_2
    :goto_1
    return-void
.end method

.method private final stopGodotEngine()V
    .locals 5

    .line 319
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->engineInitialized:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->fragmentStarted:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 322
    :cond_0
    nop

    .line 323
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v1

    move-object v2, v1

    .local v2, "$this$stopGodotEngine_u24lambda_u244":Landroid/os/Message;
    const/4 v3, 0x0

    .line 324
    .local v3, "$i$a$-apply-RemoteGodotFragment$stopGodotEngine$1":I
    const/4 v4, 0x2

    iput v4, v2, Landroid/os/Message;->what:I

    .line 325
    iget-object v4, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    iput-object v4, v2, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 326
    nop

    .line 323
    .end local v2    # "$this$stopGodotEngine_u24lambda_u244":Landroid/os/Message;
    .end local v3    # "$i$a$-apply-RemoteGodotFragment$stopGodotEngine$1":I
    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 327
    :catch_0
    move-exception v0

    .line 328
    .local v0, "e":Landroid/os/RemoteException;
    sget-object v1, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    const-string v2, "Unable to stop Godot engine"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 330
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_1
    :goto_0
    return-void

    .line 320
    :cond_2
    :goto_1
    return-void
.end method

.method public static synthetic stopRemoteGame$default(Lorg/godotengine/godot/service/RemoteGodotFragment;ZILjava/lang/Object;)V
    .locals 0

    .line 269
    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    :cond_0
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/service/RemoteGodotFragment;->stopRemoteGame(Z)V

    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 228
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 229
    invoke-virtual {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 230
    .local v0, "parentActivity":Landroidx/fragment/app/FragmentActivity;
    instance-of v1, v0, Lorg/godotengine/godot/GodotHost;

    if-eqz v1, :cond_0

    .line 231
    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    iput-object v1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->godotHost:Lorg/godotengine/godot/GodotHost;

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 234
    .local v1, "parentFragment":Landroidx/fragment/app/Fragment;
    instance-of v2, v1, Lorg/godotengine/godot/GodotHost;

    if-eqz v2, :cond_1

    .line 235
    move-object v2, v1

    check-cast v2, Lorg/godotengine/godot/GodotHost;

    iput-object v2, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->godotHost:Lorg/godotengine/godot/GodotHost;

    .line 238
    .end local v1    # "parentFragment":Landroidx/fragment/app/Fragment;
    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "bundle"    # Landroid/os/Bundle;

    const-string v0, "inflater"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 246
    sget v0, Lorg/godotengine/godot/R$layout;->remote_godot_fragment_layout:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 3

    .line 345
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Lorg/godotengine/godot/service/RemoteGodotFragment;->stopRemoteGame$default(Lorg/godotengine/godot/service/RemoteGodotFragment;ZILjava/lang/Object;)V

    .line 346
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 347
    return-void
.end method

.method public onDetach()V
    .locals 1

    .line 241
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    .line 242
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->godotHost:Lorg/godotengine/godot/GodotHost;

    .line 243
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 333
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->fragmentStarted:Z

    .line 335
    invoke-direct {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->startGodotEngine()V

    .line 336
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 339
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 340
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->fragmentStarted:Z

    .line 341
    invoke-direct {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->stopGodotEngine()V

    .line 342
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "bundle"    # Landroid/os/Bundle;

    const-string v0, "view"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 250
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 251
    sget v0, Lorg/godotengine/godot/R$id;->remote_godot_window_surface:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/SurfaceView;

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteSurface:Landroid/view/SurfaceView;

    .line 252
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteSurface:Landroid/view/SurfaceView;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 254
    :cond_0
    invoke-direct {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->initGodotEngine()V

    .line 255
    return-void
.end method

.method public final startRemoteGame([Ljava/lang/String;)V
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 258
    sget-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting remote game with args: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 260
    :cond_0
    iput-object p1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteGameArgs:[Ljava/lang/String;

    .line 261
    invoke-virtual {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 262
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const-class v4, Lorg/godotengine/godot/service/GodotService;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 263
    iget-object v3, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceConnection:Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;

    check-cast v3, Landroid/content/ServiceConnection;

    .line 264
    nop

    .line 261
    invoke-virtual {v0, v2, v3, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 266
    :cond_1
    iput-boolean v1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    .line 267
    return-void
.end method

.method public final stopRemoteGame(Z)V
    .locals 6
    .param p1, "destroyEngine"    # Z

    .line 270
    sget-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->TAG:Ljava/lang/String;

    const-string v1, "Stopping remote game"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteSurface:Landroid/view/SurfaceView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 272
    :cond_0
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->remoteGameArgs:[Ljava/lang/String;

    .line 274
    iget-boolean v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    if-eqz v0, :cond_3

    .line 275
    if-eqz p1, :cond_1

    .line 276
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceMessenger:Landroid/os/Messenger;

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    move-object v3, v2

    .local v3, "$this$stopRemoteGame_u24lambda_u240":Landroid/os/Message;
    const/4 v4, 0x0

    .line 277
    .local v4, "$i$a$-apply-RemoteGodotFragment$stopRemoteGame$1":I
    const/4 v5, 0x3

    iput v5, v3, Landroid/os/Message;->what:I

    .line 278
    iget-object v5, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->messengerForReply:Landroid/os/Messenger;

    iput-object v5, v3, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 279
    nop

    .line 276
    .end local v3    # "$this$stopRemoteGame_u24lambda_u240":Landroid/os/Message;
    .end local v4    # "$i$a$-apply-RemoteGodotFragment$stopRemoteGame$1":I
    invoke-virtual {v0, v2}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 281
    :cond_1
    invoke-virtual {p0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v2, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceConnection:Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;

    check-cast v2, Landroid/content/ServiceConnection;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 282
    :cond_2
    iput-boolean v1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment;->serviceBound:Z

    .line 284
    :cond_3
    return-void
.end method
