.class public Lorg/godotengine/godot/service/GodotService;
.super Landroid/app/Service;
.source "GodotService.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/service/GodotService$Companion;,
        Lorg/godotengine/godot/service/GodotService$EngineError;,
        Lorg/godotengine/godot/service/GodotService$EngineStatus;,
        Lorg/godotengine/godot/service/GodotService$GodotServiceHost;,
        Lorg/godotengine/godot/service/GodotService$IncomingHandler;,
        Lorg/godotengine/godot/service/GodotService$RemoteListener;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u000b\u0008\u0016\u0018\u0000 /2\u00020\u0001:\u0006/01234B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0016\u001a\u00020\u0017H\u0016J\"\u0010\u0018\u001a\u00020\u00192\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u001c\u001a\u00020\u00192\u0006\u0010\u001d\u001a\u00020\u0019H\u0016J\u0016\u0010\u001e\u001a\u00020\u00172\u000c\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u00060 H\u0015J\u0008\u0010!\u001a\u00020\"H\u0002J\u0008\u0010#\u001a\u00020\u0017H\u0016J\u0008\u0010$\u001a\u00020\u0017H\u0002J\u0014\u0010%\u001a\u0004\u0018\u00010&2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0016J\u0012\u0010\'\u001a\u00020\"2\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001bH\u0016J\u001f\u0010(\u001a\u0004\u0018\u00010)2\u000e\u0010\u001f\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010*H\u0002\u00a2\u0006\u0002\u0010+J\u0008\u0010,\u001a\u00020\u0017H\u0002J\u0008\u0010-\u001a\u00020\u0017H\u0002J\u0008\u0010.\u001a\u00020\u0017H\u0002R\u001e\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u00060\u0005j\u0008\u0012\u0004\u0012\u00020\u0006`\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u000c\u001a\u00060\rR\u00020\u0000X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u000e\u001a\u00020\u000f8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0010\u0010\u0011R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00065"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService;",
        "Landroid/app/Service;",
        "<init>",
        "()V",
        "commandLineParams",
        "Ljava/util/ArrayList;",
        "",
        "Lkotlin/collections/ArrayList;",
        "handler",
        "Lorg/godotengine/godot/service/GodotService$IncomingHandler;",
        "messenger",
        "Landroid/os/Messenger;",
        "godotHost",
        "Lorg/godotengine/godot/service/GodotService$GodotServiceHost;",
        "godot",
        "Lorg/godotengine/godot/Godot;",
        "getGodot",
        "()Lorg/godotengine/godot/Godot;",
        "godot$delegate",
        "Lkotlin/Lazy;",
        "listener",
        "Lorg/godotengine/godot/service/GodotService$RemoteListener;",
        "onCreate",
        "",
        "onStartCommand",
        "",
        "intent",
        "Landroid/content/Intent;",
        "flags",
        "startId",
        "updateCommandLineParams",
        "args",
        "",
        "performEngineInitialization",
        "",
        "onDestroy",
        "forceQuitService",
        "onBind",
        "Landroid/os/IBinder;",
        "onUnbind",
        "initEngine",
        "Landroid/widget/FrameLayout;",
        "",
        "([Ljava/lang/String;)Landroid/widget/FrameLayout;",
        "startEngine",
        "stopEngine",
        "destroyEngine",
        "Companion",
        "EngineStatus",
        "EngineError",
        "RemoteListener",
        "IncomingHandler",
        "GodotServiceHost",
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
.field public static final Companion:Lorg/godotengine/godot/service/GodotService$Companion;

.field public static final EXTRA_MSG_PAYLOAD:Ljava/lang/String; = "extraMsgPayload"

.field public static final KEY_COMMAND_LINE_PARAMETERS:Ljava/lang/String; = "commandLineParameters"

.field public static final KEY_DISPLAY_ID:Ljava/lang/String; = "displayId"

.field public static final KEY_ENGINE_ERROR:Ljava/lang/String; = "engineError"

.field public static final KEY_ENGINE_STATUS:Ljava/lang/String; = "engineStatus"

.field public static final KEY_HEIGHT:Ljava/lang/String; = "height"

