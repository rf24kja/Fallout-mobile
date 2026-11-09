.class public final Lorg/godotengine/godot/nativeapi/GodotNativeBridge;
.super Ljava/lang/Object;
.source "GodotNativeBridge.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/nativeapi/GodotNativeBridge$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nGodotNativeBridge.kt\nKotlin\n*S Kotlin\n*F\n+ 1 GodotNativeBridge.kt\norg/godotengine/godot/nativeapi/GodotNativeBridge\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 4 Uri.kt\nandroidx/core/net/UriKt\n*L\n1#1,436:1\n1#2:437\n37#3:438\n36#3,3:439\n29#4:442\n*S KotlinDebug\n*F\n+ 1 GodotNativeBridge.kt\norg/godotengine/godot/nativeapi/GodotNativeBridge\n*L\n239#1:438\n239#1:439,3\n323#1:442\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0007\n\u0002\u0010\u0011\n\u0002\u0008\u0015\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u001e\n\u0002\u0018\u0002\n\u0002\u0008\u0016\u0008\u0001\u0018\u0000 q2\u00020\u0001:\u0001qB\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u000c\u001a\u00020\rH\u0002J\u0008\u0010\u000e\u001a\u00020\rH\u0002J\u0008\u0010\u000f\u001a\u00020\rH\u0002J\u0010\u0010\u0010\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0008\u0010\u0013\u001a\u00020\u0012H\u0002J\u0008\u0010\u0014\u001a\u00020\u0012H\u0002J\u0010\u0010\u0015\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0008\u0010\u0016\u001a\u00020\rH\u0002J\u0018\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u0019H\u0002J\u0010\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u001c\u001a\u00020\u001dH\u0002J\u0008\u0010\u001e\u001a\u00020\u0012H\u0002J\u0008\u0010\u001f\u001a\u00020\u0012H\u0002J3\u0010 \u001a\u00020\r2\u0006\u0010!\u001a\u00020\u00192\u0006\u0010\"\u001a\u00020\u00192\u0006\u0010#\u001a\u00020\u001d2\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u00020\u00190%H\u0002\u00a2\u0006\u0002\u0010&J+\u0010\'\u001a\u00020\r2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0018\u001a\u00020\u00192\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00190%H\u0002\u00a2\u0006\u0002\u0010)J \u0010*\u001a\u00020\r2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010+\u001a\u00020\u0019H\u0002J\u0008\u0010,\u001a\u00020\u001dH\u0002J\u0008\u0010-\u001a\u00020\u001dH\u0002J\u0012\u0010.\u001a\u00020\u00122\u0008\u0010/\u001a\u0004\u0018\u00010\u0019H\u0002J\u0008\u00100\u001a\u00020\u0012H\u0002J\u0017\u00101\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0019\u0018\u00010%H\u0002\u00a2\u0006\u0002\u00102J\u0018\u00103\u001a\u00020\r2\u0006\u00104\u001a\u00020\u001d2\u0006\u00105\u001a\u00020\u001dH\u0003J\u0010\u00106\u001a\u00020\u00122\u0006\u00107\u001a\u00020\u0019H\u0002J\u0013\u00108\u001a\u0008\u0012\u0004\u0012\u00020\u00190%H\u0002\u00a2\u0006\u0002\u00102J\u0008\u00109\u001a\u00020\u0019H\u0002J\n\u0010:\u001a\u0004\u0018\u00010;H\u0002J\n\u0010<\u001a\u0004\u0018\u00010=H\u0002J\u0008\u0010>\u001a\u00020\u0019H\u0002J\u0010\u0010?\u001a\u00020\r2\u0006\u0010@\u001a\u00020\u0019H\u0002J\u0008\u0010A\u001a\u00020\u0012H\u0002J\u0010\u0010B\u001a\u00020\r2\u0006\u0010C\u001a\u00020\u0019H\u0002J\n\u0010D\u001a\u0004\u0018\u00010\u0019H\u0002J\u0008\u0010E\u001a\u00020\rH\u0002J\u001b\u0010F\u001a\u00020\u001d2\u000c\u0010G\u001a\u0008\u0012\u0004\u0012\u00020\u00190%H\u0002\u00a2\u0006\u0002\u0010HJ\u0018\u0010I\u001a\u00020\r2\u0006\u0010J\u001a\u00020\u00192\u0006\u0010K\u001a\u00020\u0019H\u0002J\u0018\u0010L\u001a\u00020\r2\u0006\u0010J\u001a\u00020\u00192\u0006\u0010K\u001a\u00020\u0019H\u0002J\u0010\u0010M\u001a\u00020\r2\u0006\u0010N\u001a\u00020\u0019H\u0002J0\u0010O\u001a\u00020\u001d2\u0006\u0010P\u001a\u00020\u00192\u0006\u0010Q\u001a\u00020\u00192\u0006\u0010R\u001a\u00020\u00192\u0006\u0010S\u001a\u00020\u00192\u0006\u0010T\u001a\u00020\u0019H\u0002J\u0010\u0010U\u001a\u00020\u001d2\u0006\u0010V\u001a\u00020\u0019H\u0002J\u0010\u0010W\u001a\u00020\r2\u0006\u0010X\u001a\u00020\u0019H\u0002J\u0010\u0010Y\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0010\u0010Z\u001a\u00020\u00122\u0006\u0010[\u001a\u00020\\H\u0002J\u0008\u0010]\u001a\u00020\rH\u0002JC\u0010^\u001a\u00020\u001d2\u0006\u0010_\u001a\u00020\u00192\u000c\u0010`\u001a\u0008\u0012\u0004\u0012\u00020\u00190%2\u0006\u0010a\u001a\u00020\u00192\u0006\u0010b\u001a\u00020\u00192\u0006\u0010c\u001a\u00020\\2\u0006\u0010d\u001a\u00020\\H\u0002\u00a2\u0006\u0002\u0010eJ\u0010\u0010f\u001a\u00020\r2\u0006\u0010g\u001a\u00020\u001dH\u0002J \u0010h\u001a\u00020\r2\u0006\u0010a\u001a\u00020\u00192\u0006\u0010b\u001a\u00020\u00192\u0006\u0010[\u001a\u00020\\H\u0002J\u0008\u0010i\u001a\u00020\u0012H\u0002J\u0008\u0010j\u001a\u00020\u0012H\u0002J\u0008\u0010k\u001a\u00020\rH\u0002J\u0018\u0010l\u001a\u00020\r2\u0006\u0010m\u001a\u00020\u001d2\u0006\u0010n\u001a\u00020\u001dH\u0002J\u0010\u0010o\u001a\u00020\r2\u0006\u0010p\u001a\u00020\u0012H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u0006\u001a\u0004\u0018\u00010\u00078BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\n\u0010\u000b\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006r"
    }
    d2 = {
        "Lorg/godotengine/godot/nativeapi/GodotNativeBridge;",
        "",
        "godot",
        "Lorg/godotengine/godot/Godot;",
        "<init>",
        "(Lorg/godotengine/godot/Godot;)V",
        "vibratorService",
        "Landroid/os/Vibrator;",
        "getVibratorService",
        "()Landroid/os/Vibrator;",
        "vibratorService$delegate",
        "Lkotlin/Lazy;",
        "onGodotSetupCompleted",
        "",
        "onGodotMainLoopStarted",
        "onGodotTerminating",
        "nativeEnableImmersiveMode",
        "enabled",
        "",
        "isInImmersiveMode",
        "isInEdgeToEdgeMode",
        "setKeepScreenOn",
        "restart",
        "alert",
        "message",
        "",
        "title",
        "forceQuit",
        "instanceId",
        "",
        "isDarkModeSupported",
        "isDarkMode",
        "showFilePicker",
        "currentDirectory",
        "filename",
        "fileMode",
        "filters",
        "",
        "(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V",
        "showDialog",
        "buttons",
        "(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V",
        "showInputDialog",
        "existingText",
        "getAccentColor",
        "getBaseColor",
        "requestPermission",
        "name",
        "requestPermissions",
        "getGrantedPermissions",
        "()[Ljava/lang/String;",
        "vibrate",
        "durationMs",
        "amplitude",
        "checkInternalFeatureSupport",
        "feature",
        "getGDExtensionConfigFiles",
        "getCACertificates",
        "getActivity",
        "Landroid/app/Activity;",
        "getRenderView",
        "Lorg/godotengine/godot/GodotRenderView;",
        "getClipboard",
        "setClipboard",
        "text",
        "hasClipboard",
        "setWindowColor",
        "color",
        "getInputFallbackMapping",
        "initInputDevices",
        "createNewGodotInstance",
        "args",
        "([Ljava/lang/String;)I",
        "nativeBeginBenchmarkMeasure",
        "scope",
        "label",
        "nativeEndBenchmarkMeasure",
        "nativeDumpBenchmark",
        "benchmarkFile",
        "nativeSignApk",
        "inputPath",
        "outputPath",
        "keystorePath",
        "keystoreUser",
        "keystorePassword",
        "nativeVerifyApk",
        "apkPath",
        "nativeOnEditorWorkspaceSelected",
        "workspace",
        "nativeOnDistractionFreeModeChanged",
        "nativeBuildEnvConnect",
        "callback",
        "Lorg/godotengine/godot/variant/Callable;",
        "nativeBuildEnvDisconnect",
        "nativeBuildEnvExecute",
        "buildTool",
        "arguments",
        "projectPath",
        "buildDir",
        "outputCallback",
        "resultCallback",
        "(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Lorg/godotengine/godot/variant/Callable;)I",
        "nativeBuildEnvCancel",
        "jobId",
        "nativeBuildEnvCleanProject",
        "nativeIsPiPModeSupported",
        "nativeIsInPiPMode",
        "nativeEnterPiPMode",
        "nativeSetPiPModeAspectRatio",
        "numerator",
        "denominator",
        "nativeSetAutoEnterPiPModeOnBackground",
        "autoEnterPiPOnBackground",
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
.field public static final Companion:Lorg/godotengine/godot/nativeapi/GodotNativeBridge$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final godot:Lorg/godotengine/godot/Godot;

.field private final vibratorService$delegate:Lkotlin/Lazy;


# direct methods
.method public static synthetic $r8$lambda$L7wFjH0ze_aoDwrWEuB-YArrVNI(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;)Landroid/os/Vibrator;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->vibratorService_delegate$lambda$0(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;)Landroid/os/Vibrator;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$RjjpQjMoTOAMvHZwt1JKhxyjnzk(Landroid/app/Activity;Z)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeSetAutoEnterPiPModeOnBackground$lambda$9(Landroid/app/Activity;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$aiywmuEjCFTmRPTmDNeLScPhPiE(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeBuildEnvConnect$lambda$6(Landroid/app/Activity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$bfYtpT45e7oi2iTEWrnRKNmTonU(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Z)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeEnableImmersiveMode$lambda$1(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$dGH29hPQ99lmZavfDLmxl4l6ahQ(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeBuildEnvConnect$lambda$6$lambda$4(Landroid/app/Activity;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$pHg9ytAAaQZZOP493_dF4h6rkdY(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeBuildEnvConnect$lambda$6$lambda$5(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$q8M0SdbcImJs_bMmJW5zNAegnBw(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeEnterPiPMode$lambda$7(Landroid/app/Activity;)V

    return-void
.end method

.method public static synthetic $r8$lambda$srFy5d35zAyBCNobowxriY_D8Ys(Landroid/app/Activity;II)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->nativeSetPiPModeAspectRatio$lambda$8(Landroid/app/Activity;II)V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->Companion:Lorg/godotengine/godot/nativeapi/GodotNativeBridge$Companion;

    .line 70
    const-class v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "godot"    # Lorg/godotengine/godot/Godot;

    const-string v0, "godot"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    .line 74
    new-instance v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda4;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda4;-><init>(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->vibratorService$delegate:Lkotlin/Lazy;

    .line 67
    return-void
.end method

.method private final alert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    .line 113
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lorg/godotengine/godot/Godot;->alert$default(Lorg/godotengine/godot/Godot;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;ILjava/lang/Object;)V

    .line 114
    return-void
.end method

.method private final checkInternalFeatureSupport(Ljava/lang/String;)Z
    .locals 5
    .param p1, "feature"    # Ljava/lang/String;

    .line 218
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->supportsFeature(Ljava/lang/String;)Z

    move-result v0

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    .line 219
    return v2

    .line 222
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 223
    .local v3, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v3, p1}, Lorg/godotengine/godot/plugin/GodotPlugin;->supportsFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 224
    return v2

    .line 227
    .end local v3    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    :cond_3
    return v1
.end method

.method private final createNewGodotInstance([Ljava/lang/String;)I
    .locals 1
    .param p1, "args"    # [Ljava/lang/String;

    .line 271
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onNewGodotInstanceRequested([Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method private final forceQuit(I)Z
    .locals 1
    .param p1, "instanceId"    # I

    .line 116
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->forceQuit$lib_templateDebug(I)Z

    move-result v0

    return v0
.end method

.method private final getAccentColor()I
    .locals 4

    .line 157
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 158
    .local v0, "value":Landroid/util/TypedValue;
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010435

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 159
    iget v1, v0, Landroid/util/TypedValue;->data:I

    return v1
.end method

.method private final getActivity()Landroid/app/Activity;
    .locals 1

    .line 246
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method private final getBaseColor()I
    .locals 4

    .line 163
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 164
    .local v0, "value":Landroid/util/TypedValue;
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010031

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 165
    iget v1, v0, Landroid/util/TypedValue;->data:I

    return v1
.end method

.method private final getCACertificates()Ljava/lang/String;
    .locals 2

    .line 243
    invoke-static {}, Lorg/godotengine/godot/utils/GodotNetUtils;->getCACertificates()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCACertificates(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method private final getClipboard()Ljava/lang/String;
    .locals 1

    .line 250
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getClipboard()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final getGDExtensionConfigFiles()[Ljava/lang/String;
    .locals 5

    .line 234
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    .line 235
    .local v0, "configFiles":Ljava/util/Set;
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v1

    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 236
    .local v2, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v2}, Lorg/godotengine/godot/plugin/GodotPlugin;->getPluginGDExtensionLibrariesPaths()Ljava/util/Set;

    move-result-object v3

    const-string v4, "getPluginGDExtensionLibrariesPaths(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 239
    .end local v2    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    :cond_0
    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    .local v1, "$this$toTypedArray$iv":Ljava/util/Collection;
    const/4 v2, 0x0

    .line 438
    .local v2, "$i$f$toTypedArray":I
    nop

    .line 439
    move-object v3, v1

    .line 441
    .local v3, "thisCollection$iv":Ljava/util/Collection;
    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "$this$toTypedArray$iv":Ljava/util/Collection;
    .end local v2    # "$i$f$toTypedArray":I
    .end local v3    # "thisCollection$iv":Ljava/util/Collection;
    check-cast v1, [Ljava/lang/String;

    .line 239
    return-object v1
.end method

.method private final getGrantedPermissions()[Ljava/lang/String;
    .locals 1

    .line 172
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getGrantedPermissions()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final getInputFallbackMapping()Ljava/lang/String;
    .locals 1

    .line 263
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getXrMode$lib_templateDebug()Lorg/godotengine/godot/xr/XRMode;

    move-result-object v0

    iget-object v0, v0, Lorg/godotengine/godot/xr/XRMode;->inputFallbackMapping:Ljava/lang/String;

    return-object v0
.end method

.method private final getRenderView()Lorg/godotengine/godot/GodotRenderView;
    .locals 1

    .line 248
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getRenderView()Lorg/godotengine/godot/GodotRenderView;

    move-result-object v0

    return-object v0
.end method

.method private final getVibratorService()Landroid/os/Vibrator;
    .locals 1

    .line 74
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->vibratorService$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    return-object v0
.end method

.method private final hasClipboard()Z
    .locals 1

    .line 254
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->hasClipboard()Z

    move-result v0

    return v0
.end method

.method private final initInputDevices()V
    .locals 1

    .line 267
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getGodotInputHandler()Lorg/godotengine/godot/input/GodotInputHandler;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/input/GodotInputHandler;->initInputDevices()V

    .line 268
    return-void
.end method

.method private final isDarkMode()Z
    .locals 1

    .line 128
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getDarkMode$lib_templateDebug()Z

    move-result v0

    return v0
.end method

.method private final isDarkModeSupported()Z
    .locals 3

    .line 122
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    if-eqz v0, :cond_0

    iget v0, v0, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    if-nez v0, :cond_0

    move v2, v1

    :cond_0
    xor-int/lit8 v0, v2, 0x1

    return v0
.end method

.method private final isInEdgeToEdgeMode()Z
    .locals 1

    .line 106
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInEdgeToEdgeMode()Z

    move-result v0

    return v0
.end method

.method private final isInImmersiveMode()Z
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInImmersiveMode()Z

    move-result v0

    return v0
.end method

.method private final nativeBeginBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "scope"    # Ljava/lang/String;
    .param p2, "label"    # Ljava/lang/String;

    .line 275
    invoke-static {p1, p2}, Lorg/godotengine/godot/utils/BenchmarkUtils;->beginBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method

.method private final nativeBuildEnvCancel(I)V
    .locals 4
    .param p1, "jobId"    # I

    .line 376
    nop

    .line 377
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 378
    .local v0, "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lorg/godotengine/godot/BuildProvider;->buildEnvCancel(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 379
    .end local v0    # "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :catch_0
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    const-string v2, "Unable to cancel command in build environment"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 382
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void
.end method

.method private final nativeBuildEnvCleanProject(Ljava/lang/String;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)V
    .locals 4
    .param p1, "projectPath"    # Ljava/lang/String;
    .param p2, "buildDir"    # Ljava/lang/String;
    .param p3, "callback"    # Lorg/godotengine/godot/variant/Callable;

    .line 385
    nop

    .line 386
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 387
    .local v0, "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0, p1, p2, p3}, Lorg/godotengine/godot/BuildProvider;->buildEnvCleanProject(Ljava/lang/String;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 388
    .end local v0    # "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :catch_0
    move-exception v0

    .line 389
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    const-string v2, "Unable to clean project in build environment"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 391
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void
.end method

.method private final nativeBuildEnvConnect(Lorg/godotengine/godot/variant/Callable;)Z
    .locals 6
    .param p1, "callback"    # Lorg/godotengine/godot/variant/Callable;

    .line 312
    nop

    .line 313
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 314
    .local v1, "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :goto_0
    if-eqz v1, :cond_1

    invoke-interface {v1, p1}, Lorg/godotengine/godot/BuildProvider;->buildEnvConnect(Lorg/godotengine/godot/variant/Callable;)Z

    move-result v2

    goto :goto_1

    :cond_1
    move v2, v0

    .line 315
    .local v2, "success":Z
    :goto_1
    if-nez v2, :cond_3

    .line 316
    iget-object v3, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-nez v3, :cond_2

    return v0

    .line 317
    .local v3, "activity":Landroid/app/Activity;
    :cond_2
    iget-object v4, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    new-instance v5, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda7;

    invoke-direct {v5, v3}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda7;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v4, v5}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 335
    .end local v3    # "activity":Landroid/app/Activity;
    :cond_3
    return v2

    .line 336
    .end local v1    # "buildProvider":Lorg/godotengine/godot/BuildProvider;
    .end local v2    # "success":Z
    :catch_0
    move-exception v1

    .line 337
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    const-string v3, "Unable to connect to build environment"

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 338
    return v0
.end method

.method private static final nativeBuildEnvConnect$lambda$6(Landroid/app/Activity;)V
    .locals 3
    .param p0, "$activity"    # Landroid/app/Activity;

    .line 318
    new-instance v0, Landroid/app/AlertDialog$Builder;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 319
    sget v1, Lorg/godotengine/godot/R$string;->gabe_connection_error_message:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 320
    sget v1, Lorg/godotengine/godot/R$string;->gabe_connection_error_title:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 321
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 322
    sget v1, Lorg/godotengine/godot/R$string;->dialog_download:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    new-instance v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 328
    sget v1, Lorg/godotengine/godot/R$string;->dialog_cancel:I

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    new-instance v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda3;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 318
    nop

    .line 331
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 332
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 333
    return-void
.end method

.method private static final nativeBuildEnvConnect$lambda$6$lambda$4(Landroid/app/Activity;Landroid/content/DialogInterface;I)V
    .locals 4
    .param p0, "$activity"    # Landroid/app/Activity;
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    const-string p2, "dialog"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 323
    new-instance p2, Landroid/content/Intent;

    const-string v0, "https://godotengine.org/download/android#gabe"

    .local v0, "$this$toUri$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 442
    .local v1, "$i$f$toUri":I
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "Uri.parse(this)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 323
    .end local v0    # "$this$toUri$iv":Ljava/lang/String;
    .end local v1    # "$i$f$toUri":I
    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 324
    .local p2, "intent":Landroid/content/Intent;
    const/high16 v0, 0x10000000

    invoke-virtual {p2, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 325
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 326
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 327
    return-void
.end method

.method private static final nativeBuildEnvConnect$lambda$6$lambda$5(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "dialog"    # Landroid/content/DialogInterface;

    const-string p1, "dialog"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 329
    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    .line 330
    return-void
.end method

.method private final nativeBuildEnvDisconnect()V
    .locals 4

    .line 343
    nop

    .line 344
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 345
    .local v0, "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :goto_0
    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/godotengine/godot/BuildProvider;->buildEnvDisconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 346
    .end local v0    # "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :catch_0
    move-exception v0

    .line 347
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    const-string v2, "Unable to disconnect from build environment"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 349
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_1
    return-void
.end method

.method private final nativeBuildEnvExecute(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Lorg/godotengine/godot/variant/Callable;)I
    .locals 9
    .param p1, "buildTool"    # Ljava/lang/String;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "projectPath"    # Ljava/lang/String;
    .param p4, "buildDir"    # Ljava/lang/String;
    .param p5, "outputCallback"    # Lorg/godotengine/godot/variant/Callable;
    .param p6, "resultCallback"    # Lorg/godotengine/godot/variant/Callable;

    .line 359
    nop

    .line 360
    const/4 v0, -0x1

    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 361
    .local v1, "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :goto_0
    if-eqz v1, :cond_1

    .line 362
    nop

    .line 363
    nop

    .line 364
    nop

    .line 365
    nop

    .line 366
    nop

    .line 367
    nop

    .line 361
    move-object v2, v1

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-object v8, p6

    invoke-interface/range {v2 .. v8}, Lorg/godotengine/godot/BuildProvider;->buildEnvExecute(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Lorg/godotengine/godot/variant/Callable;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 368
    :cond_1
    nop

    .line 361
    :goto_1
    return v0

    .line 369
    .end local v1    # "buildProvider":Lorg/godotengine/godot/BuildProvider;
    :catch_0
    move-exception v1

    .line 370
    .local v1, "e":Ljava/lang/Exception;
    sget-object v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    const-string v3, "Unable to execute Gradle command in build environment"

    move-object v4, v1

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v2, v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 371
    return v0
.end method

.method private final nativeDumpBenchmark(Ljava/lang/String;)V
    .locals 1
    .param p1, "benchmarkFile"    # Ljava/lang/String;

    .line 283
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getFileAccessHandler()Lorg/godotengine/godot/io/file/FileAccessHandler;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->dumpBenchmark(Lorg/godotengine/godot/io/file/FileAccessHandler;Ljava/lang/String;)V

    .line 284
    return-void
.end method

.method private final nativeEnableImmersiveMode(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .line 99
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    new-instance v1, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Z)V

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 102
    return-void
.end method

.method private static final nativeEnableImmersiveMode$lambda$1(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Z)V
    .locals 4
    .param p0, "this$0"    # Lorg/godotengine/godot/nativeapi/GodotNativeBridge;
    .param p1, "$enabled"    # Z

    .line 100
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, Lorg/godotengine/godot/Godot;->enableImmersiveMode$default(Lorg/godotengine/godot/Godot;ZZILjava/lang/Object;)V

    .line 101
    return-void
.end method

.method private final nativeEndBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "scope"    # Ljava/lang/String;
    .param p2, "label"    # Ljava/lang/String;

    .line 279
    const/4 v0, 0x4

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, p2, v2, v0, v1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 280
    return-void
.end method

.method private final nativeEnterPiPMode()V
    .locals 3

    .line 410
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 411
    .local v0, "hostActivity":Landroid/app/Activity;
    instance-of v1, v0, Lorg/godotengine/godot/feature/PictureInPictureProvider;

    if-eqz v1, :cond_0

    .line 412
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    new-instance v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda1;

    invoke-direct {v2, v0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 416
    :cond_0
    return-void
.end method

.method private static final nativeEnterPiPMode$lambda$7(Landroid/app/Activity;)V
    .locals 1
    .param p0, "$hostActivity"    # Landroid/app/Activity;

    .line 413
    move-object v0, p0

    check-cast v0, Lorg/godotengine/godot/feature/PictureInPictureProvider;

    invoke-interface {v0}, Lorg/godotengine/godot/feature/PictureInPictureProvider;->enterPiPMode()V

    .line 414
    return-void
.end method

.method private final nativeIsInPiPMode()Z
    .locals 2

    .line 402
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 403
    .local v0, "hostActivity":Landroid/app/Activity;
    instance-of v1, v0, Lorg/godotengine/godot/GodotActivity;

    if-eqz v1, :cond_0

    .line 404
    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/GodotActivity;

    invoke-virtual {v1}, Lorg/godotengine/godot/GodotActivity;->isInPictureInPictureMode()Z

    move-result v1

    return v1

    .line 406
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private final nativeIsPiPModeSupported()Z
    .locals 2

    .line 394
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 395
    .local v0, "hostActivity":Landroid/app/Activity;
    instance-of v1, v0, Lorg/godotengine/godot/feature/PictureInPictureProvider;

    if-eqz v1, :cond_0

    .line 396
    move-object v1, v0

    check-cast v1, Lorg/godotengine/godot/feature/PictureInPictureProvider;

    invoke-interface {v1}, Lorg/godotengine/godot/feature/PictureInPictureProvider;->isPiPModeSupported()Z

    move-result v1

    return v1

    .line 398
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method private final nativeOnDistractionFreeModeChanged(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .line 308
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/godotengine/godot/GodotHost;->onDistractionFreeModeChanged(Ljava/lang/Boolean;)V

    .line 309
    :cond_0
    return-void
.end method

.method private final nativeOnEditorWorkspaceSelected(Ljava/lang/String;)V
    .locals 1
    .param p1, "workspace"    # Ljava/lang/String;

    .line 304
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onEditorWorkspaceSelected(Ljava/lang/String;)V

    .line 305
    :cond_0
    return-void
.end method

.method private final nativeSetAutoEnterPiPModeOnBackground(Z)V
    .locals 3
    .param p1, "autoEnterPiPOnBackground"    # Z

    .line 428
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 429
    .local v0, "hostActivity":Landroid/app/Activity;
    instance-of v1, v0, Lorg/godotengine/godot/GodotActivity;

    if-eqz v1, :cond_0

    .line 430
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    new-instance v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda5;

    invoke-direct {v2, v0, p1}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda5;-><init>(Landroid/app/Activity;Z)V

    invoke-virtual {v1, v2}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 434
    :cond_0
    return-void
.end method

.method private static final nativeSetAutoEnterPiPModeOnBackground$lambda$9(Landroid/app/Activity;Z)V
    .locals 3
    .param p0, "$hostActivity"    # Landroid/app/Activity;
    .param p1, "$autoEnterPiPOnBackground"    # Z

    .line 431
    move-object v0, p0

    check-cast v0, Lorg/godotengine/godot/GodotActivity;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, p1, v1, v2, v1}, Lorg/godotengine/godot/GodotActivity;->updatePiPParams$default(Lorg/godotengine/godot/GodotActivity;ZLandroid/util/Rational;ILjava/lang/Object;)V

    .line 432
    return-void
.end method

.method private final nativeSetPiPModeAspectRatio(II)V
    .locals 3
    .param p1, "numerator"    # I
    .param p2, "denominator"    # I

    .line 419
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 420
    .local v0, "hostActivity":Landroid/app/Activity;
    instance-of v1, v0, Lorg/godotengine/godot/GodotActivity;

    if-eqz v1, :cond_0

    .line 421
    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    new-instance v2, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda6;

    invoke-direct {v2, v0, p1, p2}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge$$ExternalSyntheticLambda6;-><init>(Landroid/app/Activity;II)V

    invoke-virtual {v1, v2}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 425
    :cond_0
    return-void
.end method

.method private static final nativeSetPiPModeAspectRatio$lambda$8(Landroid/app/Activity;II)V
    .locals 5
    .param p0, "$hostActivity"    # Landroid/app/Activity;
    .param p1, "$numerator"    # I
    .param p2, "$denominator"    # I

    .line 422
    move-object v0, p0

    check-cast v0, Lorg/godotengine/godot/GodotActivity;

    new-instance v1, Landroid/util/Rational;

    invoke-direct {v1, p1, p2}, Landroid/util/Rational;-><init>(II)V

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Lorg/godotengine/godot/GodotActivity;->updatePiPParams$default(Lorg/godotengine/godot/GodotActivity;ZLandroid/util/Rational;ILjava/lang/Object;)V

    .line 423
    return-void
.end method

.method private final nativeSignApk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .param p1, "inputPath"    # Ljava/lang/String;
    .param p2, "outputPath"    # Ljava/lang/String;
    .param p3, "keystorePath"    # Ljava/lang/String;
    .param p4, "keystoreUser"    # Ljava/lang/String;
    .param p5, "keystorePassword"    # Ljava/lang/String;

    .line 293
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v1

    if-eqz v1, :cond_0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v1 .. v6}, Lorg/godotengine/godot/GodotHost;->signApk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/godotengine/godot/error/Error;

    move-result-object v0

    if-nez v0, :cond_1

    .line 294
    :cond_0
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    .line 293
    :cond_1
    nop

    .line 295
    .local v0, "signResult":Lorg/godotengine/godot/error/Error;
    invoke-virtual {v0}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v1

    return v1
.end method

.method private final nativeVerifyApk(Ljava/lang/String;)I
    .locals 2
    .param p1, "apkPath"    # Ljava/lang/String;

    .line 299
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->verifyApk(Ljava/lang/String;)Lorg/godotengine/godot/error/Error;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    .line 300
    .local v0, "verifyResult":Lorg/godotengine/godot/error/Error;
    :cond_1
    invoke-virtual {v0}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v1

    return v1
.end method

.method private final onGodotMainLoopStarted()V
    .locals 1

    .line 87
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->onGodotMainLoopStarted$lib_templateDebug()V

    .line 88
    return-void
.end method

.method private final onGodotSetupCompleted()V
    .locals 1

    .line 80
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->onGodotSetupCompleted$lib_templateDebug()V

    .line 81
    return-void
.end method

.method private final onGodotTerminating()V
    .locals 1

    .line 93
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->onGodotTerminating$lib_templateDebug()V

    return-void
.end method

.method private final requestPermission(Ljava/lang/String;)Z
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .line 168
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->requestPermission(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private final requestPermissions()Z
    .locals 1

    .line 170
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->requestPermissions()Z

    move-result v0

    return v0
.end method

.method private final restart()V
    .locals 2

    .line 110
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-interface {v0, v1}, Lorg/godotengine/godot/GodotHost;->onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V

    :cond_0
    return-void
.end method

.method private final setClipboard(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 252
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->setClipboard(Ljava/lang/String;)V

    return-void
.end method

.method private final setKeepScreenOn(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 108
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->setKeepScreenOn$lib_templateDebug(Z)V

    return-void
.end method

.method private final setWindowColor(Ljava/lang/String;)V
    .locals 1
    .param p1, "color"    # Ljava/lang/String;

    .line 256
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->setWindowColor(Ljava/lang/String;)V

    return-void
.end method

.method private final showDialog(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "buttons"    # [Ljava/lang/String;

    .line 142
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 437
    .local v0, "it":Landroid/app/Activity;
    const/4 v1, 0x0

    .line 142
    .local v1, "$i$a$-let-GodotNativeBridge$showDialog$1":I
    sget-object v2, Lorg/godotengine/godot/utils/DialogUtils;->Companion:Lorg/godotengine/godot/utils/DialogUtils$Companion;

    invoke-virtual {v2, v0, p1, p2, p3}, Lorg/godotengine/godot/utils/DialogUtils$Companion;->showDialog$lib_templateDebug(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 143
    .end local v0    # "it":Landroid/app/Activity;
    .end local v1    # "$i$a$-let-GodotNativeBridge$showDialog$1":I
    :cond_0
    return-void
.end method

.method private final showFilePicker(Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 7
    .param p1, "currentDirectory"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "fileMode"    # I
    .param p4, "filters"    # [Ljava/lang/String;

    .line 131
    sget-object v0, Lorg/godotengine/godot/io/FilePicker;->Companion:Lorg/godotengine/godot/io/FilePicker$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v2}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lorg/godotengine/godot/io/FilePicker$Companion;->showFilePicker(Landroid/content/Context;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V

    .line 132
    return-void
.end method

.method private final showInputDialog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "existingText"    # Ljava/lang/String;

    .line 153
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 437
    .local v0, "it":Landroid/app/Activity;
    const/4 v1, 0x0

    .line 153
    .local v1, "$i$a$-let-GodotNativeBridge$showInputDialog$1":I
    sget-object v2, Lorg/godotengine/godot/utils/DialogUtils;->Companion:Lorg/godotengine/godot/utils/DialogUtils$Companion;

    invoke-virtual {v2, v0, p1, p2, p3}, Lorg/godotengine/godot/utils/DialogUtils$Companion;->showInputDialog$lib_templateDebug(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .end local v0    # "it":Landroid/app/Activity;
    .end local v1    # "$i$a$-let-GodotNativeBridge$showInputDialog$1":I
    :cond_0
    return-void
.end method

.method private final vibrate(II)V
    .locals 4
    .param p1, "durationMs"    # I
    .param p2, "amplitude"    # I

    .line 180
    if-lez p1, :cond_2

    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    const-string v1, "VIBRATE"

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/Godot;->requestPermission(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 181
    nop

    .line 182
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    .line 183
    const/4 v0, -0x1

    if-gt p2, v0, :cond_0

    .line 184
    invoke-direct {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->getVibratorService()Landroid/os/Vibrator;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 186
    int-to-long v2, p1

    .line 187
    nop

    .line 185
    invoke-static {v2, v3, v0}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object v0

    .line 184
    invoke-virtual {v1, v0}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 191
    :cond_0
    invoke-direct {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->getVibratorService()Landroid/os/Vibrator;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 193
    int-to-long v1, p1

    .line 194
    nop

    .line 192
    invoke-static {v1, v2, p2}, Landroid/os/VibrationEffect;->createOneShot(JI)Landroid/os/VibrationEffect;

    move-result-object v1

    .line 191
    invoke-virtual {v0, v1}, Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V

    goto :goto_0

    .line 200
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->getVibratorService()Landroid/os/Vibrator;

    move-result-object v0

    if-eqz v0, :cond_2

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 202
    :catch_0
    move-exception v0

    .line 204
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v1, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->TAG:Ljava/lang/String;

    .line 205
    nop

    .line 203
    const-string v2, "SecurityException: VIBRATE permission not found. Make sure it is declared in the manifest or enabled in the export preset."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_2
    :goto_0
    return-void
.end method

.method private static final vibratorService_delegate$lambda$0(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;)Landroid/os/Vibrator;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

    .line 74
    iget-object v0, p0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/os/Vibrator;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/os/Vibrator;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
