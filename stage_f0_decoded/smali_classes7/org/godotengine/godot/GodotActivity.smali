.class public abstract Lorg/godotengine/godot/GodotActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "GodotActivity.kt"

# interfaces
.implements Lorg/godotengine/godot/GodotHost;
.implements Lorg/godotengine/godot/feature/PictureInPictureProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/GodotActivity$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0015\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0008\u000b\u0008&\u0018\u0000 O2\u00020\u00012\u00020\u00022\u00020\u0003:\u0001OB\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0012\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0004J\u001d\u0010\u001b\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u001c2\u0008\u0008\u0002\u0010\u001a\u001a\u00020\u0019H\u0004\u00a2\u0006\u0002\u0010\u001dJ\u0012\u0010\u001e\u001a\u00020\u001f2\u0008\u0010 \u001a\u0004\u0018\u00010!H\u0015J\u001b\u0010\"\u001a\u00020#2\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u001cH\u0016\u00a2\u0006\u0002\u0010%J\u001a\u0010&\u001a\u00020\u001f2\u0008\u0010\'\u001a\u0004\u0018\u00010!2\u0006\u0010(\u001a\u00020\u0019H\u0004J\u0008\u0010)\u001a\u00020#H\u0015J\u0008\u0010*\u001a\u00020\u001fH\u0014J\u0008\u0010+\u001a\u00020\u001fH\u0014J\u0010\u0010,\u001a\u00020\u001f2\u0006\u0010-\u001a\u00020.H\u0016J\u0010\u0010/\u001a\u00020\u001f2\u0006\u0010-\u001a\u00020.H\u0002J\u0010\u00100\u001a\u00020\u001f2\u0006\u0010-\u001a\u00020.H\u0016J\u0008\u00101\u001a\u00020\u001fH\u0016J\u0010\u00102\u001a\u00020\u001f2\u0006\u00103\u001a\u00020\u0019H\u0014J\u0018\u00104\u001a\u00020\u001f2\u0006\u0010(\u001a\u00020\u00192\u0006\u00105\u001a\u000206H\u0015J\"\u00107\u001a\u00020\u001f2\u0006\u00108\u001a\u00020#2\u0006\u00109\u001a\u00020#2\u0008\u0010:\u001a\u0004\u0018\u00010\u0019H\u0015J+\u0010;\u001a\u00020\u001f2\u0006\u00108\u001a\u00020#2\u000c\u0010<\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u001c2\u0006\u0010=\u001a\u00020>H\u0017\u00a2\u0006\u0002\u0010?J\n\u0010@\u001a\u0004\u0018\u00010AH\u0016J\n\u0010B\u001a\u0004\u0018\u00010.H\u0016J\u0008\u0010C\u001a\u00020\u0014H\u0014J\u000e\u0010D\u001a\u0008\u0012\u0004\u0012\u00020\u000f0EH\u0017J\u0010\u0010F\u001a\u00020\u001f2\u0006\u0010G\u001a\u000206H\u0016J\u0008\u0010H\u001a\u000206H\u0016J\u0008\u0010I\u001a\u000206H\u0014J\u001c\u0010J\u001a\u00020\u001f2\u0008\u0008\u0002\u0010K\u001a\u0002062\n\u0008\u0002\u0010L\u001a\u0004\u0018\u00010\u0008J\u0008\u0010M\u001a\u00020\u001fH\u0016J\u0008\u0010N\u001a\u00020\u001fH\u0014R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\r\u001a\u0012\u0012\u0004\u0012\u00020\u000f0\u000ej\u0008\u0012\u0004\u0012\u00020\u000f`\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\"\u0010\u0015\u001a\u0004\u0018\u00010\u00142\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014@BX\u0084\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006P"
    }
    d2 = {
        "Lorg/godotengine/godot/GodotActivity;",
        "Landroidx/fragment/app/FragmentActivity;",
        "Lorg/godotengine/godot/GodotHost;",
        "Lorg/godotengine/godot/feature/PictureInPictureProvider;",
        "<init>",
        "()V",
        "pipAspectRatio",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Landroid/util/Rational;",
        "autoEnterPiP",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "gameViewSourceRectHint",
        "Landroid/graphics/Rect;",
        "commandLineParams",
        "Ljava/util/ArrayList;",
        "",
        "Lkotlin/collections/ArrayList;",
        "minPiPRatio",
        "maxPiPRatio",
        "value",
        "Lorg/godotengine/godot/GodotFragment;",
        "godotFragment",
        "getGodotFragment",
        "()Lorg/godotengine/godot/GodotFragment;",
        "sanitizeLaunchIntent",
        "Landroid/content/Intent;",
        "launchIntent",
        "retrieveCommandLineParamsFromLaunchIntent",
        "",
        "(Landroid/content/Intent;)[Ljava/lang/String;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
        "onNewGodotInstanceRequested",
        "",
        "args",
        "([Ljava/lang/String;)I",
        "triggerRebirth",
        "bundle",
        "intent",
        "getGodotAppLayout",
        "onDestroy",
        "onStop",
        "onGodotForceQuit",
        "instance",
        "Lorg/godotengine/godot/Godot;",
        "terminateGodotInstance",
        "onGodotRestartRequested",
        "onGodotSetupCompleted",
        "onNewIntent",
        "newIntent",
        "handleStartIntent",
        "newLaunch",
        "",
        "onActivityResult",
        "requestCode",
        "resultCode",
        "data",
        "onRequestPermissionsResult",
        "permissions",
        "grantResults",
        "",
        "(I[Ljava/lang/String;[I)V",
        "getActivity",
        "Landroid/app/Activity;",
        "getGodot",
        "initGodotInstance",
        "getCommandLine",
        "",
        "onPictureInPictureModeChanged",
        "isInPictureInPictureMode",
        "isPiPModeSupported",
        "isPiPEnabled",
        "updatePiPParams",
        "enableAutoEnter",
        "aspectRatio",
        "enterPiPMode",
        "onUserLeaveHint",
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
.field public static final Companion:Lorg/godotengine/godot/GodotActivity$Companion;

.field private static final DEFAULT_WINDOW_ID:I

.field private static final EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

.field private static final EXTRA_NEW_LAUNCH:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final autoEnterPiP:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final commandLineParams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final gameViewSourceRectHint:Landroid/graphics/Rect;

.field private godotFragment:Lorg/godotengine/godot/GodotFragment;

.field private final maxPiPRatio:Landroid/util/Rational;

.field private final minPiPRatio:Landroid/util/Rational;

.field private final pipAspectRatio:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/util/Rational;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$5sddhzgh7SJGWvWUvkbKwN0_cak(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/GodotActivity;->onGodotForceQuit$lambda$3(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$EUegPFVoe0vHiuDE18N0NzJqao4(Lorg/godotengine/godot/GodotActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/GodotActivity;->onCreate$lambda$0(Lorg/godotengine/godot/GodotActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$PNKvup_4mHynSnfmwd7ZhwkhWJg(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/GodotActivity;->onGodotRestartRequested$lambda$6(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$UbfvOyhZwvQGNHSeX8eqNwFYifA(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;Landroid/view/View;IIIIIIII)V
    .locals 0

    invoke-static/range {p0 .. p10}, Lorg/godotengine/godot/GodotActivity;->onCreate$lambda$1(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;Landroid/view/View;IIIIIIII)V

    return-void
.end method

.method public static synthetic $r8$lambda$vVH-4wjGpM8Ba2FUSmiyWYElm4Q(Lorg/godotengine/godot/GodotActivity;Landroid/os/Bundle;Landroid/content/Intent;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/GodotActivity;->triggerRebirth$lambda$2(Lorg/godotengine/godot/GodotActivity;Landroid/os/Bundle;Landroid/content/Intent;)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/GodotActivity$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/GodotActivity$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/GodotActivity;->Companion:Lorg/godotengine/godot/GodotActivity$Companion;

    .line 64
    const-class v0, Lorg/godotengine/godot/GodotActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    .line 67
    const-string v0, "command_line_params"

    sput-object v0, Lorg/godotengine/godot/GodotActivity;->EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

    .line 70
    const-string v0, "new_launch_requested"

    sput-object v0, Lorg/godotengine/godot/GodotActivity;->EXTRA_NEW_LAUNCH:Ljava/lang/String;

    .line 74
    const/16 v0, 0x298

    sput v0, Lorg/godotengine/godot/GodotActivity;->DEFAULT_WINDOW_ID:I

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 61
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    .line 80
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->pipAspectRatio:Ljava/util/concurrent/atomic/AtomicReference;

    .line 81
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->autoEnterPiP:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 82
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->gameViewSourceRectHint:Landroid/graphics/Rect;

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->commandLineParams:Ljava/util/ArrayList;

    .line 87
    new-instance v0, Landroid/util/Rational;

    const/16 v1, 0x64

    const/16 v2, 0xef

    invoke-direct {v0, v1, v2}, Landroid/util/Rational;-><init>(II)V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->minPiPRatio:Landroid/util/Rational;

    .line 88
    new-instance v0, Landroid/util/Rational;

    invoke-direct {v0, v2, v1}, Landroid/util/Rational;-><init>(II)V

    iput-object v0, p0, Lorg/godotengine/godot/GodotActivity;->maxPiPRatio:Landroid/util/Rational;

    .line 61
    return-void
.end method

.method public static final synthetic access$getEXTRA_COMMAND_LINE_PARAMS$cp()Ljava/lang/String;
    .locals 1

    .line 61
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$getEXTRA_NEW_LAUNCH$cp()Ljava/lang/String;
    .locals 1

    .line 61
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->EXTRA_NEW_LAUNCH:Ljava/lang/String;

    return-object v0
.end method

.method public static final getEXTRA_COMMAND_LINE_PARAMS()Ljava/lang/String;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/GodotActivity;->Companion:Lorg/godotengine/godot/GodotActivity$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/GodotActivity$Companion;->getEXTRA_COMMAND_LINE_PARAMS()Ljava/lang/String;

    move-result-object v0

    .line 67
    return-object v0
.end method

.method protected static final getEXTRA_NEW_LAUNCH()Ljava/lang/String;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/GodotActivity;->Companion:Lorg/godotengine/godot/GodotActivity$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/GodotActivity$Companion;->getEXTRA_NEW_LAUNCH()Ljava/lang/String;

    move-result-object v0

    .line 70
    return-object v0
.end method

.method private static final onCreate$lambda$0(Lorg/godotengine/godot/GodotActivity;Landroidx/activity/OnBackPressedCallback;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lorg/godotengine/godot/GodotActivity;
    .param p1, "$this$addCallback"    # Landroidx/activity/OnBackPressedCallback;

    const-string v0, "$this$addCallback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/godotengine/godot/GodotFragment;->onBackPressed()V

    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final onCreate$lambda$1(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;Landroid/view/View;IIIIIIII)V
    .locals 1
    .param p0, "$gameView"    # Landroid/view/View;
    .param p1, "this$0"    # Lorg/godotengine/godot/GodotActivity;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "left"    # I
    .param p4, "top"    # I
    .param p5, "right"    # I
    .param p6, "bottom"    # I
    .param p7, "oldLeft"    # I
    .param p8, "oldTop"    # I
    .param p9, "oldRight"    # I
    .param p10, "oldBottom"    # I

    .line 170
    iget-object v0, p1, Lorg/godotengine/godot/GodotActivity;->gameViewSourceRectHint:Landroid/graphics/Rect;

    invoke-virtual {p0, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 171
    return-void
.end method

.method private static final onGodotForceQuit$lambda$3(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V
    .locals 0
    .param p0, "this$0"    # Lorg/godotengine/godot/GodotActivity;
    .param p1, "$instance"    # Lorg/godotengine/godot/Godot;

    .line 211
    invoke-direct {p0, p1}, Lorg/godotengine/godot/GodotActivity;->terminateGodotInstance(Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method private static final onGodotRestartRequested$lambda$6(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V
    .locals 4
    .param p0, "this$0"    # Lorg/godotengine/godot/GodotActivity;
    .param p1, "$instance"    # Lorg/godotengine/godot/Godot;

    .line 225
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_1

    .local v0, "it":Lorg/godotengine/godot/GodotFragment;
    const/4 v1, 0x0

    .line 226
    .local v1, "$i$a$-let-GodotActivity$onGodotRestartRequested$1$1":I
    invoke-virtual {v0}, Lorg/godotengine/godot/GodotFragment;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v2

    if-ne p1, v2, :cond_0

    .line 232
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v3, "Restarting Godot instance..."

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-static {v2}, Lorg/godotengine/godot/utils/ProcessPhoenix;->triggerRebirth(Landroid/content/Context;)V

    .line 235
    :cond_0
    nop

    .line 225
    .end local v0    # "it":Lorg/godotengine/godot/GodotFragment;
    .end local v1    # "$i$a$-let-GodotActivity$onGodotRestartRequested$1$1":I
    nop

    .line 236
    :cond_1
    return-void
.end method

.method public static synthetic retrieveCommandLineParamsFromLaunchIntent$default(Lorg/godotengine/godot/GodotActivity;Landroid/content/Intent;ILjava/lang/Object;)[Ljava/lang/String;
    .locals 0

    .line 113
    if-nez p3, :cond_1

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/GodotActivity;->retrieveCommandLineParamsFromLaunchIntent(Landroid/content/Intent;)[Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: retrieveCommandLineParamsFromLaunchIntent"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic sanitizeLaunchIntent$default(Lorg/godotengine/godot/GodotActivity;Landroid/content/Intent;ILjava/lang/Object;)Landroid/content/Intent;
    .locals 0

    .line 99
    if-nez p3, :cond_1

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    :cond_0
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/GodotActivity;->sanitizeLaunchIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: sanitizeLaunchIntent"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final terminateGodotInstance(Lorg/godotengine/godot/Godot;)V
    .locals 4
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 215
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_1

    .local v0, "it":Lorg/godotengine/godot/GodotFragment;
    const/4 v1, 0x0

    .line 216
    .local v1, "$i$a$-let-GodotActivity$terminateGodotInstance$1":I
    invoke-virtual {v0}, Lorg/godotengine/godot/GodotFragment;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v2

    if-ne p1, v2, :cond_0

    .line 217
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v3, "Force quitting Godot instance"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    move-object v2, p0

    check-cast v2, Landroid/app/Activity;

    invoke-static {v2}, Lorg/godotengine/godot/utils/ProcessPhoenix;->forceQuit(Landroid/app/Activity;)V

    .line 220
    :cond_0
    nop

    .line 215
    .end local v0    # "it":Lorg/godotengine/godot/GodotFragment;
    .end local v1    # "$i$a$-let-GodotActivity$terminateGodotInstance$1":I
    nop

    .line 221
    :cond_1
    return-void
.end method

.method private static final triggerRebirth$lambda$2(Lorg/godotengine/godot/GodotActivity;Landroid/os/Bundle;Landroid/content/Intent;)V
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/GodotActivity;
    .param p1, "$bundle"    # Landroid/os/Bundle;
    .param p2, "$intent"    # Landroid/content/Intent;

    .line 189
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/content/Intent;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, p1, v1}, Lorg/godotengine/godot/utils/ProcessPhoenix;->triggerRebirth(Landroid/content/Context;Landroid/os/Bundle;[Landroid/content/Intent;)V

    .line 190
    return-void
.end method

.method public static synthetic updatePiPParams$default(Lorg/godotengine/godot/GodotActivity;ZLandroid/util/Rational;ILjava/lang/Object;)V
    .locals 0

    .line 328
    if-nez p4, :cond_2

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lorg/godotengine/godot/GodotActivity;->autoEnterPiP:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lorg/godotengine/godot/GodotActivity;->pipAspectRatio:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/util/Rational;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/GodotActivity;->updatePiPParams(ZLandroid/util/Rational;)V

    return-void

    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: updatePiPParams"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public enterPiPMode()V
    .locals 3

    .line 359
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isPiPModeSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 360
    const/4 v0, 0x0

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-static {p0, v0, v2, v1, v2}, Lorg/godotengine/godot/GodotActivity;->updatePiPParams$default(Lorg/godotengine/godot/GodotActivity;ZLandroid/util/Rational;ILjava/lang/Object;)V

    .line 362
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v1, "Entering PiP mode"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->enterPictureInPictureMode()V

    .line 365
    :cond_0
    return-void
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1

    .line 295
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    return-object v0
.end method

.method public getCommandLine()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 310
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->commandLineParams:Ljava/util/ArrayList;

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public getGodot()Lorg/godotengine/godot/Godot;
    .locals 1

    .line 299
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/godotengine/godot/GodotFragment;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected getGodotAppLayout()I
    .locals 1

    .line 194
    sget v0, Lorg/godotengine/godot/R$layout;->godot_app_layout:I

    return v0
.end method

.method protected final getGodotFragment()Lorg/godotengine/godot/GodotFragment;
    .locals 1

    .line 93
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    return-object v0
.end method

.method protected handleStartIntent(Landroid/content/Intent;Z)V
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "newLaunch"    # Z

    const-string v0, "intent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 262
    if-nez p2, :cond_0

    .line 263
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->EXTRA_NEW_LAUNCH:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    .line 264
    .local v0, "newLaunchRequested":Z
    if-eqz v0, :cond_0

    .line 265
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v3, "New launch requested, restarting.."

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    sget-object v3, Lorg/godotengine/godot/GodotActivity;->EXTRA_NEW_LAUNCH:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "putExtra(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 267
    .local v2, "restartIntent":Landroid/content/Intent;
    move-object v3, p0

    check-cast v3, Landroid/content/Context;

    const/4 v4, 0x1

    new-array v4, v4, [Landroid/content/Intent;

    aput-object v2, v4, v1

    invoke-static {v3, v4}, Lorg/godotengine/godot/utils/ProcessPhoenix;->triggerRebirth(Landroid/content/Context;[Landroid/content/Intent;)V

    .line 268
    return-void

    .line 271
    .end local v0    # "newLaunchRequested":Z
    .end local v2    # "restartIntent":Landroid/content/Intent;
    :cond_0
    return-void
.end method

.method protected initGodotInstance()Lorg/godotengine/godot/GodotFragment;
    .locals 1

    .line 306
    new-instance v0, Lorg/godotengine/godot/GodotFragment;

    invoke-direct {v0}, Lorg/godotengine/godot/GodotFragment;-><init>()V

    return-object v0
.end method

.method protected isPiPEnabled()Z
    .locals 1

    .line 326
    const/4 v0, 0x0

    return v0
.end method

.method public isPiPModeSupported()Z
    .locals 2

    .line 320
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isPiPEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.software.picture_in_picture"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 275
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 276
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lorg/godotengine/godot/GodotFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 277
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 125
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "getIntent(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotActivity;->sanitizeLaunchIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotActivity;->setIntent(Landroid/content/Intent;)V

    .line 127
    nop

    .line 128
    :try_start_0
    sget-object v0, Lorg/godotengine/godot/utils/CommandLineFileParser;->INSTANCE:Lorg/godotengine/godot/utils/CommandLineFileParser;

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const-string v3, "_cl_"

    invoke-virtual {v2, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    const-string v3, "open(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lorg/godotengine/godot/utils/CommandLineFileParser;->parseCommandLine(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 129
    :catch_0
    move-exception v0

    .line 130
    .local v0, "<unused var>":Ljava/lang/Exception;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/List;

    move-object v0, v2

    .line 127
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_0
    nop

    .line 132
    .local v0, "assetsCommandLine":Ljava/util/List;
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Project command line parameters: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    iget-object v2, p0, Lorg/godotengine/godot/GodotActivity;->commandLineParams:Ljava/util/ArrayList;

    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 135
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p0, v2, v3, v2}, Lorg/godotengine/godot/GodotActivity;->retrieveCommandLineParamsFromLaunchIntent$default(Lorg/godotengine/godot/GodotActivity;Landroid/content/Intent;ILjava/lang/Object;)[Ljava/lang/String;

    move-result-object v2

    .line 136
    .local v2, "intentCommandLine":[Ljava/lang/String;
    sget-object v4, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "toString(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Launch intent "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, " with parameters "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    iget-object v4, p0, Lorg/godotengine/godot/GodotActivity;->commandLineParams:Ljava/util/ArrayList;

    check-cast v4, Ljava/util/Collection;

    invoke-static {v4, v2}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 139
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 141
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getGodotAppLayout()I

    move-result v4

    invoke-virtual {p0, v4}, Lorg/godotengine/godot/GodotActivity;->setContentView(I)V

    .line 144
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getOnBackPressedDispatcher()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v5

    const-string v4, "<get-onBackPressedDispatcher>(...)"

    invoke-static {v5, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v8, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda2;

    invoke-direct {v8, p0}, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda2;-><init>(Lorg/godotengine/godot/GodotActivity;)V

    const/4 v9, 0x3

    const/4 v10, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v5 .. v10}, Landroidx/activity/OnBackPressedDispatcherKt;->addCallback$default(Landroidx/activity/OnBackPressedDispatcher;Landroidx/lifecycle/LifecycleOwner;ZLkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/activity/OnBackPressedCallback;

    .line 146
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v4, v3}, Lorg/godotengine/godot/GodotActivity;->handleStartIntent(Landroid/content/Intent;Z)V

    .line 148
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    sget v3, Lorg/godotengine/godot/R$id;->godot_fragment_container:I

    invoke-virtual {v1, v3}, Landroidx/fragment/app/FragmentManager;->findFragmentById(I)Landroidx/fragment/app/Fragment;

    move-result-object v1

    .line 149
    .local v1, "currentFragment":Landroidx/fragment/app/Fragment;
    instance-of v3, v1, Lorg/godotengine/godot/GodotFragment;

    if-eqz v3, :cond_0

    .line 150
    sget-object v3, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v4, "Reusing existing Godot fragment instance."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    move-object v3, v1

    check-cast v3, Lorg/godotengine/godot/GodotFragment;

    iput-object v3, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    goto :goto_1

    .line 153
    :cond_0
    sget-object v3, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v4, "Creating new Godot fragment instance."

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->initGodotInstance()Lorg/godotengine/godot/GodotFragment;

    move-result-object v3

    iput-object v3, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    .line 156
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v3

    const-string v4, "beginTransaction(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 157
    .local v3, "transaction":Landroidx/fragment/app/FragmentTransaction;
    if-eqz v1, :cond_1

    .line 158
    sget-object v4, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v5, "Removing existing fragment before replacement."

    invoke-static {v4, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    invoke-virtual {v3, v1}, Landroidx/fragment/app/FragmentTransaction;->remove(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 162
    :cond_1
    sget v4, Lorg/godotengine/godot/R$id;->godot_fragment_container:I

    iget-object v5, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    invoke-static {v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v5, Landroidx/fragment/app/Fragment;

    invoke-virtual {v3, v4, v5}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v4

    .line 163
    iget-object v5, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    check-cast v5, Landroidx/fragment/app/Fragment;

    invoke-virtual {v4, v5}, Landroidx/fragment/app/FragmentTransaction;->setPrimaryNavigationFragment(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v4

    .line 164
    invoke-virtual {v4}, Landroidx/fragment/app/FragmentTransaction;->commitNowAllowingStateLoss()V

    .line 167
    .end local v3    # "transaction":Landroidx/fragment/app/FragmentTransaction;
    :goto_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1a

    if-lt v3, v4, :cond_2

    .line 168
    sget v3, Lorg/godotengine/godot/R$id;->godot_fragment_container:I

    invoke-virtual {p0, v3}, Lorg/godotengine/godot/GodotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 169
    .local v3, "gameView":Landroid/view/View;
    if-eqz v3, :cond_2

    new-instance v4, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;

    invoke-direct {v4, v3, p0}, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;-><init>(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 173
    .end local v3    # "gameView":Landroid/view/View;
    :cond_2
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .line 197
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Destroying GodotActivity "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    .line 199
    return-void
.end method

.method public onGodotForceQuit(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    const-string v0, "instance"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 211
    new-instance v0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0, p1}, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda4;-><init>(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 212
    return-void
.end method

.method public onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    const-string v0, "instance"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 224
    new-instance v0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/GodotActivity;Lorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 237
    return-void
.end method

.method public onGodotSetupCompleted()V
    .locals 4

    .line 240
    invoke-super {p0}, Lorg/godotengine/godot/GodotHost;->onGodotSetupCompleted()V

    .line 242
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isPiPEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    nop

    .line 245
    :try_start_0
    const-string v0, "display/window/size/viewport_width"

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 246
    .local v0, "viewportWidth":I
    const-string v1, "display/window/size/viewport_height"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 247
    .local v1, "viewportHeight":I
    iget-object v2, p0, Lorg/godotengine/godot/GodotActivity;->pipAspectRatio:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v3, Landroid/util/Rational;

    invoke-direct {v3, v0, v1}, Landroid/util/Rational;-><init>(II)V

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "viewportWidth":I
    .end local v1    # "viewportHeight":I
    goto :goto_0

    .line 248
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/NumberFormatException;
    sget-object v1, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v2, "Unable to parse viewport dimensions."

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 252
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_0
    :goto_0
    return-void
.end method

.method public onNewGodotInstanceRequested([Ljava/lang/String;)I
    .locals 4
    .param p1, "args"    # [Ljava/lang/String;

    const-string v0, "args"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 176
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "toString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Restarting with parameters "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 178
    new-instance v1, Landroid/content/ComponentName;

    move-object v2, p0

    check-cast v2, Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v0

    .line 179
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    .line 180
    sget-object v1, Lorg/godotengine/godot/GodotActivity;->EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "putExtra(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 177
    nop

    .line 181
    .local v0, "intent":Landroid/content/Intent;
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lorg/godotengine/godot/GodotActivity;->triggerRebirth(Landroid/os/Bundle;Landroid/content/Intent;)V

    .line 183
    sget v1, Lorg/godotengine/godot/GodotActivity;->DEFAULT_WINDOW_ID:I

    return v1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "newIntent"    # Landroid/content/Intent;

    const-string v0, "newIntent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 255
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/GodotActivity;->sanitizeLaunchIntent(Landroid/content/Intent;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotActivity;->setIntent(Landroid/content/Intent;)V

    .line 256
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-super {p0, v0}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 257
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "getIntent(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/godotengine/godot/GodotActivity;->handleStartIntent(Landroid/content/Intent;Z)V

    .line 258
    return-void
.end method

.method public onPictureInPictureModeChanged(Z)V
    .locals 1
    .param p1, "isInPictureInPictureMode"    # Z

    .line 313
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onPictureInPictureModeChanged(Z)V

    .line 314
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->onPictureInPictureModeChanged$lib_templateDebug(Z)V

    .line 315
    :cond_0
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 8
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "grantResults"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 281
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 282
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->godotFragment:Lorg/godotengine/godot/GodotFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lorg/godotengine/godot/GodotFragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 285
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_3

    .line 286
    :pswitch_0
    sget-object v0, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v1, "Received permissions request result.."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p2

    :goto_0
    if-ge v0, v1, :cond_3

    .line 288
    aget v2, p3, v0

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    .line 289
    .local v2, "permissionGranted":Z
    :goto_1
    sget-object v3, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    aget-object v4, p2, v0

    if-eqz v2, :cond_2

    const-string v5, "granted"

    goto :goto_2

    :cond_2
    const-string v5, "denied"

    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Permission "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    .end local v2    # "permissionGranted":Z
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 292
    .end local v0    # "i":I
    :cond_3
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3e9
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected onStop()V
    .locals 1

    .line 202
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onStop()V

    .line 204
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isInPictureInPictureMode()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 206
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->finish()V

    .line 208
    :cond_0
    return-void
.end method

.method protected onUserLeaveHint()V
    .locals 1

    .line 368
    iget-object v0, p0, Lorg/godotengine/godot/GodotActivity;->autoEnterPiP:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 369
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->enterPiPMode()V

    .line 371
    :cond_0
    return-void
.end method

.method protected final retrieveCommandLineParamsFromLaunchIntent(Landroid/content/Intent;)[Ljava/lang/String;
    .locals 4
    .param p1, "launchIntent"    # Landroid/content/Intent;

    const-string v0, "launchIntent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    .line 115
    .local v0, "targetComponent":Landroid/content/ComponentName;
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    const-string v3, "getActivityInfo(...)"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    .local v1, "activityInfo":Landroid/content/pm/ActivityInfo;
    iget-boolean v3, v1, Landroid/content/pm/ActivityInfo;->exported:Z

    if-nez v3, :cond_2

    .line 117
    sget-object v3, Lorg/godotengine/godot/GodotActivity;->EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 118
    .local v3, "params":[Ljava/lang/String;
    if-nez v3, :cond_1

    new-array v2, v2, [Ljava/lang/String;

    goto :goto_0

    :cond_1
    move-object v2, v3

    :goto_0
    return-object v2

    .line 120
    .end local v3    # "params":[Ljava/lang/String;
    :cond_2
    new-array v2, v2, [Ljava/lang/String;

    return-object v2
.end method

.method protected final sanitizeLaunchIntent(Landroid/content/Intent;)Landroid/content/Intent;
    .locals 3
    .param p1, "launchIntent"    # Landroid/content/Intent;

    const-string v0, "launchIntent"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    .line 101
    .local v0, "targetComponent":Landroid/content/ComponentName;
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    const-string v2, "getActivityInfo(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    .local v1, "activityInfo":Landroid/content/pm/ActivityInfo;
    iget-boolean v2, v1, Landroid/content/pm/ActivityInfo;->exported:Z

    if-eqz v2, :cond_1

    .line 103
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->EXTRA_COMMAND_LINE_PARAMS:Ljava/lang/String;

    invoke-virtual {p1, v2}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    .line 106
    :cond_1
    return-object p1
.end method

.method protected final triggerRebirth(Landroid/os/Bundle;Landroid/content/Intent;)V
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;
    .param p2, "intent"    # Landroid/content/Intent;

    const-string v0, "intent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 188
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "getApplicationContext(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot$Companion;->getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;

    move-result-object v0

    new-instance v1, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1, p2}, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/GodotActivity;Landroid/os/Bundle;Landroid/content/Intent;)V

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->destroyAndKillProcess(Ljava/lang/Runnable;)V

    .line 191
    return-void
.end method

.method public final updatePiPParams(ZLandroid/util/Rational;)V
    .locals 5
    .param p1, "enableAutoEnter"    # Z
    .param p2, "aspectRatio"    # Landroid/util/Rational;

    .line 329
    if-eqz p2, :cond_2

    move-object v0, p2

    .local v0, "it":Landroid/util/Rational;
    const/4 v1, 0x0

    .line 330
    .local v1, "$i$a$-let-GodotActivity$updatePiPParams$fixedAspectRatio$1":I
    iget-object v2, p0, Lorg/godotengine/godot/GodotActivity;->minPiPRatio:Landroid/util/Rational;

    invoke-virtual {v0, v2}, Landroid/util/Rational;->compareTo(Landroid/util/Rational;)I

    move-result v2

    if-ltz v2, :cond_1

    iget-object v2, p0, Lorg/godotengine/godot/GodotActivity;->maxPiPRatio:Landroid/util/Rational;

    invoke-virtual {v0, v2}, Landroid/util/Rational;->compareTo(Landroid/util/Rational;)I

    move-result v2

    if-lez v2, :cond_0

    goto :goto_0

    .line 334
    :cond_0
    move-object v2, v0

    goto :goto_1

    .line 331
    :cond_1
    :goto_0
    sget-object v2, Lorg/godotengine/godot/GodotActivity;->TAG:Ljava/lang/String;

    const-string v3, "The bounds of the aspect ratio must be between 2.39:1 and 1:2.39 (inclusive). Coercing to valid range."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    move-object v2, v0

    check-cast v2, Ljava/lang/Comparable;

    iget-object v3, p0, Lorg/godotengine/godot/GodotActivity;->minPiPRatio:Landroid/util/Rational;

    check-cast v3, Ljava/lang/Comparable;

    iget-object v4, p0, Lorg/godotengine/godot/GodotActivity;->maxPiPRatio:Landroid/util/Rational;

    check-cast v4, Ljava/lang/Comparable;

    invoke-static {v2, v3, v4}, Lkotlin/ranges/RangesKt;->coerceIn(Ljava/lang/Comparable;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;

    move-result-object v2

    check-cast v2, Landroid/util/Rational;

    .line 335
    :goto_1
    nop

    .line 329
    .end local v0    # "it":Landroid/util/Rational;
    .end local v1    # "$i$a$-let-GodotActivity$updatePiPParams$fixedAspectRatio$1":I
    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    move-object v0, v2

    .line 338
    .local v0, "fixedAspectRatio":Landroid/util/Rational;
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotActivity;->isPiPModeSupported()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 339
    iget-object v1, p0, Lorg/godotengine/godot/GodotActivity;->autoEnterPiP:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 340
    iget-object v1, p0, Lorg/godotengine/godot/GodotActivity;->pipAspectRatio:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 342
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_5

    .line 343
    new-instance v1, Landroid/app/PictureInPictureParams$Builder;

    invoke-direct {v1}, Landroid/app/PictureInPictureParams$Builder;-><init>()V

    .line 344
    iget-object v2, p0, Lorg/godotengine/godot/GodotActivity;->gameViewSourceRectHint:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/app/PictureInPictureParams$Builder;->setSourceRectHint(Landroid/graphics/Rect;)Landroid/app/PictureInPictureParams$Builder;

    move-result-object v1

    .line 345
    invoke-virtual {v1, v0}, Landroid/app/PictureInPictureParams$Builder;->setAspectRatio(Landroid/util/Rational;)Landroid/app/PictureInPictureParams$Builder;

    move-result-object v1

    .line 343
    nop

    .line 346
    .local v1, "builder":Landroid/app/PictureInPictureParams$Builder;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1f

    if-lt v2, v3, :cond_3

    .line 347
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/PictureInPictureParams$Builder;->setSeamlessResizeEnabled(Z)Landroid/app/PictureInPictureParams$Builder;

    move-result-object v2

    .line 348
    invoke-virtual {v2, p1}, Landroid/app/PictureInPictureParams$Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams$Builder;

    .line 350
    :cond_3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x21

    if-lt v2, v3, :cond_4

    .line 351
    invoke-virtual {v1, v0}, Landroid/app/PictureInPictureParams$Builder;->setExpandedAspectRatio(Landroid/util/Rational;)Landroid/app/PictureInPictureParams$Builder;

    .line 353
    :cond_4
    invoke-virtual {v1}, Landroid/app/PictureInPictureParams$Builder;->build()Landroid/app/PictureInPictureParams;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/godotengine/godot/GodotActivity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V

    .line 356
    .end local v1    # "builder":Landroid/app/PictureInPictureParams$Builder;
    :cond_5
    return-void
.end method