.field public static final KEY_HOST_TOKEN:Ljava/lang/String; = "hostToken"

.field public static final KEY_SURFACE_PACKAGE:Ljava/lang/String; = "surfacePackage"

.field public static final KEY_WIDTH:Ljava/lang/String; = "width"

.field public static final MSG_DESTROY_ENGINE:I = 0x3

.field public static final MSG_ENGINE_ERROR:I = 0x64

.field public static final MSG_ENGINE_RESTART_REQUESTED:I = 0x66

.field public static final MSG_ENGINE_STATUS_UPDATE:I = 0x65

.field public static final MSG_INIT_ENGINE:I = 0x0

.field public static final MSG_START_ENGINE:I = 0x1

.field public static final MSG_STOP_ENGINE:I = 0x2

.field public static final MSG_WRAP_ENGINE_WITH_SCVH:I = 0x4

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final commandLineParams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final godot$delegate:Lkotlin/Lazy;

.field private final godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

.field private final handler:Lorg/godotengine/godot/service/GodotService$IncomingHandler;

.field private listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

.field private final messenger:Landroid/os/Messenger;


# direct methods
.method public static synthetic $r8$lambda$GvjxDZx2LxpiDaDdLJObqoDnRro(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/service/GodotService;->performEngineInitialization$lambda$1(Lorg/godotengine/godot/service/GodotService;)V

    return-void
.end method

.method public static synthetic $r8$lambda$saeniqcn7l7bKUdVAjb3uUcaipg(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/service/GodotService;->godot_delegate$lambda$0(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/service/GodotService$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/service/GodotService$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService;->Companion:Lorg/godotengine/godot/service/GodotService$Companion;

    .line 68
    const-class v0, Lorg/godotengine/godot/service/GodotService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 288
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/service/GodotService;->commandLineParams:Ljava/util/ArrayList;

    .line 289
    new-instance v0, Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lorg/godotengine/godot/service/GodotService;->handler:Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    .line 290
    new-instance v0, Landroid/os/Messenger;

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->handler:Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    check-cast v1, Landroid/os/Handler;

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lorg/godotengine/godot/service/GodotService;->messenger:Landroid/os/Messenger;

    .line 291
    new-instance v0, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;-><init>(Lorg/godotengine/godot/service/GodotService;)V

    iput-object v0, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    .line 293
    new-instance v0, Lorg/godotengine/godot/service/GodotService$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/service/GodotService$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/service/GodotService;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/service/GodotService;->godot$delegate:Lkotlin/Lazy;

    .line 65
    return-void
.end method

.method public static final synthetic access$destroyEngine(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->destroyEngine()V

    return-void
.end method

.method public static final synthetic access$forceQuitService(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->forceQuitService()V

    return-void
.end method

.method public static final synthetic access$getCommandLineParams$p(Lorg/godotengine/godot/service/GodotService;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->commandLineParams:Ljava/util/ArrayList;

    return-object v0
.end method

.method public static final synthetic access$getGodot(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$getHandler$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$IncomingHandler;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->handler:Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    return-object v0
.end method

.method public static final synthetic access$getListener$p(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/service/GodotService$RemoteListener;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    return-object v0
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 65
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$initEngine(Lorg/godotengine/godot/service/GodotService;[Ljava/lang/String;)Landroid/widget/FrameLayout;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;
    .param p1, "args"    # [Ljava/lang/String;

    .line 65
    invoke-direct {p0, p1}, Lorg/godotengine/godot/service/GodotService;->initEngine([Ljava/lang/String;)Landroid/widget/FrameLayout;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$setListener$p(Lorg/godotengine/godot/service/GodotService;Lorg/godotengine/godot/service/GodotService$RemoteListener;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;
    .param p1, "<set-?>"    # Lorg/godotengine/godot/service/GodotService$RemoteListener;

    .line 65
    iput-object p1, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    return-void
.end method

.method public static final synthetic access$startEngine(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->startEngine()V

    return-void
.end method

.method public static final synthetic access$stopEngine(Lorg/godotengine/godot/service/GodotService;)V
    .locals 0
    .param p0, "$this"    # Lorg/godotengine/godot/service/GodotService;

    .line 65
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->stopEngine()V

    return-void
.end method

.method private final destroyEngine()V
    .locals 4

    .line 416
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 417
    return-void

    .line 420
    :cond_0
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->onDestroy(Lorg/godotengine/godot/GodotHost;)V

    .line 422
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-object v2, Lorg/godotengine/godot/service/GodotService$EngineStatus;->DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const/4 v3, 0x2

    invoke-static {v0, v2, v1, v3, v1}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 423
    :cond_1
    iput-object v1, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    .line 424
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->forceQuitService()V

    .line 425
    return-void
.end method

.method private final forceQuitService()V
    .locals 2

    .line 352
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Force quitting service"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 353
    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService;->stopSelf()V

    .line 354
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 355
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exit(I)V

    .line 356
    return-void
.end method

.method private final getGodot()Lorg/godotengine/godot/Godot;
    .locals 1

    .line 293
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->godot$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/Godot;

    return-object v0
.end method

.method private static final godot_delegate$lambda$0(Lorg/godotengine/godot/service/GodotService;)Lorg/godotengine/godot/Godot;
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/service/GodotService;

    .line 293
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {p0}, Lorg/godotengine/godot/service/GodotService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "getApplicationContext(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot$Companion;->getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;

    move-result-object v0

    return-object v0
.end method

.method private final initEngine([Ljava/lang/String;)Landroid/widget/FrameLayout;
    .locals 5
    .param p1, "args"    # [Ljava/lang/String;

    .line 366
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInitialized()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_5

    .line 367
    const/4 v0, 0x1

    if-eqz p1, :cond_2

    array-length v2, p1

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    move v0, v3

    :cond_2
    :goto_1
    if-nez v0, :cond_3

    .line 368
    invoke-static {p1}, Lkotlin/collections/ArraysKt;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/service/GodotService;->updateCommandLineParams(Ljava/util/List;)V

    .line 371
    :cond_3
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->performEngineInitialization()Z

    move-result v0

    if-nez v0, :cond_4

    .line 372
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v2, "Unable to initialize Godot engine"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 373
    return-object v1

    .line 375
    :cond_4
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v2, "Engine initialization complete!"

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 378
    :cond_5
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getContainerLayout$lib_templateDebug()Landroid/widget/FrameLayout;

    move-result-object v0

    .line 379
    .local v0, "godotContainerLayout":Landroid/widget/FrameLayout;
    const/4 v2, 0x2

    if-nez v0, :cond_6

    .line 380
    iget-object v3, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    if-eqz v3, :cond_7

    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineError;->INIT_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {v3, v4, v1, v2, v1}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineError$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineError;Landroid/os/Bundle;ILjava/lang/Object;)V

    goto :goto_2

    .line 382
    :cond_6
    sget-object v3, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v4, "Initialized Godot engine"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    iget-object v3, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    if-eqz v3, :cond_7

    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineStatus;->INITIALIZED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-static {v3, v4, v1, v2, v1}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 386
    :cond_7
    :goto_2
    return-object v0
.end method

.method private final performEngineInitialization()Z
    .locals 5

    .line 321
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Performing engine initialization"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    nop

    .line 324
    :try_start_0
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    iget-object v2, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getCommandLine()Ljava/util/ArrayList;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    iget-object v3, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/godotengine/godot/service/GodotService$GodotServiceHost;->getHostPlugins(Lorg/godotengine/godot/Godot;)Ljava/util/Set;

    move-result-object v3

    const-string v4, "getHostPlugins(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2, v3}, Lorg/godotengine/godot/Godot;->initEngine(Lorg/godotengine/godot/GodotHost;Ljava/util/List;Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 328
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2, v3}, Lorg/godotengine/godot/Godot;->onInitRenderView$default(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;Landroid/widget/FrameLayout;ILjava/lang/Object;)Landroid/widget/FrameLayout;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 331
    const/4 v0, 0x1

    return v0

    .line 329
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to initialize engine render view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 325
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to initialize Godot engine layer"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 332
    :catch_0
    move-exception v0

    .line 333
    .local v0, "e":Ljava/lang/IllegalStateException;
    sget-object v1, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v2, "Engine initialization failed"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 334
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 336
    sget v1, Lorg/godotengine/godot/R$string;->error_engine_setup_message:I

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/service/GodotService;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 338
    :cond_2
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 334
    :goto_0
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 340
    .local v1, "errorMessage":Ljava/lang/String;
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v2

    sget v3, Lorg/godotengine/godot/R$string;->text_error_title:I

    invoke-virtual {p0, v3}, Lorg/godotengine/godot/service/GodotService;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "getString(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v4, Lorg/godotengine/godot/service/GodotService$$ExternalSyntheticLambda1;

    invoke-direct {v4, p0}, Lorg/godotengine/godot/service/GodotService$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/service/GodotService;)V

    invoke-virtual {v2, v1, v3, v4}, Lorg/godotengine/godot/Godot;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 341
    const/4 v2, 0x0

    return v2
.end method

.method private static final performEngineInitialization$lambda$1(Lorg/godotengine/godot/service/GodotService;)V
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/service/GodotService;

    .line 340
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lorg/godotengine/godot/Godot;->destroyAndKillProcess$default(Lorg/godotengine/godot/Godot;Ljava/lang/Runnable;ILjava/lang/Object;)V

    return-void
.end method

.method private final startEngine()V
    .locals 4

    .line 390
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 391
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Attempting to start uninitialized Godot engine instance"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    return-void

    .line 395
    :cond_0
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Starting Godot engine"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->onStart(Lorg/godotengine/godot/GodotHost;)V

    .line 397
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->onResume(Lorg/godotengine/godot/GodotHost;)V

    .line 399
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    if-eqz v0, :cond_1

    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STARTED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2, v3}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 400
    :cond_1
    return-void
.end method

.method private final stopEngine()V
    .locals 4

    .line 403
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    .line 404
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Attempting to stop uninitialized Godot engine instance"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 405
    return-void

    .line 408
    :cond_0
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "Stopping Godot engine"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 409
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->onPause(Lorg/godotengine/godot/GodotHost;)V

    .line 410
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->godotHost:Lorg/godotengine/godot/service/GodotService$GodotServiceHost;

    check-cast v1, Lorg/godotengine/godot/GodotHost;

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->onStop(Lorg/godotengine/godot/GodotHost;)V

    .line 412
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->listener:Lorg/godotengine/godot/service/GodotService$RemoteListener;

    if-eqz v0, :cond_1

    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STOPPED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-static {v0, v1, v3, v2, v3}, Lorg/godotengine/godot/service/GodotService$RemoteListener;->onEngineStatusUpdate$default(Lorg/godotengine/godot/service/GodotService$RemoteListener;Lorg/godotengine/godot/service/GodotService$EngineStatus;Landroid/os/Bundle;ILjava/lang/Object;)V

    .line 413
    :cond_1
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 358
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->messenger:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .line 297
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "OnCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 298
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 299
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 346
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    const-string v1, "OnDestroy"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 347
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 348
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->destroyEngine()V

    .line 349
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .line 303
    sget-object v0, Lorg/godotengine/godot/service/GodotService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Processing start command "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    if-eqz p1, :cond_0

    const-string v0, "extraMsgPayload"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/os/Message;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 305
    .local v0, "msg":Landroid/os/Message;
    :goto_0
    if-eqz v0, :cond_1

    .line 306
    iget-object v1, p0, Lorg/godotengine/godot/service/GodotService;->handler:Lorg/godotengine/godot/service/GodotService$IncomingHandler;

    invoke-virtual {v1, v0}, Lorg/godotengine/godot/service/GodotService$IncomingHandler;->sendMessage(Landroid/os/Message;)Z

    .line 308
    :cond_1
    const/4 v1, 0x2

    return v1
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .line 361
    invoke-direct {p0}, Lorg/godotengine/godot/service/GodotService;->stopEngine()V

    .line 362
    const/4 v0, 0x0

    return v0
.end method

.method protected updateCommandLineParams(Ljava/util/List;)V
    .locals 2
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->commandLineParams:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 315
    move-object v0, p1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    iget-object v0, p0, Lorg/godotengine/godot/service/GodotService;->commandLineParams:Ljava/util/ArrayList;

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 318
    :cond_0
    return-void
.end method
