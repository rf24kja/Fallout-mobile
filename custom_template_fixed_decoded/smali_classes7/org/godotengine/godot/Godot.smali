.class public final Lorg/godotengine/godot/Godot;
.super Ljava/lang/Object;
.source "Godot.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/Godot$Companion;,
        Lorg/godotengine/godot/Godot$RunStatus;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nGodot.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Godot.kt\norg/godotengine/godot/Godot\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 3 Color.kt\nandroidx/core/graphics/ColorKt\n*L\n1#1,1067:1\n37#2:1068\n36#2,3:1069\n432#3:1072\n*S KotlinDebug\n*F\n+ 1 Godot.kt\norg/godotengine/godot/Godot\n*L\n338#1:1068\n338#1:1069,3\n473#1:1072\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0094\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0010\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0013\n\u0002\u0018\u0002\n\u0002\u0008\u0018\u0018\u0000 \u00db\u00012\u00020\u0001:\u0004\u00db\u0001\u00dc\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\t\u0010\u0081\u0001\u001a\u00020.H\u0002J\u0007\u0010\u0082\u0001\u001a\u00020.J\n\u0010\u0083\u0001\u001a\u0005\u0018\u00010\u0084\u0001J5\u0010\u0085\u0001\u001a\u00020.2\t\u0010\u0086\u0001\u001a\u0004\u0018\u00010Q2\u000e\u0010\u0087\u0001\u001a\t\u0012\u0004\u0012\u00020I0\u0088\u00012\u0011\u0008\u0002\u0010\u0089\u0001\u001a\n\u0012\u0005\u0012\u00030\u008b\u00010\u008a\u0001J\u001e\u0010\u008c\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u008e\u0001\u001a\u00020.2\t\u0008\u0002\u0010\u008f\u0001\u001a\u00020.H\u0007J\t\u0010\u0090\u0001\u001a\u00020pH\u0002J\u001e\u0010\u0091\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u008e\u0001\u001a\u00020.2\t\u0008\u0002\u0010\u008f\u0001\u001a\u00020.H\u0007J\u0007\u0010\u0092\u0001\u001a\u00020.J\u0007\u0010\u0093\u0001\u001a\u00020.J\u0008\u0010\u0094\u0001\u001a\u00030\u008d\u0001J\u0013\u0010\u0095\u0001\u001a\u00020p2\u0008\u0010\u0096\u0001\u001a\u00030\u0097\u0001H\u0002J\u0011\u0010\u0098\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u0099\u0001\u001a\u00020IJ\u001f\u0010\u009a\u0001\u001a\u0004\u0018\u00010v2\u0007\u0010\u0086\u0001\u001a\u00020Q2\t\u0008\u0002\u0010\u009b\u0001\u001a\u00020vH\u0007J\u0011\u0010\u009c\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u0086\u0001\u001a\u00020QJ\u0011\u0010\u009d\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u0086\u0001\u001a\u00020QJ\n\u0010\u009e\u0001\u001a\u00030\u008d\u0001H\u0002J\u0019\u0010\u009f\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00a0\u0001\u001a\u00020.H\u0000\u00a2\u0006\u0003\u0008\u00a1\u0001J\u0011\u0010\u00a2\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u0086\u0001\u001a\u00020QJ\u0011\u0010\u00a3\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u0086\u0001\u001a\u00020QJ\u0010\u0010\u00a4\u0001\u001a\u00030\u008d\u00012\u0006\u0010P\u001a\u00020QJ\u0012\u0010\u00a5\u0001\u001a\u00030\u008d\u00012\u0008\u0010\u00a6\u0001\u001a\u00030\u00a7\u0001J&\u0010\u00a8\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00a9\u0001\u001a\u00020p2\u0007\u0010\u00aa\u0001\u001a\u00020p2\n\u0010\u00ab\u0001\u001a\u0005\u0018\u00010\u00ac\u0001J3\u0010\u00ad\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00a9\u0001\u001a\u00020p2\u0010\u0010\u00ae\u0001\u001a\u000b\u0012\u0006\u0012\u0004\u0018\u00010I0\u00af\u00012\u0008\u0010\u00b0\u0001\u001a\u00030\u00b1\u0001\u00a2\u0006\u0003\u0010\u00b2\u0001J\u0010\u0010\u00b3\u0001\u001a\u00030\u008d\u0001H\u0000\u00a2\u0006\u0003\u0008\u00b4\u0001J\u0010\u0010\u00b5\u0001\u001a\u00030\u008d\u0001H\u0000\u00a2\u0006\u0003\u0008\u00b6\u0001J\u0010\u0010\u00b7\u0001\u001a\u00030\u008d\u0001H\u0000\u00a2\u0006\u0003\u0008\u00b8\u0001J)\u0010\u00b9\u0001\u001a\u00030\u008d\u00012\t\u0008\u0001\u0010\u00ba\u0001\u001a\u00020p2\t\u0008\u0001\u0010\u00bb\u0001\u001a\u00020p2\t\u0010\u00bc\u0001\u001a\u0004\u0018\u00010LJ)\u0010\u00b9\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00bd\u0001\u001a\u00020I2\u0007\u0010\u00be\u0001\u001a\u00020I2\u000b\u0008\u0002\u0010\u00bc\u0001\u001a\u0004\u0018\u00010LH\u0007J\u0011\u0010\u00bf\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00c0\u0001\u001a\u00020LJ\u0011\u0010\u00c1\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u00c0\u0001\u001a\u00020LJ\t\u0010\u00c2\u0001\u001a\u00020IH\u0002J\u0015\u0010\u00c3\u0001\u001a\u00020.2\n\u0010\u00c4\u0001\u001a\u0005\u0018\u00010\u00c5\u0001H\u0002J\u0019\u0010\u00c6\u0001\u001a\u00030\u008d\u00012\u0007\u0010\u008e\u0001\u001a\u00020.H\u0000\u00a2\u0006\u0003\u0008\u00c7\u0001J\t\u0010\u00c8\u0001\u001a\u00020.H\u0007J\t\u0010\u00c9\u0001\u001a\u00020IH\u0007J\u0015\u0010\u00ca\u0001\u001a\u00030\u008d\u00012\t\u0010\u00cb\u0001\u001a\u0004\u0018\u00010IH\u0007J\u0017\u0010\u00cc\u0001\u001a\u00030\u008d\u00012\u000b\u0008\u0002\u0010\u00cd\u0001\u001a\u0004\u0018\u00010LH\u0007J\u0018\u0010\u00ce\u0001\u001a\u00020.2\u0007\u0010\u00cf\u0001\u001a\u00020pH\u0000\u00a2\u0006\u0003\u0008\u00d0\u0001J\u0008\u0010\u00d1\u0001\u001a\u00030\u008d\u0001J\u0012\u0010\u00d2\u0001\u001a\u00020.2\t\u0010\u00d3\u0001\u001a\u0004\u0018\u00010IJ\u0007\u0010\u00d4\u0001\u001a\u00020.J\u0018\u0010\u00d5\u0001\u001a\r\u0012\u0006\u0012\u0004\u0018\u00010I\u0018\u00010\u00af\u0001\u00a2\u0006\u0003\u0010\u00d6\u0001J\u0007\u0010\u00d7\u0001\u001a\u00020.J\u0007\u0010\u00d8\u0001\u001a\u00020.J\u0010\u0010\u00d9\u0001\u001a\u00020.2\u0007\u0010\u00da\u0001\u001a\u00020IR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\n\u001a\u0004\u0018\u00010\u000b8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u000c\u0010\rR\u001d\u0010\u0010\u001a\u0004\u0018\u00010\u00118BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u000f\u001a\u0004\u0008\u0012\u0010\u0013R\u001b\u0010\u0015\u001a\u00020\u00168@X\u0080\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0019\u0010\u000f\u001a\u0004\u0008\u0017\u0010\u0018R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\u001c\u001a\u0004\u0018\u00010\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008 \u0010\u000f\u001a\u0004\u0008\u001e\u0010\u001fR\u000e\u0010!\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010\"\u001a\u0004\u0018\u00010\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008$\u0010\u000f\u001a\u0004\u0008#\u0010\u001fR\u000e\u0010%\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010&\u001a\u0004\u0018\u00010\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008(\u0010\u000f\u001a\u0004\u0008\'\u0010\u001fR\u000e\u0010)\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001d\u0010*\u001a\u0004\u0018\u00010\u001d8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008,\u0010\u000f\u001a\u0004\u0008+\u0010\u001fR\u001b\u0010-\u001a\u00020.8FX\u0086\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00080\u0010\u000f\u001a\u0004\u0008-\u0010/R\u0011\u00101\u001a\u000202\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00083\u00104R\u0011\u00105\u001a\u000206\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00087\u00108R\u0011\u00109\u001a\u00020:\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008;\u0010<R\u0011\u0010=\u001a\u00020>\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008?\u0010@R\u0011\u0010A\u001a\u00020B\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008C\u0010DR\u001c\u0010E\u001a\u0010\u0012\u000c\u0012\n G*\u0004\u0018\u00010.0.0FX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010H\u001a\u0010\u0012\u000c\u0012\n G*\u0004\u0018\u00010I0I0FX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010J\u001a\u0008\u0012\u0004\u0012\u00020L0KX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010M\u001a\u00020.X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010N\u001a\u00020.X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010O\u001a\u00020.X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010P\u001a\u0004\u0018\u00010QX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008R\u0010S\"\u0004\u0008T\u0010UR\u000e\u0010V\u001a\u00020.X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010W\u001a\u0008\u0012\u0004\u0012\u00020X0KX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010Y\u001a\u00020X8F\u00a2\u0006\u0006\u001a\u0004\u0008Z\u0010[R\u0011\u0010\\\u001a\u00020]\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008^\u0010_R\u0014\u0010`\u001a\u0008\u0012\u0004\u0012\u00020I0aX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010b\u001a\u00020cX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008d\u0010e\"\u0004\u0008f\u0010gR\u000e\u0010h\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010i\u001a\u00020\u001bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010j\u001a\u00020.X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010k\u001a\u00020.X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008l\u0010/\"\u0004\u0008m\u0010nR\u000e\u0010o\u001a\u00020pX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010q\u001a\u00020pX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001e\u0010s\u001a\u00020.2\u0006\u0010r\u001a\u00020.@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008t\u0010/R\u001c\u0010u\u001a\u0004\u0018\u00010vX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008w\u0010x\"\u0004\u0008y\u0010zR\u001d\u0010{\u001a\u0004\u0018\u00010|X\u0086\u000e\u00a2\u0006\u000f\n\u0000\u001a\u0004\u0008}\u0010~\"\u0005\u0008\u007f\u0010\u0080\u0001\u00a8\u0006\u00dd\u0001"
    }
    d2 = {
        "Lorg/godotengine/godot/Godot;",
        "",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "getContext",
        "()Landroid/content/Context;",
        "godotNativeBridge",
        "Lorg/godotengine/godot/nativeapi/GodotNativeBridge;",
        "mSensorManager",
        "Landroid/hardware/SensorManager;",
        "getMSensorManager",
        "()Landroid/hardware/SensorManager;",
        "mSensorManager$delegate",
        "Lkotlin/Lazy;",
        "mClipboard",
        "Landroid/content/ClipboardManager;",
        "getMClipboard",
        "()Landroid/content/ClipboardManager;",
        "mClipboard$delegate",
        "pluginRegistry",
        "Lorg/godotengine/godot/plugin/GodotPluginRegistry;",
        "getPluginRegistry$lib_templateDebug",
        "()Lorg/godotengine/godot/plugin/GodotPluginRegistry;",
        "pluginRegistry$delegate",
        "accelerometerEnabled",
        "Ljava/util/concurrent/atomic/AtomicBoolean;",
        "mAccelerometer",
        "Landroid/hardware/Sensor;",
        "getMAccelerometer",
        "()Landroid/hardware/Sensor;",
        "mAccelerometer$delegate",
        "gravityEnabled",
        "mGravity",
        "getMGravity",
        "mGravity$delegate",
        "magnetometerEnabled",
        "mMagnetometer",
        "getMMagnetometer",
        "mMagnetometer$delegate",
        "gyroscopeEnabled",
        "mGyroscope",
        "getMGyroscope",
        "mGyroscope$delegate",
        "isXrRuntime",
        "",
        "()Z",
        "isXrRuntime$delegate",
        "tts",
        "Lorg/godotengine/godot/tts/GodotTTS;",
        "getTts",
        "()Lorg/godotengine/godot/tts/GodotTTS;",
        "directoryAccessHandler",
        "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;",
        "getDirectoryAccessHandler",
        "()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;",
        "fileAccessHandler",
        "Lorg/godotengine/godot/io/file/FileAccessHandler;",
        "getFileAccessHandler",
        "()Lorg/godotengine/godot/io/file/FileAccessHandler;",
        "netUtils",
        "Lorg/godotengine/godot/utils/GodotNetUtils;",
        "getNetUtils",
        "()Lorg/godotengine/godot/utils/GodotNetUtils;",
        "godotInputHandler",
        "Lorg/godotengine/godot/input/GodotInputHandler;",
        "getGodotInputHandler",
        "()Lorg/godotengine/godot/input/GodotInputHandler;",
        "hasClipboardCallable",
        "Ljava/util/concurrent/Callable;",
        "kotlin.jvm.PlatformType",
        "getClipboardCallable",
        "",
        "runOnTerminate",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Ljava/lang/Runnable;",
        "nativeLayerInitializeCompleted",
        "nativeLayerSetupCompleted",
        "renderViewInitialized",
        "primaryHost",
        "Lorg/godotengine/godot/GodotHost;",
        "getPrimaryHost$lib_templateDebug",
        "()Lorg/godotengine/godot/GodotHost;",
        "setPrimaryHost$lib_templateDebug",
        "(Lorg/godotengine/godot/GodotHost;)V",
        "resumed",
        "_runStatus",
        "Lorg/godotengine/godot/Godot$RunStatus;",
        "runStatus",
        "getRunStatus",
        "()Lorg/godotengine/godot/Godot$RunStatus;",
        "io",
        "Lorg/godotengine/godot/GodotIO;",
        "getIo",
        "()Lorg/godotengine/godot/GodotIO;",
        "commandLine",
        "",
        "xrMode",
        "Lorg/godotengine/godot/xr/XRMode;",
        "getXrMode$lib_templateDebug",
        "()Lorg/godotengine/godot/xr/XRMode;",
        "setXrMode$lib_templateDebug",
        "(Lorg/godotengine/godot/xr/XRMode;)V",
        "useImmersive",
        "isEdgeToEdge",
        "useDebugOpengl",
        "darkMode",
        "getDarkMode$lib_templateDebug",
        "setDarkMode$lib_templateDebug",
        "(Z)V",
        "backgroundColor",
        "",
        "orientation",
        "value",
        "disableGodotSplash",
        "getDisableGodotSplash",
        "containerLayout",
        "Landroid/widget/FrameLayout;",
        "getContainerLayout$lib_templateDebug",
        "()Landroid/widget/FrameLayout;",
        "setContainerLayout$lib_templateDebug",
        "(Landroid/widget/FrameLayout;)V",
        "renderView",
        "Lorg/godotengine/godot/GodotRenderView;",
        "getRenderView",
        "()Lorg/godotengine/godot/GodotRenderView;",
        "setRenderView",
        "(Lorg/godotengine/godot/GodotRenderView;)V",
        "isNativeInitialized",
        "isInitialized",
        "getActivity",
        "Landroid/app/Activity;",
        "initEngine",
        "host",
        "commandLineParams",
        "",
        "hostPlugins",
        "",
        "Lorg/godotengine/godot/plugin/GodotPlugin;",
        "enableEdgeToEdge",
        "",
        "enabled",
        "override",
        "getInsetType",
        "enableImmersiveMode",
        "isInImmersiveMode",
        "isInEdgeToEdgeMode",
        "setSystemBarsAppearance",
        "getWindowBackgroundColor",
        "window",
        "Landroid/view/Window;",
        "setWindowColor",
        "colorStr",
        "onInitRenderView",
        "providedContainerLayout",
        "onStart",
        "onResume",
        "registerSensorsIfNeeded",
        "onPictureInPictureModeChanged",
        "isInPictureInPictureMode",
        "onPictureInPictureModeChanged$lib_templateDebug",
        "onPause",
        "onStop",
        "onDestroy",
        "onConfigurationChanged",
        "newConfig",
        "Landroid/content/res/Configuration;",
        "onActivityResult",
        "requestCode",
        "resultCode",
        "data",
        "Landroid/content/Intent;",
        "onRequestPermissionsResult",
        "permissions",
        "",
        "grantResults",
        "",
        "(I[Ljava/lang/String;[I)V",
        "onGodotSetupCompleted",
        "onGodotSetupCompleted$lib_templateDebug",
        "onGodotMainLoopStarted",
        "onGodotMainLoopStarted$lib_templateDebug",
        "onGodotTerminating",
        "onGodotTerminating$lib_templateDebug",
        "alert",
        "messageResId",
        "titleResId",
        "okCallback",
        "message",
        "title",
        "runOnRenderThread",
        "action",
        "runOnHostThread",
        "getNativeRenderer",
        "meetsVulkanRequirements",
        "packageManager",
        "Landroid/content/pm/PackageManager;",
        "setKeepScreenOn",
        "setKeepScreenOn$lib_templateDebug",
        "hasClipboard",
        "getClipboard",
        "setClipboard",
        "text",
        "destroyAndKillProcess",
        "destroyRunnable",
        "forceQuit",
        "instanceId",
        "forceQuit$lib_templateDebug",
        "onBackPressed",
        "requestPermission",
        "name",
        "requestPermissions",
        "getGrantedPermissions",
        "()[Ljava/lang/String;",
        "isEditorHint",
        "isProjectManagerHint",
        "hasFeature",
        "feature",
        "Companion",
        "RunStatus",
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
.field public static final Companion:Lorg/godotengine/godot/Godot$Companion;

.field private static final EDITOR_FLAVOR:Ljava/lang/String; = "editor"

.field private static final EXIT_RENDERER_TIMEOUT_IN_MS:J = 0x5dcL

.field private static volatile INSTANCE:Lorg/godotengine/godot/Godot; = null

.field private static final TAG:Ljava/lang/String;

.field private static final TEMPLATE_FLAVOR:Ljava/lang/String; = "template"


# instance fields
.field private final _runStatus:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/godotengine/godot/Godot$RunStatus;",
            ">;"
        }
    .end annotation
.end field

.field private final accelerometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private backgroundColor:I

.field private commandLine:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private containerLayout:Landroid/widget/FrameLayout;

.field private final context:Landroid/content/Context;

.field private darkMode:Z

.field private final directoryAccessHandler:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

.field private disableGodotSplash:Z

.field private final fileAccessHandler:Lorg/godotengine/godot/io/file/FileAccessHandler;

.field private final getClipboardCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

.field private final godotNativeBridge:Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

.field private final gravityEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final gyroscopeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final hasClipboardCallable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final io:Lorg/godotengine/godot/GodotIO;

.field private final isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final isXrRuntime$delegate:Lkotlin/Lazy;

.field private final mAccelerometer$delegate:Lkotlin/Lazy;

.field private final mClipboard$delegate:Lkotlin/Lazy;

.field private final mGravity$delegate:Lkotlin/Lazy;

.field private final mGyroscope$delegate:Lkotlin/Lazy;

.field private final mMagnetometer$delegate:Lkotlin/Lazy;

.field private final mSensorManager$delegate:Lkotlin/Lazy;

.field private final magnetometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private nativeLayerInitializeCompleted:Z

.field private nativeLayerSetupCompleted:Z

.field private final netUtils:Lorg/godotengine/godot/utils/GodotNetUtils;

.field private orientation:I

.field private final pluginRegistry$delegate:Lkotlin/Lazy;

.field private primaryHost:Lorg/godotengine/godot/GodotHost;

.field private renderView:Lorg/godotengine/godot/GodotRenderView;

.field private renderViewInitialized:Z

.field private resumed:Z

.field private final runOnTerminate:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final tts:Lorg/godotengine/godot/tts/GodotTTS;

.field private useDebugOpengl:Z

.field private final useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private xrMode:Lorg/godotengine/godot/xr/XRMode;


# direct methods
.method public static synthetic $r8$lambda$-yBiLfBPnuBiy0AGZvOtNI6yk2U(Landroid/view/View;ILorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/Godot;->setWindowColor$lambda$12(Landroid/view/View;ILorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$2xxfrAl7lHqoXW0Zmlq9rmq69ok(Lorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->onGodotMainLoopStarted$lambda$22(Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$5Grypyd5fZh11t8OXbr8IIv78PI(Lorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->onConfigurationChanged$lambda$17(Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$C8thkxPutRDJ2XLKz9rmJZ3KTjo(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mGyroscope_delegate$lambda$6(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$G8s9Xzhr_NLp2dRW5AuA2966lns(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mAccelerometer_delegate$lambda$3(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$G9kyT8Gjs5412jUpgA9G_TP1FSA(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mGravity_delegate$lambda$4(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$JCTWNqH5NmSniJH-bC-2yaS9gxk(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->alert$lambda$24(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic $r8$lambda$KCRLsPw1tV_kOV90o0IuDB-xzAQ(Lorg/godotengine/godot/Godot;ZZZZLjava/lang/String;)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lorg/godotengine/godot/Godot;->onGodotSetupCompleted$lambda$21(Lorg/godotengine/godot/Godot;ZZZZLjava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$M6oHYsJwcSDz7EFPofK2qx0e9RU()V
    .locals 0

    invoke-static {}, Lorg/godotengine/godot/Godot;->onBackPressed$lambda$29()V

    return-void
.end method

.method public static synthetic $r8$lambda$VkZd8-7BRzfXI3UcomoBACs2h-k(Lorg/godotengine/godot/Godot;)Landroid/hardware/SensorManager;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mSensorManager_delegate$lambda$0(Lorg/godotengine/godot/Godot;)Landroid/hardware/SensorManager;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$W0Kpej5z7OeEvZ7Wk6j1b9GjdWQ(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/Godot;->alert$lambda$24$lambda$23(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic $r8$lambda$X3qGhq8enjSbXUMinQU7k3hDwpY(Z)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->onPictureInPictureModeChanged$lambda$15(Z)V

    return-void
.end method

.method public static synthetic $r8$lambda$XxfgZ8BcCBdO3NPCMo7UnM7AG6o()V
    .locals 0

    invoke-static {}, Lorg/godotengine/godot/Godot;->onConfigurationChanged$lambda$16()V

    return-void
.end method

.method public static synthetic $r8$lambda$YHLVVs16DvhIXpsbh-tifLkNZC4(Lorg/godotengine/godot/Godot;IILandroid/content/Intent;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->onActivityResult$lambda$18(Lorg/godotengine/godot/Godot;IILandroid/content/Intent;)V

    return-void
.end method

.method public static synthetic $r8$lambda$YyZSVyVYgzfnVTUKyRMZblZU6x0(Lorg/godotengine/godot/Godot;Landroidx/core/view/WindowInsetsCompat;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/Godot;->enableEdgeToEdge$lambda$11$lambda$10(Lorg/godotengine/godot/Godot;Landroidx/core/view/WindowInsetsCompat;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic $r8$lambda$_u92LbS1r54iONIqPPYuZEJAHao([Ljava/lang/String;[I)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/Godot;->onRequestPermissionsResult$lambda$19([Ljava/lang/String;[I)V

    return-void
.end method

.method public static synthetic $r8$lambda$d2B-g7NwqXfxynkoycMTE2ynWUo(Lorg/godotengine/godot/Godot;)Z
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->isXrRuntime_delegate$lambda$7(Lorg/godotengine/godot/Godot;)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$eqe4mNHkaNeu9m-ZhxDLtKVC8JE(ZLorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/Godot;->setKeepScreenOn$lambda$25(ZLorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$et917AQ9OrSKx_-VRB44dvpexC8(Lorg/godotengine/godot/Godot;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/Godot;->setClipboard$lambda$26(Lorg/godotengine/godot/Godot;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic $r8$lambda$foMEKg-radu5zXEmg0cyfjwUf2g(Lorg/godotengine/godot/Godot;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->onInitRenderView$lambda$14(Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static synthetic $r8$lambda$hP24lfo6y13zGNYZa8_OH0B8M_Y()Lorg/godotengine/godot/plugin/GodotPluginRegistry;
    .locals 1

    invoke-static {}, Lorg/godotengine/godot/Godot;->pluginRegistry_delegate$lambda$2()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic $r8$lambda$jkgBAkiDEqpBevd9ZyV19G0D2hI(Lorg/godotengine/godot/Godot;)Ljava/lang/Boolean;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->hasClipboardCallable$lambda$8(Lorg/godotengine/godot/Godot;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$qm7ofWCiS7_LpAgIj4ROc-znWvE(Lorg/godotengine/godot/Godot;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/godotengine/godot/Godot;->enableEdgeToEdge$lambda$11(Lorg/godotengine/godot/Godot;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$rSj5vaHW0yJINFm74cGBfUHT54M(Lorg/godotengine/godot/Godot;)Landroid/content/ClipboardManager;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mClipboard_delegate$lambda$1(Lorg/godotengine/godot/Godot;)Landroid/content/ClipboardManager;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$vwmZldHycf-sO2BfZ3JEOchCE5M(Lorg/godotengine/godot/Godot;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->getClipboardCallable$lambda$9(Lorg/godotengine/godot/Godot;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$yUAox2H-P6M9MpjiS7Xkqci2MLM(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/godotengine/godot/Godot;->destroyAndKillProcess$lambda$27(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;)V

    return-void
.end method

.method public static synthetic $r8$lambda$zm7FmVQNO0rAxMgbrSaikW_gjh0(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/Godot;->mMagnetometer_delegate$lambda$5(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/Godot$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/Godot$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    .line 91
    const-class v0, Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    .line 128
    new-instance v0, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/nativeapi/GodotNativeBridge;-><init>(Lorg/godotengine/godot/Godot;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->godotNativeBridge:Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

    .line 130
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda20;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda20;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mSensorManager$delegate:Lkotlin/Lazy;

    .line 131
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda21;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda21;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mClipboard$delegate:Lkotlin/Lazy;

    .line 132
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda22;

    invoke-direct {v0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda22;-><init>()V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->pluginRegistry$delegate:Lkotlin/Lazy;

    .line 134
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->accelerometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 135
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda23;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda23;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mAccelerometer$delegate:Lkotlin/Lazy;

    .line 137
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->gravityEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 138
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda24;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda24;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mGravity$delegate:Lkotlin/Lazy;

    .line 140
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->magnetometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 141
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda25;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda25;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mMagnetometer$delegate:Lkotlin/Lazy;

    .line 143
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->gyroscopeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 144
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda26;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda26;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->mGyroscope$delegate:Lkotlin/Lazy;

    .line 146
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->isXrRuntime$delegate:Lkotlin/Lazy;

    .line 148
    new-instance v0, Lorg/godotengine/godot/tts/GodotTTS;

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lorg/godotengine/godot/tts/GodotTTS;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->tts:Lorg/godotengine/godot/tts/GodotTTS;

    .line 149
    new-instance v0, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->directoryAccessHandler:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    .line 150
    new-instance v0, Lorg/godotengine/godot/io/file/FileAccessHandler;

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lorg/godotengine/godot/io/file/FileAccessHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->fileAccessHandler:Lorg/godotengine/godot/io/file/FileAccessHandler;

    .line 151
    new-instance v0, Lorg/godotengine/godot/utils/GodotNetUtils;

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lorg/godotengine/godot/utils/GodotNetUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->netUtils:Lorg/godotengine/godot/utils/GodotNetUtils;

    .line 152
    new-instance v0, Lorg/godotengine/godot/input/GodotInputHandler;

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v0, v2, p0}, Lorg/godotengine/godot/input/GodotInputHandler;-><init>(Landroid/content/Context;Lorg/godotengine/godot/Godot;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    .line 154
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda2;-><init>(Lorg/godotengine/godot/Godot;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->hasClipboardCallable:Ljava/util/concurrent/Callable;

    .line 158
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda3;-><init>(Lorg/godotengine/godot/Godot;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->getClipboardCallable:Ljava/util/concurrent/Callable;

    .line 167
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->runOnTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    .line 194
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v2, Lorg/godotengine/godot/Godot$RunStatus;->INITIALIZING:Lorg/godotengine/godot/Godot$RunStatus;

    invoke-direct {v0, v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->_runStatus:Ljava/util/concurrent/atomic/AtomicReference;

    .line 198
    new-instance v0, Lorg/godotengine/godot/GodotIO;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/GodotIO;-><init>(Lorg/godotengine/godot/Godot;)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->io:Lorg/godotengine/godot/GodotIO;

    .line 200
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    .line 201
    sget-object v0, Lorg/godotengine/godot/xr/XRMode;->REGULAR:Lorg/godotengine/godot/xr/XRMode;

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    .line 202
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 203
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 206
    const/high16 v0, -0x1000000

    iput v0, p0, Lorg/godotengine/godot/Godot;->backgroundColor:I

    .line 88
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1}, Lorg/godotengine/godot/Godot;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static final synthetic access$getINSTANCE$cp()Lorg/godotengine/godot/Godot;
    .locals 1

    .line 88
    sget-object v0, Lorg/godotengine/godot/Godot;->INSTANCE:Lorg/godotengine/godot/Godot;

    return-object v0
.end method

.method public static final synthetic access$getUseImmersive$p(Lorg/godotengine/godot/Godot;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/Godot;

    .line 88
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method public static final synthetic access$setINSTANCE$cp(Lorg/godotengine/godot/Godot;)V
    .locals 0
    .param p0, "<set-?>"    # Lorg/godotengine/godot/Godot;

    .line 88
    sput-object p0, Lorg/godotengine/godot/Godot;->INSTANCE:Lorg/godotengine/godot/Godot;

    return-void
.end method

.method public static synthetic alert$default(Lorg/godotengine/godot/Godot;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;ILjava/lang/Object;)V
    .locals 0

    .line 882
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    .line 883
    const/4 p3, 0x0

    .line 882
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final alert$lambda$24(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 3
    .param p0, "$activity"    # Landroid/app/Activity;
    .param p1, "$message"    # Ljava/lang/String;
    .param p2, "$title"    # Ljava/lang/String;
    .param p3, "$okCallback"    # Ljava/lang/Runnable;

    .line 886
    new-instance v0, Landroid/app/AlertDialog$Builder;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 887
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    move-object v1, p1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    move-object v2, p2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 888
    nop

    .line 889
    sget v1, Lorg/godotengine/godot/R$string;->dialog_ok:I

    .line 890
    nop

    .line 888
    new-instance v2, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda4;

    invoke-direct {v2, p3}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda4;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 894
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    .line 895
    .local v1, "dialog":Landroid/app/AlertDialog;
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 896
    return-void
.end method

.method private static final alert$lambda$24$lambda$23(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p0, "$okCallback"    # Ljava/lang/Runnable;
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    const-string p2, "dialog"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 891
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 892
    :cond_0
    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    .line 893
    return-void
.end method

.method public static synthetic destroyAndKillProcess$default(Lorg/godotengine/godot/Godot;Ljava/lang/Runnable;ILjava/lang/Object;)V
    .locals 0

    .line 994
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 995
    const/4 p1, 0x0

    .line 994
    :cond_0
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/Godot;->destroyAndKillProcess(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final destroyAndKillProcess$lambda$27(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;)V
    .locals 0
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "$host"    # Lorg/godotengine/godot/GodotHost;

    .line 1010
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/Godot;->onDestroy(Lorg/godotengine/godot/GodotHost;)V

    .line 1011
    return-void
.end method

.method public static synthetic enableEdgeToEdge$default(Lorg/godotengine/godot/Godot;ZZILjava/lang/Object;)V
    .locals 0

    .line 356
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 357
    const/4 p2, 0x0

    .line 356
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/Godot;->enableEdgeToEdge(ZZ)V

    return-void
.end method

.method private static final enableEdgeToEdge$lambda$11(Lorg/godotengine/godot/Godot;Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;)Landroidx/core/view/WindowInsetsCompat;
    .locals 1
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "v"    # Landroid/view/View;
    .param p2, "insets"    # Landroidx/core/view/WindowInsetsCompat;

    const-string v0, "v"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "insets"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 385
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda16;

    invoke-direct {v0, p0, p2, p1}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda16;-><init>(Lorg/godotengine/godot/Godot;Landroidx/core/view/WindowInsetsCompat;Landroid/view/View;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 398
    sget-object v0, Landroidx/core/view/WindowInsetsCompat;->CONSUMED:Landroidx/core/view/WindowInsetsCompat;

    return-object v0
.end method

.method private static final enableEdgeToEdge$lambda$11$lambda$10(Lorg/godotengine/godot/Godot;Landroidx/core/view/WindowInsetsCompat;Landroid/view/View;)V
    .locals 5
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "$insets"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "$v"    # Landroid/view/View;

    .line 386
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-string v1, "getInsets(...)"

    if-eqz v0, :cond_1

    .line 387
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 388
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 389
    .local v0, "windowInsets":Landroidx/core/graphics/Insets;
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v4, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p2, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .end local v0    # "windowInsets":Landroidx/core/graphics/Insets;
    goto :goto_0

    .line 391
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_0

    .line 394
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getInsetType()I

    move-result v0

    invoke-virtual {p1, v0}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 395
    .restart local v0    # "windowInsets":Landroidx/core/graphics/Insets;
    iget v1, v0, Landroidx/core/graphics/Insets;->left:I

    iget v2, v0, Landroidx/core/graphics/Insets;->top:I

    iget v3, v0, Landroidx/core/graphics/Insets;->right:I

    iget v4, v0, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {p2, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 397
    .end local v0    # "windowInsets":Landroidx/core/graphics/Insets;
    :goto_0
    return-void
.end method

.method public static synthetic enableImmersiveMode$default(Lorg/godotengine/godot/Godot;ZZILjava/lang/Object;)V
    .locals 0

    .line 415
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 416
    const/4 p2, 0x0

    .line 415
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/Godot;->enableImmersiveMode(ZZ)V

    return-void
.end method

.method private static final getClipboardCallable$lambda$9(Lorg/godotengine/godot/Godot;)Ljava/lang/String;
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 159
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMClipboard()Landroid/content/ClipboardManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    .line 160
    .local v0, "clipData":Landroid/content/ClipData;
    :goto_0
    if-eqz v0, :cond_1

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 161
    .local v1, "text":Ljava/lang/CharSequence;
    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    :cond_2
    const-string v2, ""

    :cond_3
    return-object v2
.end method

.method private final getInsetType()I
    .locals 2

    .line 404
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 407
    :cond_0
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    goto :goto_1

    .line 405
    :cond_1
    :goto_0
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v0

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v1

    or-int/2addr v0, v1

    .line 404
    :goto_1
    return v0
.end method

.method public static final getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot$Companion;->getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;

    move-result-object v0

    .line 100
    return-object v0
.end method

.method private final getMAccelerometer()Landroid/hardware/Sensor;
    .locals 1

    .line 135
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mAccelerometer$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    return-object v0
.end method

.method private final getMClipboard()Landroid/content/ClipboardManager;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mClipboard$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    return-object v0
.end method

.method private final getMGravity()Landroid/hardware/Sensor;
    .locals 1

    .line 138
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mGravity$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    return-object v0
.end method

.method private final getMGyroscope()Landroid/hardware/Sensor;
    .locals 1

    .line 144
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mGyroscope$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    return-object v0
.end method

.method private final getMMagnetometer()Landroid/hardware/Sensor;
    .locals 1

    .line 141
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mMagnetometer$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/Sensor;

    return-object v0
.end method

.method private final getMSensorManager()Landroid/hardware/SensorManager;
    .locals 1

    .line 130
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->mSensorManager$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    return-object v0
.end method

.method private final getNativeRenderer()Ljava/lang/String;
    .locals 10

    .line 919
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/godotengine/godot/Godot;->meetsVulkanRequirements(Landroid/content/pm/PackageManager;)Z

    move-result v0

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->getRendererInfo(Z)[Ljava/lang/String;

    move-result-object v0

    .line 920
    .local v0, "rendererInfo":[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    .line 921
    .local v1, "renderingDriverChosen":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v0, v2

    .line 922
    .local v2, "renderingDriverOriginal":Ljava/lang/String;
    const/4 v3, 0x2

    aget-object v3, v0, v3

    .line 923
    .local v3, "renderingMethod":Ljava/lang/String;
    const/4 v4, 0x3

    aget-object v4, v0, v4

    .line 924
    .local v4, "renderingDriverSource":Ljava/lang/String;
    const/4 v5, 0x4

    aget-object v5, v0, v5

    .line 925
    .local v5, "renderingMethodSource":Ljava/lang/String;
    sget-object v6, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    .line 926
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "renderingDevice: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v9, ")\n\t\t\trenderer: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 925
    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 928
    const-string v6, "vulkan"

    invoke-static {v2, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    const-string v6, ""

    invoke-static {v1, v6}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_0

    .line 930
    :cond_0
    new-instance v6, Ljava/lang/IllegalStateException;

    iget-object v7, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    sget v8, Lorg/godotengine/godot/R$string;->error_missing_vulkan_requirements_message:I

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 933
    :cond_1
    :goto_0
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v1
.end method

.method private final getWindowBackgroundColor(Landroid/view/Window;)I
    .locals 2
    .param p1, "window"    # Landroid/view/Window;

    .line 463
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 464
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v1, :cond_0

    .line 465
    move-object v1, v0

    check-cast v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v1

    goto :goto_0

    .line 467
    :cond_0
    iget v1, p0, Lorg/godotengine/godot/Godot;->backgroundColor:I

    .line 464
    :goto_0
    return v1
.end method

.method private static final hasClipboardCallable$lambda$8(Lorg/godotengine/godot/Godot;)Ljava/lang/Boolean;
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 155
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMClipboard()Landroid/content/ClipboardManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v1, v2

    :cond_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic initEngine$default(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;Ljava/util/List;Ljava/util/Set;ILjava/lang/Object;)Z
    .locals 0

    .line 236
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object p3

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->initEngine(Lorg/godotengine/godot/GodotHost;Ljava/util/List;Ljava/util/Set;)Z

    move-result p0

    return p0
.end method

.method private final isNativeInitialized()Z
    .locals 1

    .line 217
    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->nativeLayerInitializeCompleted:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->nativeLayerSetupCompleted:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static final isXrRuntime_delegate$lambda$7(Lorg/godotengine/godot/Godot;)Z
    .locals 1
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 146
    const-string v0, "xr_runtime"

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->hasFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static final mAccelerometer_delegate$lambda$3(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 135
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final mClipboard_delegate$lambda$1(Lorg/godotengine/godot/Godot;)Landroid/content/ClipboardManager;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 131
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    const-string v1, "clipboard"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/content/ClipboardManager;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/content/ClipboardManager;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final mGravity_delegate$lambda$4(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 138
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final mGyroscope_delegate$lambda$6(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 144
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final mMagnetometer_delegate$lambda$5(Lorg/godotengine/godot/Godot;)Landroid/hardware/Sensor;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 141
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static final mSensorManager_delegate$lambda$0(Lorg/godotengine/godot/Godot;)Landroid/hardware/SensorManager;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 130
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Landroid/hardware/SensorManager;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/hardware/SensorManager;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private final meetsVulkanRequirements(Landroid/content/pm/PackageManager;)Z
    .locals 2
    .param p1, "packageManager"    # Landroid/content/pm/PackageManager;

    .line 940
    if-nez p1, :cond_0

    .line 941
    const/4 v0, 0x0

    return v0

    .line 943
    :cond_0
    const-string v0, "android.hardware.vulkan.level"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 945
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v1, "The vulkan hardware level does not meet the minimum requirement: 1"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 949
    :cond_1
    const-string v0, "android.hardware.vulkan.version"

    const v1, 0x401000

    invoke-virtual {p1, v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method private static final onActivityResult$lambda$18(Lorg/godotengine/godot/Godot;IILandroid/content/Intent;)V
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "$requestCode"    # I
    .param p2, "$resultCode"    # I
    .param p3, "$data"    # Landroid/content/Intent;

    .line 779
    sget-object v0, Lorg/godotengine/godot/io/FilePicker;->Companion:Lorg/godotengine/godot/io/FilePicker$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/godotengine/godot/io/FilePicker$Companion;->handleActivityResult(Landroid/content/Context;IILandroid/content/Intent;)V

    .line 780
    return-void
.end method

.method private static final onBackPressed$lambda$29()V
    .locals 0

    .line 1031
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->back()V

    return-void
.end method

.method private static final onConfigurationChanged$lambda$16()V
    .locals 0

    .line 759
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->onNightModeChanged()V

    .line 760
    return-void
.end method

.method private static final onConfigurationChanged$lambda$17(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 766
    iget v0, p0, Lorg/godotengine/godot/Godot;->orientation:I

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->onOrientationChange(I)V

    .line 767
    return-void
.end method

.method private static final onGodotMainLoopStarted$lambda$22(Lorg/godotengine/godot/Godot;)V
    .locals 0
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 850
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->registerSensorsIfNeeded()V

    .line 851
    return-void
.end method

.method private static final onGodotSetupCompleted$lambda$21(Lorg/godotengine/godot/Godot;ZZZZLjava/lang/String;)V
    .locals 5
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "$longPressEnabled"    # Z
    .param p2, "$panScaleEnabled"    # Z
    .param p3, "$overrideVolumeButtons"    # Z
    .param p4, "$scrollDeadzoneDisabled"    # Z
    .param p5, "$rotaryInputAxisValue"    # Ljava/lang/String;

    .line 818
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    .local v0, "$this$onGodotSetupCompleted_u24lambda_u2421_u24lambda_u2420":Lorg/godotengine/godot/input/GodotInputHandler;
    const/4 v1, 0x0

    .line 819
    .local v1, "$i$a$-apply-Godot$onGodotSetupCompleted$1$1":I
    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->enableLongPress(Z)V

    .line 820
    invoke-virtual {v0, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->enablePanningAndScalingGestures(Z)V

    .line 821
    invoke-virtual {v0, p3}, Lorg/godotengine/godot/input/GodotInputHandler;->setOverrideVolumeButtons(Z)V

    .line 822
    invoke-virtual {v0, p4}, Lorg/godotengine/godot/input/GodotInputHandler;->disableScrollDeadzone(Z)V

    .line 823
    nop

    .line 824
    :try_start_0
    invoke-static {p5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/godotengine/godot/input/GodotInputHandler;->setRotaryInputAxis(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 825
    :catch_0
    move-exception v2

    .line 826
    .local v2, "e":Ljava/lang/NumberFormatException;
    sget-object v3, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    move-object v4, v2

    check-cast v4, Ljava/lang/Throwable;

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 828
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :goto_0
    nop

    .line 818
    .end local v0    # "$this$onGodotSetupCompleted_u24lambda_u2421_u24lambda_u2420":Lorg/godotengine/godot/input/GodotInputHandler;
    .end local v1    # "$i$a$-apply-Godot$onGodotSetupCompleted$1$1":I
    nop

    .line 829
    return-void
.end method

.method public static synthetic onInitRenderView$default(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;Landroid/widget/FrameLayout;ILjava/lang/Object;)Landroid/widget/FrameLayout;
    .locals 0

    .line 498
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 499
    new-instance p2, Landroid/widget/FrameLayout;

    iget-object p3, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 498
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/Godot;->onInitRenderView(Lorg/godotengine/godot/GodotHost;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;

    move-result-object p0

    return-object p0
.end method

.method private static final onInitRenderView$lambda$14(Lorg/godotengine/godot/Godot;)V
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 621
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 624
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onRegisterPluginWithGodotNative()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 626
    :cond_0
    const-string v0, "display/window/energy_saving/keep_screen_on"

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->setKeepScreenOn$lib_templateDebug(Z)V

    .line 627
    return-void
.end method

.method private static final onPictureInPictureModeChanged$lambda$15(Z)V
    .locals 0
    .param p0, "$isInPictureInPictureMode"    # Z

    .line 700
    invoke-static {p0}, Lorg/godotengine/godot/GodotLib;->onPictureInPictureModeChanged(Z)V

    .line 701
    return-void
.end method

.method private static final onRequestPermissionsResult$lambda$19([Ljava/lang/String;[I)V
    .locals 4
    .param p0, "$permissions"    # [Ljava/lang/String;
    .param p1, "$grantResults"    # [I

    .line 795
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p0

    :goto_0
    if-ge v0, v1, :cond_1

    .line 797
    aget-object v2, p0, v0

    .line 798
    aget v3, p1, v0

    if-nez v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    .line 796
    :goto_1
    invoke-static {v2, v3}, Lorg/godotengine/godot/GodotLib;->requestPermissionResult(Ljava/lang/String;Z)V

    .line 795
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 801
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method private static final pluginRegistry_delegate$lambda$2()Lorg/godotengine/godot/plugin/GodotPluginRegistry;
    .locals 1

    .line 132
    invoke-static {}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getPluginRegistry()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    return-object v0
.end method

.method private final registerSensorsIfNeeded()V
    .locals 4

    .line 679
    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->resumed:Z

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getRunStatus()Lorg/godotengine/godot/Godot$RunStatus;

    move-result-object v0

    sget-object v1, Lorg/godotengine/godot/Godot$RunStatus;->STARTED:Lorg/godotengine/godot/Godot$RunStatus;

    if-eq v0, v1, :cond_0

    goto/16 :goto_0

    .line 683
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->accelerometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMAccelerometer()Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 684
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    check-cast v2, Landroid/hardware/SensorEventListener;

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMAccelerometer()Landroid/hardware/Sensor;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 686
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->gravityEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMGravity()Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 687
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    check-cast v2, Landroid/hardware/SensorEventListener;

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMGravity()Landroid/hardware/Sensor;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 689
    :cond_2
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->magnetometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMMagnetometer()Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 690
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    check-cast v2, Landroid/hardware/SensorEventListener;

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMMagnetometer()Landroid/hardware/Sensor;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 692
    :cond_3
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->gyroscopeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMGyroscope()Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 693
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    check-cast v2, Landroid/hardware/SensorEventListener;

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMGyroscope()Landroid/hardware/Sensor;

    move-result-object v3

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 695
    :cond_4
    return-void

    .line 680
    :cond_5
    :goto_0
    return-void
.end method

.method private static final setClipboard$lambda$26(Lorg/godotengine/godot/Godot;Ljava/lang/String;)V
    .locals 3
    .param p0, "this$0"    # Lorg/godotengine/godot/Godot;
    .param p1, "$text"    # Ljava/lang/String;

    .line 987
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMClipboard()Landroid/content/ClipboardManager;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "myLabel"

    check-cast v1, Ljava/lang/CharSequence;

    move-object v2, p1

    check-cast v2, Ljava/lang/CharSequence;

    invoke-static {v1, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 988
    :cond_0
    return-void
.end method

.method private static final setKeepScreenOn$lambda$25(ZLorg/godotengine/godot/Godot;)V
    .locals 2
    .param p0, "$enabled"    # Z
    .param p1, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 954
    const/16 v0, 0x80

    if-eqz p0, :cond_0

    .line 955
    invoke-virtual {p1}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Landroid/view/Window;->addFlags(I)V

    goto :goto_0

    .line 957
    :cond_0
    invoke-virtual {p1}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1, v0}, Landroid/view/Window;->clearFlags(I)V

    .line 959
    :cond_1
    :goto_0
    return-void
.end method

.method private static final setWindowColor$lambda$12(Landroid/view/View;ILorg/godotengine/godot/Godot;)V
    .locals 0
    .param p0, "$decorView"    # Landroid/view/View;
    .param p1, "$color"    # I
    .param p2, "this$0"    # Lorg/godotengine/godot/Godot;

    .line 480
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 481
    iput p1, p2, Lorg/godotengine/godot/Godot;->backgroundColor:I

    .line 482
    invoke-virtual {p2}, Lorg/godotengine/godot/Godot;->setSystemBarsAppearance()V

    .line 483
    return-void
.end method


# virtual methods
.method public final alert(IILjava/lang/Runnable;)V
    .locals 4
    .param p1, "messageResId"    # I
    .param p2, "titleResId"    # I
    .param p3, "okCallback"    # Ljava/lang/Runnable;

    .line 878
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 879
    .local v0, "res":Landroid/content/res/Resources;
    :cond_0
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "getString(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, v1, v3, p3}, Lorg/godotengine/godot/Godot;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 880
    return-void
.end method

.method public final alert(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "title"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v1 .. v6}, Lorg/godotengine/godot/Godot;->alert$default(Lorg/godotengine/godot/Godot;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;ILjava/lang/Object;)V

    .line 897
    return-void
.end method

.method public final alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "okCallback"    # Ljava/lang/Runnable;

    const-string v0, "message"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "title"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 884
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 885
    .local v0, "activity":Landroid/app/Activity;
    :cond_0
    new-instance v1, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda10;

    invoke-direct {v1, v0, p1, p2, p3}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda10;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 897
    return-void
.end method

.method public final destroyAndKillProcess()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lorg/godotengine/godot/Godot;->destroyAndKillProcess$default(Lorg/godotengine/godot/Godot;Ljava/lang/Runnable;ILjava/lang/Object;)V

    .line 1012
    return-void
.end method

.method public final destroyAndKillProcess(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "destroyRunnable"    # Ljava/lang/Runnable;

    .line 996
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    .line 997
    .local v0, "host":Lorg/godotengine/godot/GodotHost;
    if-nez v0, :cond_1

    .line 999
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 1002
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->forceQuit$lib_templateDebug(I)Z

    .line 1003
    return-void

    .line 1007
    :cond_1
    iget-object v1, p0, Lorg/godotengine/godot/Godot;->runOnTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 1009
    new-instance v1, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda7;

    invoke-direct {v1, p0, v0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda7;-><init>(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;)V

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 1012
    return-void
.end method

.method public final enableEdgeToEdge(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lorg/godotengine/godot/Godot;->enableEdgeToEdge$default(Lorg/godotengine/godot/Godot;ZZILjava/lang/Object;)V

    .line 401
    return-void
.end method

.method public final enableEdgeToEdge(ZZ)V
    .locals 8
    .param p1, "enabled"    # Z
    .param p2, "override"    # Z

    .line 360
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 362
    .local v0, "window":Landroid/view/Window;
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    xor-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v1

    if-nez v1, :cond_1

    if-nez p2, :cond_1

    .line 363
    return-void

    .line 366
    :cond_1
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    const-string v2, "getDecorView(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 367
    .local v1, "rootView":Landroid/view/View;
    iget-object v2, p0, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_2

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_2

    const/4 v2, 0x1

    goto :goto_0

    :cond_2
    move v2, v3

    :goto_0
    invoke-static {v0, v2}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V

    .line 368
    if-eqz p1, :cond_3

    .line 369
    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 370
    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 371
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-ge v2, v3, :cond_5

    .line 372
    const/high16 v2, 0x4000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    .line 373
    const/high16 v2, 0x8000000

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    goto :goto_1

    .line 376
    :cond_3
    invoke-virtual {v1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 377
    iget-object v2, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_4

    .line 378
    invoke-virtual {v1}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v2

    const-string v3, "toWindowInsetsCompat(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 379
    .local v2, "windowInsets":Landroidx/core/view/WindowInsetsCompat;
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getInsetType()I

    move-result v3

    invoke-virtual {v2, v3}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v3

    const-string v4, "getInsets(...)"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 380
    .local v3, "insets":Landroidx/core/graphics/Insets;
    iget v4, v3, Landroidx/core/graphics/Insets;->left:I

    iget v5, v3, Landroidx/core/graphics/Insets;->top:I

    iget v6, v3, Landroidx/core/graphics/Insets;->right:I

    iget v7, v3, Landroidx/core/graphics/Insets;->bottom:I

    invoke-virtual {v1, v4, v5, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 384
    .end local v2    # "windowInsets":Landroidx/core/view/WindowInsetsCompat;
    .end local v3    # "insets":Landroidx/core/graphics/Insets;
    :cond_4
    new-instance v2, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda5;

    invoke-direct {v2, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda5;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-static {v1, v2}, Landroidx/core/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    .line 401
    :cond_5
    :goto_1
    return-void

    .line 360
    .end local v0    # "window":Landroid/view/Window;
    .end local v1    # "rootView":Landroid/view/View;
    :cond_6
    :goto_2
    return-void
.end method

.method public final enableImmersiveMode(Z)V
    .locals 3
    .param p1, "enabled"    # Z

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lorg/godotengine/godot/Godot;->enableImmersiveMode$default(Lorg/godotengine/godot/Godot;ZZILjava/lang/Object;)V

    .line 447
    return-void
.end method

.method public final enableImmersiveMode(ZZ)V
    .locals 8
    .param p1, "enabled"    # Z
    .param p2, "override"    # Z

    .line 419
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 420
    .local v0, "activity":Landroid/app/Activity;
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    .line 422
    .local v1, "window":Landroid/view/Window;
    :cond_1
    iget-object v2, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    xor-int/lit8 v3, p1, 0x1

    invoke-virtual {v2, v3, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v2

    if-nez v2, :cond_2

    if-nez p2, :cond_2

    .line 423
    return-void

    .line 426
    :cond_2
    iget-object v2, p0, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v2, :cond_3

    iget-object v2, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_3

    move v2, v4

    goto :goto_0

    :cond_3
    move v2, v3

    :goto_0
    invoke-static {v1, v2}, Landroidx/core/view/WindowCompat;->setDecorFitsSystemWindows(Landroid/view/Window;Z)V

    .line 427
    new-instance v2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    invoke-direct {v2, v1, v5}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    .line 428
    .local v2, "controller":Landroidx/core/view/WindowInsetsControllerCompat;
    if-eqz p1, :cond_4

    .line 429
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v3

    invoke-virtual {v2, v3}, Landroidx/core/view/WindowInsetsControllerCompat;->hide(I)V

    .line 430
    const/4 v3, 0x2

    invoke-virtual {v2, v3}, Landroidx/core/view/WindowInsetsControllerCompat;->setSystemBarsBehavior(I)V

    goto :goto_3

    .line 432
    :cond_4
    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .line 433
    .local v5, "fullScreenThemeValue":Landroid/util/TypedValue;
    invoke-virtual {v0}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x101020d

    invoke-virtual {v6, v7, v5, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v6

    if-eqz v6, :cond_5

    iget v6, v5, Landroid/util/TypedValue;->type:I

    const/16 v7, 0x12

    if-ne v6, v7, :cond_5

    .line 434
    iget v6, v5, Landroid/util/TypedValue;->data:I

    if-nez v6, :cond_6

    move v3, v4

    goto :goto_1

    .line 437
    :cond_5
    sget-object v6, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v6}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v6

    if-nez v6, :cond_6

    move v3, v4

    .line 433
    :cond_6
    :goto_1
    nop

    .line 440
    .local v3, "hasStatusBar":Z
    if-eqz v3, :cond_7

    .line 441
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->navigationBars()I

    move-result v4

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->statusBars()I

    move-result v6

    or-int/2addr v4, v6

    goto :goto_2

    .line 443
    :cond_7
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->navigationBars()I

    move-result v4

    .line 440
    :goto_2
    nop

    .line 445
    .local v4, "types":I
    invoke-virtual {v2, v4}, Landroidx/core/view/WindowInsetsControllerCompat;->show(I)V

    .line 447
    .end local v3    # "hasStatusBar":Z
    .end local v4    # "types":I
    .end local v5    # "fullScreenThemeValue":Landroid/util/TypedValue;
    :goto_3
    return-void
.end method

.method public final forceQuit$lib_templateDebug(I)Z
    .locals 3
    .param p1, "instanceId"    # I

    .line 1015
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_1

    .local v0, "it":Lorg/godotengine/godot/GodotHost;
    const/4 v1, 0x0

    .line 1016
    .local v1, "$i$a$-let-Godot$forceQuit$1":I
    if-nez p1, :cond_0

    .line 1017
    invoke-interface {v0, p0}, Lorg/godotengine/godot/GodotHost;->onGodotForceQuit(Lorg/godotengine/godot/Godot;)V

    .line 1018
    const/4 v2, 0x1

    return v2

    .line 1020
    :cond_0
    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onGodotForceQuit(I)Z

    move-result v2

    return v2

    .line 1023
    .end local v0    # "it":Lorg/godotengine/godot/GodotHost;
    .end local v1    # "$i$a$-let-Godot$forceQuit$1":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public final getActivity()Landroid/app/Activity;
    .locals 1

    .line 227
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public final getClipboard()Ljava/lang/String;
    .locals 2

    .line 975
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 978
    :cond_0
    new-instance v0, Ljava/util/concurrent/FutureTask;

    iget-object v1, p0, Lorg/godotengine/godot/Godot;->getClipboardCallable:Ljava/util/concurrent/Callable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 979
    .local v0, "task":Ljava/util/concurrent/FutureTask;
    move-object v1, v0

    check-cast v1, Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 980
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    .line 977
    .end local v0    # "task":Ljava/util/concurrent/FutureTask;
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    .line 976
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->getClipboardCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 975
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/String;

    :goto_1
    return-object v0
.end method

.method public final getContainerLayout$lib_templateDebug()Landroid/widget/FrameLayout;
    .locals 1

    .line 211
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    .line 88
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    return-object v0
.end method

.method public final getDarkMode$lib_templateDebug()Z
    .locals 1

    .line 205
    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->darkMode:Z

    return v0
.end method

.method public final getDirectoryAccessHandler()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;
    .locals 1

    .line 149
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->directoryAccessHandler:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    return-object v0
.end method

.method public final getDisableGodotSplash()Z
    .locals 1

    .line 208
    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->disableGodotSplash:Z

    return v0
.end method

.method public final getFileAccessHandler()Lorg/godotengine/godot/io/file/FileAccessHandler;
    .locals 1

    .line 150
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->fileAccessHandler:Lorg/godotengine/godot/io/file/FileAccessHandler;

    return-object v0
.end method

.method public final getGodotInputHandler()Lorg/godotengine/godot/input/GodotInputHandler;
    .locals 1

    .line 152
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    return-object v0
.end method

.method public final getGrantedPermissions()[Ljava/lang/String;
    .locals 1

    .line 1044
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-static {v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->getGrantedPermissions(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getIo()Lorg/godotengine/godot/GodotIO;
    .locals 1

    .line 198
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->io:Lorg/godotengine/godot/GodotIO;

    return-object v0
.end method

.method public final getNetUtils()Lorg/godotengine/godot/utils/GodotNetUtils;
    .locals 1

    .line 151
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->netUtils:Lorg/godotengine/godot/utils/GodotNetUtils;

    return-object v0
.end method

.method public final getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;
    .locals 2

    .line 132
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->pluginRegistry$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "getValue(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    return-object v0
.end method

.method public final getPrimaryHost$lib_templateDebug()Lorg/godotengine/godot/GodotHost;
    .locals 1

    .line 183
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    return-object v0
.end method

.method public final getRenderView()Lorg/godotengine/godot/GodotRenderView;
    .locals 1

    .line 212
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    return-object v0
.end method

.method public final getRunStatus()Lorg/godotengine/godot/Godot$RunStatus;
    .locals 2

    .line 196
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->_runStatus:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "get(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/godotengine/godot/Godot$RunStatus;

    return-object v0
.end method

.method public final getTts()Lorg/godotengine/godot/tts/GodotTTS;
    .locals 1

    .line 148
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->tts:Lorg/godotengine/godot/tts/GodotTTS;

    return-object v0
.end method

.method public final getXrMode$lib_templateDebug()Lorg/godotengine/godot/xr/XRMode;
    .locals 1

    .line 201
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    return-object v0
.end method

.method public final hasClipboard()Z
    .locals 2

    .line 964
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ge v0, v1, :cond_1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 967
    :cond_0
    new-instance v0, Ljava/util/concurrent/FutureTask;

    iget-object v1, p0, Lorg/godotengine/godot/Godot;->hasClipboardCallable:Ljava/util/concurrent/Callable;

    invoke-direct {v0, v1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 968
    .local v0, "task":Ljava/util/concurrent/FutureTask;
    move-object v1, v0

    check-cast v1, Ljava/lang/Runnable;

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 969
    invoke-virtual {v0}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v0

    .line 966
    .end local v0    # "task":Ljava/util/concurrent/FutureTask;
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_1

    .line 965
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->hasClipboardCallable:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    .line 964
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_1
    return v0
.end method

.method public final hasFeature(Ljava/lang/String;)Z
    .locals 1
    .param p1, "feature"    # Ljava/lang/String;

    const-string v0, "feature"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1064
    invoke-static {p1}, Lorg/godotengine/godot/GodotLib;->hasFeature(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final initEngine(Lorg/godotengine/godot/GodotHost;Ljava/util/List;Ljava/util/Set;)Z
    .locals 24
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;
    .param p2, "commandLineParams"    # Ljava/util/List;
    .param p3, "hostPlugins"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/godotengine/godot/GodotHost;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "+",
            "Lorg/godotengine/godot/plugin/GodotPlugin;",
            ">;)Z"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    const-string v0, "commandLineParams"

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "hostPlugins"

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 237
    invoke-direct/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->isNativeInitialized()Z

    move-result v0

    const/4 v4, 0x1

    if-eqz v0, :cond_0

    .line 238
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v5, "Engine already initialized"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    return v4

    .line 242
    :cond_0
    iget-object v0, v1, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    .line 243
    .local v5, "config":Landroid/content/res/Configuration;
    iget v0, v5, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v6, 0x20

    const/4 v7, 0x0

    if-ne v0, v6, :cond_1

    move v0, v4

    goto :goto_0

    :cond_1
    move v0, v7

    :goto_0
    iput-boolean v0, v1, Lorg/godotengine/godot/Godot;->darkMode:Z

    .line 244
    iget v0, v5, Landroid/content/res/Configuration;->orientation:I

    iput v0, v1, Lorg/godotengine/godot/Godot;->orientation:I

    .line 246
    const-string v6, "Startup"

    const-string v8, "Godot::initEngine"

    invoke-static {v6, v8}, Lorg/godotengine/godot/utils/BenchmarkUtils;->beginBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    nop

    .line 248
    move-object/from16 v11, p1

    :try_start_0
    iput-object v11, v1, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    .line 249
    iget-object v0, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    move-object v12, v2

    check-cast v12, Ljava/util/Collection;

    invoke-interface {v0, v12}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 251
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v12, "Initializing Godot plugin registry"

    invoke-static {v0, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    new-array v0, v4, [Lorg/godotengine/godot/plugin/GodotPlugin;

    new-instance v12, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;

    invoke-direct {v12, v1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;-><init>(Lorg/godotengine/godot/Godot;)V

    aput-object v12, v0, v7

    invoke-static {v0}, Lkotlin/collections/SetsKt;->mutableSetOf([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    move-object v12, v0

    .line 253
    .local v12, "runtimePlugins":Ljava/util/Set;
    move-object v0, v3

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v12, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 254
    invoke-static {v1, v12}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->initializePluginRegistry(Lorg/godotengine/godot/Godot;Ljava/util/Set;)Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    .line 257
    invoke-static/range {p2 .. p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    move-object v13, v0

    .line 258
    .local v13, "originalCommandLineParams":Ljava/util/List;
    invoke-virtual/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/plugin/GodotPlugin;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v15, v0

    .line 259
    .local v15, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    nop

    .line 260
    :try_start_1
    invoke-virtual {v15, v13}, Lorg/godotengine/godot/plugin/GodotPlugin;->getCommandLineParams(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    const-string v9, "getCommandLineParams(...)"

    invoke-static {v0, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 261
    .local v0, "pluginCommandLineParams":Ljava/util/List;
    invoke-static {v0, v13}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_2

    move-object v9, v0

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    .line 262
    sget-object v9, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received command line params from plugin "

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, ": "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    iget-object v7, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    move-object v9, v0

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v7, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .end local v0    # "pluginCommandLineParams":Ljava/util/List;
    const/4 v7, 0x0

    goto :goto_1

    .line 261
    .restart local v0    # "pluginCommandLineParams":Ljava/util/List;
    :cond_2
    const/4 v7, 0x0

    goto :goto_1

    .line 265
    .end local v0    # "pluginCommandLineParams":Ljava/util/List;
    :catch_0
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2
    sget-object v7, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unable to get command line params from plugin "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object v10, v0

    check-cast v10, Ljava/lang/Throwable;

    invoke-static {v7, v9, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v7, 0x0

    goto :goto_1

    .line 270
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v15    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    :cond_3
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    iget-object v7, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "InitEngine with params: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    .line 272
    .local v0, "newArgs":Ljava/util/List;
    const/4 v7, 0x0

    .line 273
    .local v7, "useApkExpansion":Z
    const/4 v9, 0x0

    .line 274
    .local v9, "i":I
    :goto_2
    iget-object v10, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_13

    .line 275
    iget-object v10, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v10, v4

    if-ge v9, v10, :cond_4

    move v10, v4

    goto :goto_3

    :cond_4
    const/4 v10, 0x0

    .line 276
    .local v10, "hasExtra":Z
    :goto_3
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    sget-object v15, Lorg/godotengine/godot/xr/XRMode;->REGULAR:Lorg/godotengine/godot/xr/XRMode;

    iget-object v15, v15, Lorg/godotengine/godot/xr/XRMode;->cmdLineArg:Ljava/lang/String;

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 277
    sget-object v14, Lorg/godotengine/godot/xr/XRMode;->REGULAR:Lorg/godotengine/godot/xr/XRMode;

    iput-object v14, v1, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    goto/16 :goto_6

    .line 278
    :cond_5
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    sget-object v15, Lorg/godotengine/godot/xr/XRMode;->OPENXR:Lorg/godotengine/godot/xr/XRMode;

    iget-object v15, v15, Lorg/godotengine/godot/xr/XRMode;->cmdLineArg:Ljava/lang/String;

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 279
    sget-object v14, Lorg/godotengine/godot/xr/XRMode;->OPENXR:Lorg/godotengine/godot/xr/XRMode;

    iput-object v14, v1, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    goto/16 :goto_6

    .line 280
    :cond_6
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--debug_opengl"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 281
    iput-boolean v4, v1, Lorg/godotengine/godot/Godot;->useDebugOpengl:Z

    goto/16 :goto_6

    .line 282
    :cond_7
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--edge_to_edge"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 283
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v14, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto/16 :goto_6

    .line 284
    :cond_8
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--fullscreen"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 285
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v14, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 286
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 287
    :cond_9
    if-eqz v10, :cond_a

    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--background_color"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 288
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    add-int/lit8 v15, v9, 0x1

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-virtual {v1, v14}, Lorg/godotengine/godot/Godot;->setWindowColor(Ljava/lang/String;)V

    .line 289
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6

    .line 290
    :cond_a
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--disable_godot_splash"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_b

    .line 291
    iput-boolean v4, v1, Lorg/godotengine/godot/Godot;->disableGodotSplash:Z

    goto/16 :goto_6

    .line 292
    :cond_b
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--benchmark"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 293
    invoke-static {v4}, Lorg/godotengine/godot/utils/BenchmarkUtils;->setUseBenchmark(Z)V

    .line 294
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 295
    :cond_c
    if-eqz v10, :cond_d

    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--benchmark-file"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_d

    .line 296
    invoke-static {v4}, Lorg/godotengine/godot/utils/BenchmarkUtils;->setUseBenchmark(Z)V

    .line 297
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 300
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    add-int/lit8 v15, v9, 0x1

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Lorg/godotengine/godot/utils/BenchmarkUtils;->setBenchmarkFile(Ljava/lang/String;)V

    .line 301
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    add-int/lit8 v15, v9, 0x1

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_6

    .line 304
    :cond_d
    if-eqz v10, :cond_10

    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    const-string v15, "--main-pack"

    invoke-static {v14, v15}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_10

    .line 305
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v0, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    add-int/lit8 v15, v9, 0x1

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    .line 308
    .local v14, "mainPackPath":Ljava/lang/String;
    iget-object v15, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    add-int/lit8 v4, v9, 0x1

    invoke-interface {v15, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    iget-object v4, v1, Lorg/godotengine/godot/Godot;->fileAccessHandler:Lorg/godotengine/godot/io/file/FileAccessHandler;

    invoke-virtual {v4}, Lorg/godotengine/godot/io/file/FileAccessHandler;->getStorageScopeIdentifier$lib_templateDebug()Lorg/godotengine/godot/io/StorageScope$Identifier;

    move-result-object v4

    invoke-virtual {v4, v14}, Lorg/godotengine/godot/io/StorageScope$Identifier;->identifyStorageScope(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;

    move-result-object v4

    .line 312
    .local v4, "storageScope":Lorg/godotengine/godot/io/StorageScope;
    sget-object v15, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v15}, Lorg/godotengine/godot/Godot$Companion;->isTemplateBuild$lib_templateDebug()Z

    move-result v15

    if-eqz v15, :cond_f

    .line 313
    sget-object v15, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    if-ne v4, v15, :cond_e

    const/4 v15, 0x1

    goto :goto_4

    :cond_e
    const/4 v15, 0x0

    :goto_4
    move v7, v15

    .line 315
    :cond_f
    nop

    .end local v4    # "storageScope":Lorg/godotengine/godot/io/StorageScope;
    .end local v14    # "mainPackPath":Ljava/lang/String;
    add-int/lit8 v9, v9, 0x1

    goto :goto_6

    .line 316
    :cond_10
    iget-object v4, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-lez v4, :cond_11

    const/4 v4, 0x1

    goto :goto_5

    :cond_11
    const/4 v4, 0x0

    :goto_5
    if-eqz v4, :cond_12

    .line 317
    iget-object v4, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    :cond_12
    :goto_6
    const/4 v4, 0x1

    .end local v10    # "hasExtra":Z
    add-int/2addr v9, v4

    goto/16 :goto_2

    .line 322
    :cond_13
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_14

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    check-cast v4, Ljava/util/List;

    goto :goto_7

    :cond_14
    move-object v4, v0

    :goto_7
    iput-object v4, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    .line 323
    iget-boolean v4, v1, Lorg/godotengine/godot/Godot;->nativeLayerInitializeCompleted:Z

    if-nez v4, :cond_15

    .line 324
    nop

    .line 325
    iget-object v4, v1, Lorg/godotengine/godot/Godot;->godotNativeBridge:Lorg/godotengine/godot/nativeapi/GodotNativeBridge;

    .line 326
    iget-object v10, v1, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v17

    .line 327
    iget-object v10, v1, Lorg/godotengine/godot/Godot;->io:Lorg/godotengine/godot/GodotIO;

    .line 328
    iget-object v14, v1, Lorg/godotengine/godot/Godot;->netUtils:Lorg/godotengine/godot/utils/GodotNetUtils;

    .line 329
    iget-object v15, v1, Lorg/godotengine/godot/Godot;->directoryAccessHandler:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    .line 330
    move-object/from16 v23, v0

    .end local v0    # "newArgs":Ljava/util/List;
    .local v23, "newArgs":Ljava/util/List;
    iget-object v0, v1, Lorg/godotengine/godot/Godot;->fileAccessHandler:Lorg/godotengine/godot/io/file/FileAccessHandler;

    .line 331
    nop

    .line 324
    move-object/from16 v16, v4

    move-object/from16 v18, v10

    move-object/from16 v19, v14

    move-object/from16 v20, v15

    move-object/from16 v21, v0

    move/from16 v22, v7

    invoke-static/range {v16 .. v22}, Lorg/godotengine/godot/GodotLib;->initialize(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Landroid/content/res/AssetManager;Lorg/godotengine/godot/GodotIO;Lorg/godotengine/godot/utils/GodotNetUtils;Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;Lorg/godotengine/godot/io/file/FileAccessHandler;Z)Z

    move-result v0

    iput-boolean v0, v1, Lorg/godotengine/godot/Godot;->nativeLayerInitializeCompleted:Z

    .line 333
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    iget-boolean v4, v1, Lorg/godotengine/godot/Godot;->nativeLayerInitializeCompleted:Z

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Godot native layer initialization completed: "

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 323
    .end local v23    # "newArgs":Ljava/util/List;
    .restart local v0    # "newArgs":Ljava/util/List;
    :cond_15
    move-object/from16 v23, v0

    .line 336
    .end local v0    # "newArgs":Ljava/util/List;
    .restart local v23    # "newArgs":Ljava/util/List;
    :goto_8
    iget-boolean v0, v1, Lorg/godotengine/godot/Godot;->nativeLayerInitializeCompleted:Z

    if-eqz v0, :cond_17

    iget-boolean v0, v1, Lorg/godotengine/godot/Godot;->nativeLayerSetupCompleted:Z

    if-nez v0, :cond_17

    .line 337
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    iget-object v4, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Setting up native layer with params: "

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 338
    iget-object v0, v1, Lorg/godotengine/godot/Godot;->commandLine:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    .local v0, "$this$toTypedArray$iv":Ljava/util/Collection;
    const/4 v4, 0x0

    .line 1068
    .local v4, "$i$f$toTypedArray":I
    nop

    .line 1069
    move-object v10, v0

    .line 1071
    .local v10, "thisCollection$iv":Ljava/util/Collection;
    const/4 v14, 0x0

    new-array v15, v14, [Ljava/lang/String;

    invoke-interface {v10, v15}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v14

    .end local v0    # "$this$toTypedArray$iv":Ljava/util/Collection;
    .end local v4    # "$i$f$toTypedArray":I
    .end local v10    # "thisCollection$iv":Ljava/util/Collection;
    check-cast v14, [Ljava/lang/String;

    .line 338
    iget-object v0, v1, Lorg/godotengine/godot/Godot;->tts:Lorg/godotengine/godot/tts/GodotTTS;

    invoke-static {v14, v0}, Lorg/godotengine/godot/GodotLib;->setup([Ljava/lang/String;Lorg/godotengine/godot/tts/GodotTTS;)Z

    move-result v0

    iput-boolean v0, v1, Lorg/godotengine/godot/Godot;->nativeLayerSetupCompleted:Z

    .line 339
    iget-boolean v0, v1, Lorg/godotengine/godot/Godot;->nativeLayerSetupCompleted:Z

    if-eqz v0, :cond_16

    .line 342
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v4, "Godot native layer setup completed"

    invoke-static {v0, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 340
    :cond_16
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v4, "Unable to setup the Godot engine! Aborting..."

    invoke-direct {v0, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local v5    # "config":Landroid/content/res/Configuration;
    .end local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .end local p2    # "commandLineParams":Ljava/util/List;
    .end local p3    # "hostPlugins":Ljava/util/Set;
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 346
    .end local v7    # "useApkExpansion":Z
    .end local v9    # "i":I
    .end local v12    # "runtimePlugins":Ljava/util/Set;
    .end local v13    # "originalCommandLineParams":Ljava/util/List;
    .end local v23    # "newArgs":Ljava/util/List;
    .restart local v5    # "config":Landroid/content/res/Configuration;
    .restart local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .restart local p2    # "commandLineParams":Ljava/util/List;
    .restart local p3    # "hostPlugins":Ljava/util/Set;
    :cond_17
    :goto_9
    const/4 v4, 0x0

    const/4 v7, 0x4

    const/4 v9, 0x0

    invoke-static {v6, v8, v9, v7, v4}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 347
    nop

    .line 348
    invoke-direct/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->isNativeInitialized()Z

    move-result v0

    return v0

    .line 346
    :catchall_0
    move-exception v0

    const/4 v4, 0x0

    const/4 v7, 0x4

    const/4 v9, 0x0

    invoke-static {v6, v8, v9, v7, v4}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    throw v0
.end method

.method public final isEditorHint()Z
    .locals 1

    .line 1050
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/godotengine/godot/GodotLib;->isEditorHint()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isInEdgeToEdgeMode()Z
    .locals 1

    .line 451
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->isEdgeToEdge:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public final isInImmersiveMode()Z
    .locals 1

    .line 449
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->useImmersive:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public final isInitialized()Z
    .locals 1

    .line 222
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->isNativeInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isProjectManagerHint()Z
    .locals 1

    .line 1055
    sget-object v0, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lorg/godotengine/godot/GodotLib;->isProjectManagerHint()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isXrRuntime()Z
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->isXrRuntime$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public final onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 775
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 776
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1, p1, p2, p3}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainActivityResult(IILandroid/content/Intent;)V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 778
    :cond_0
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda17;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda17;-><init>(Lorg/godotengine/godot/Godot;IILandroid/content/Intent;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 781
    return-void
.end method

.method public final onBackPressed()V
    .locals 6

    .line 1027
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 1028
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    sget-object v2, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->getPluginName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invoking onMainBackPressed for plugin "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainBackPressed()Z

    goto :goto_0

    .line 1031
    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    :cond_0
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda15;

    invoke-direct {v0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda15;-><init>()V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 1032
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    const-string v0, "newConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 753
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 755
    iget v0, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v0, v0, 0x30

    const/16 v1, 0x20

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 756
    .local v0, "newDarkMode":Z
    :goto_0
    iget-boolean v1, p0, Lorg/godotengine/godot/Godot;->darkMode:Z

    if-eq v1, v0, :cond_1

    .line 757
    iput-boolean v0, p0, Lorg/godotengine/godot/Godot;->darkMode:Z

    .line 758
    new-instance v1, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda12;

    invoke-direct {v1}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda12;-><init>()V

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 763
    :cond_1
    iget v1, p0, Lorg/godotengine/godot/Godot;->orientation:I

    iget v2, p1, Landroid/content/res/Configuration;->orientation:I

    if-eq v1, v2, :cond_2

    .line 764
    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    iput v1, p0, Lorg/godotengine/godot/Godot;->orientation:I

    .line 765
    new-instance v1, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda13;

    invoke-direct {v1, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda13;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 769
    :cond_2
    return-void
.end method

.method public final onDestroy(Lorg/godotengine/godot/GodotHost;)V
    .locals 4
    .param p1, "primaryHost"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "primaryHost"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 731
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 732
    return-void

    .line 734
    :cond_0
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnDestroy: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 736
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 737
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainDestroy()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 740
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const-wide/16 v2, 0x5dc

    invoke-interface {v0, v2, v3}, Lorg/godotengine/godot/GodotRenderView;->blockingExitRenderer(J)Z

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    goto :goto_1

    :cond_2
    move v2, v1

    :goto_1
    if-nez v2, :cond_3

    .line 741
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v2, "Unable to exit the renderer within 1500 ms... Force quitting the process."

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 742
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->onGodotTerminating$lib_templateDebug()V

    .line 743
    invoke-virtual {p0, v1}, Lorg/godotengine/godot/Godot;->forceQuit$lib_templateDebug(I)Z

    .line 746
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    .line 747
    return-void
.end method

.method public final onGodotMainLoopStarted$lib_templateDebug()V
    .locals 2

    .line 841
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v1, "OnGodotMainLoopStarted"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 842
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->_runStatus:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/godotengine/godot/Godot$RunStatus;->STARTED:Lorg/godotengine/godot/Godot$RunStatus;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 844
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->accelerometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-string v1, "input_devices/sensors/enable_accelerometer"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 845
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->gravityEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-string v1, "input_devices/sensors/enable_gravity"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 846
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->gyroscopeEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-string v1, "input_devices/sensors/enable_gyroscope"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 847
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->magnetometerEnabled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const-string v1, "input_devices/sensors/enable_magnetometer"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 849
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda8;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda8;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 853
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 854
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onGodotMainLoopStarted()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 856
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->onGodotMainLoopStarted()V

    .line 857
    :cond_1
    return-void
.end method

.method public final onGodotSetupCompleted$lib_templateDebug()V
    .locals 13

    .line 808
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v1, "OnGodotSetupCompleted"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 811
    const-string v0, "input_devices/pointing/android/enable_long_press_as_right_click"

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 812
    .local v0, "longPressEnabled":Z
    const-string v1, "input_devices/pointing/android/enable_pan_and_scale_gestures"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v8

    .line 813
    .local v8, "panScaleEnabled":Z
    const-string v1, "input_devices/pointing/android/rotary_input_scroll_axis"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 814
    .local v9, "rotaryInputAxisValue":Ljava/lang/String;
    const-string v1, "input_devices/pointing/android/override_volume_buttons"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v10

    .line 815
    .local v10, "overrideVolumeButtons":Z
    const-string v1, "input_devices/pointing/android/disable_scroll_deadzone"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v11

    .line 817
    .local v11, "scrollDeadzoneDisabled":Z
    new-instance v12, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda6;

    move-object v1, v12

    move-object v2, p0

    move v3, v0

    move v4, v8

    move v5, v10

    move v6, v11

    move-object v7, v9

    invoke-direct/range {v1 .. v7}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda6;-><init>(Lorg/godotengine/godot/Godot;ZZZZLjava/lang/String;)V

    invoke-virtual {p0, v12}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 831
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

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

    .line 832
    .local v2, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v2}, Lorg/godotengine/godot/plugin/GodotPlugin;->onGodotSetupCompleted()V

    .end local v2    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 834
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v1, :cond_1

    invoke-interface {v1}, Lorg/godotengine/godot/GodotHost;->onGodotSetupCompleted()V

    .line 835
    :cond_1
    return-void
.end method

.method public final onGodotTerminating$lib_templateDebug()V
    .locals 2

    .line 863
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    const-string v1, "OnGodotTerminating"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 864
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->_runStatus:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lorg/godotengine/godot/Godot$RunStatus;->TERMINATING:Lorg/godotengine/godot/Godot$RunStatus;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 866
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 867
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onGodotTerminating()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 869
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->runOnTerminate:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 870
    :cond_1
    return-void
.end method

.method public final onInitRenderView(Lorg/godotengine/godot/GodotHost;)Landroid/widget/FrameLayout;
    .locals 2
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v1, v0}, Lorg/godotengine/godot/Godot;->onInitRenderView$default(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/GodotHost;Landroid/widget/FrameLayout;ILjava/lang/Object;)Landroid/widget/FrameLayout;

    move-result-object v0

    .line 650
    return-object v0
.end method

.method public final onInitRenderView(Lorg/godotengine/godot/GodotHost;Landroid/widget/FrameLayout;)Landroid/widget/FrameLayout;
    .locals 20
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;
    .param p2, "providedContainerLayout"    # Landroid/widget/FrameLayout;

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    const-string v0, "host"

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "providedContainerLayout"

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 500
    invoke-direct/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->isNativeInitialized()Z

    move-result v0

    if-eqz v0, :cond_19

    .line 504
    const-string v10, "Startup"

    const-string v11, "Godot::onInitRenderView"

    invoke-static {v10, v11}, Lorg/godotengine/godot/utils/BenchmarkUtils;->beginBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnInitRenderView: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    nop

    .line 507
    const/4 v12, 0x4

    const/4 v13, 0x0

    const/4 v14, 0x0

    :try_start_0
    iput-object v8, v7, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    .line 508
    invoke-virtual/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_0

    const/high16 v1, 0x200000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 510
    :cond_0
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_4

    .line 511
    iget-boolean v0, v7, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z

    if-eqz v0, :cond_3

    .line 512
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 642
    iget-boolean v1, v7, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z

    if-nez v1, :cond_2

    .line 643
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 644
    :cond_1
    iput-object v13, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    .line 647
    :cond_2
    invoke-static {v10, v11, v14, v12, v13}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 512
    return-object v0

    .line 511
    :cond_3
    :try_start_1
    const-string v0, "Assertion failed"

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .end local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .end local p2    # "providedContainerLayout":Landroid/widget/FrameLayout;
    throw v1

    .line 515
    .restart local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .restart local p2    # "providedContainerLayout":Landroid/widget/FrameLayout;
    :cond_4
    iput-object v9, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    .line 516
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 517
    :cond_5
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    const/4 v15, -0x1

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_7

    :cond_6
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 518
    nop

    .line 519
    nop

    .line 517
    invoke-direct {v0, v15, v15}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 521
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_7
    iput v15, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 522
    iput v15, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 523
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_8

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 526
    :cond_8
    new-instance v1, Lorg/godotengine/godot/input/GodotEditText;

    iget-object v2, v7, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lorg/godotengine/godot/input/GodotEditText;-><init>(Landroid/content/Context;)V

    move-object v6, v1

    .line 527
    .local v6, "editText":Lorg/godotengine/godot/input/GodotEditText;
    nop

    .line 528
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 529
    nop

    .line 530
    iget-object v2, v7, Lorg/godotengine/godot/Godot;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lorg/godotengine/godot/R$dimen;->text_edit_height:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    .line 528
    invoke-direct {v1, v15, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 527
    invoke-virtual {v6, v1}, Lorg/godotengine/godot/input/GodotEditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 533
    invoke-virtual {v6, v14}, Lorg/godotengine/godot/input/GodotEditText;->setBackgroundColor(I)V

    .line 535
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_9

    move-object v2, v6

    check-cast v2, Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 539
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->isProjectManagerHint()Z

    move-result v1

    if-nez v1, :cond_a

    .line 540
    invoke-virtual/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->isEditorHint()Z

    move-result v1

    if-nez v1, :cond_a

    .line 541
    const-string v1, "display/window/per_pixel_transparency/allowed"

    invoke-static {v1}, Lorg/godotengine/godot/GodotLib;->getGlobal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/4 v1, 0x1

    goto :goto_0

    :cond_a
    move v1, v14

    .line 538
    :goto_0
    move v4, v1

    .line 542
    .local v4, "shouldBeTransparent":Z
    sget-object v1, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Render view should be transparent: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    invoke-direct/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->getNativeRenderer()Ljava/lang/String;

    move-result-object v1

    move-object v3, v1

    .line 545
    .local v3, "nativeRenderer":Ljava/lang/String;
    const-string v1, "vulkan"

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 546
    new-instance v1, Lorg/godotengine/godot/GodotVulkanRenderView;

    iget-object v2, v7, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-direct {v1, v7, v2, v4}, Lorg/godotengine/godot/GodotVulkanRenderView;-><init>(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/input/GodotInputHandler;Z)V

    check-cast v1, Lorg/godotengine/godot/GodotRenderView;

    iput-object v1, v7, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    move-object/from16 v19, v3

    move/from16 v18, v4

    move-object v13, v6

    const/4 v12, 0x1

    goto :goto_1

    .line 547
    :cond_b
    const-string v1, "opengl3"

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 548
    new-instance v16, Lorg/godotengine/godot/GodotGLRenderView;

    iget-object v2, v7, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    iget-object v1, v7, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    iget-boolean v5, v7, Lorg/godotengine/godot/Godot;->useDebugOpengl:Z

    move-object/from16 v17, v1

    move-object/from16 v1, v16

    move-object/from16 v18, v2

    move-object/from16 v2, p0

    move-object/from16 v19, v3

    .end local v3    # "nativeRenderer":Ljava/lang/String;
    .local v19, "nativeRenderer":Ljava/lang/String;
    move-object/from16 v3, v18

    move/from16 v18, v4

    .end local v4    # "shouldBeTransparent":Z
    .local v18, "shouldBeTransparent":Z
    move-object/from16 v4, v17

    const/4 v12, 0x1

    move-object v13, v6

    .end local v6    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    .local v13, "editText":Lorg/godotengine/godot/input/GodotEditText;
    move/from16 v6, v18

    invoke-direct/range {v1 .. v6}, Lorg/godotengine/godot/GodotGLRenderView;-><init>(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/input/GodotInputHandler;Lorg/godotengine/godot/xr/XRMode;ZZ)V

    move-object/from16 v1, v16

    check-cast v1, Lorg/godotengine/godot/GodotRenderView;

    iput-object v1, v7, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    .line 553
    :goto_1
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v1, :cond_d

    .local v1, "it":Lorg/godotengine/godot/GodotRenderView;
    const/4 v2, 0x0

    .line 554
    .local v2, "$i$a$-let-Godot$onInitRenderView$1":I
    invoke-interface {v1}, Lorg/godotengine/godot/GodotRenderView;->startRenderer()V

    .line 555
    iget-object v3, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v3, :cond_c

    .line 556
    invoke-interface {v1}, Lorg/godotengine/godot/GodotRenderView;->getView()Landroid/view/SurfaceView;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    .line 557
    new-instance v5, Landroid/view/ViewGroup$LayoutParams;

    .line 558
    nop

    .line 559
    nop

    .line 557
    invoke-direct {v5, v15, v15}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 555
    invoke-virtual {v3, v4, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 561
    :cond_c
    nop

    .line 553
    .end local v1    # "it":Lorg/godotengine/godot/GodotRenderView;
    .end local v2    # "$i$a$-let-Godot$onInitRenderView$1":I
    :cond_d
    nop

    .line 564
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    invoke-virtual {v13, v1}, Lorg/godotengine/godot/input/GodotEditText;->setView(Lorg/godotengine/godot/GodotRenderView;)V

    .line 565
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->io:Lorg/godotengine/godot/GodotIO;

    invoke-virtual {v1, v13}, Lorg/godotengine/godot/GodotIO;->setEdit(Lorg/godotengine/godot/input/GodotEditText;)V

    .line 567
    invoke-interface/range {p1 .. p1}, Lorg/godotengine/godot/GodotHost;->getActivity()Landroid/app/Activity;

    move-result-object v1

    .line 569
    .local v1, "activity":Landroid/app/Activity;
    if-eqz v1, :cond_e

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    if-eqz v2, :cond_e

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_f

    :cond_e
    move-object v2, v9

    check-cast v2, Landroid/view/View;

    .line 571
    .local v2, "topView":Landroid/view/View;
    :cond_f
    new-instance v3, Lorg/godotengine/godot/Godot$onInitRenderView$2;

    invoke-direct {v3, v2, v7}, Lorg/godotengine/godot/Godot$onInitRenderView$2;-><init>(Landroid/view/View;Lorg/godotengine/godot/Godot;)V

    check-cast v3, Landroidx/core/view/WindowInsetsAnimationCompat$Callback;

    invoke-static {v2, v3}, Landroidx/core/view/ViewCompat;->setWindowInsetsAnimationCallback(Landroid/view/View;Landroidx/core/view/WindowInsetsAnimationCompat$Callback;)V

    .line 620
    iget-object v3, v7, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v3, :cond_10

    new-instance v4, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda14;

    invoke-direct {v4, v7}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda14;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-interface {v3, v4}, Lorg/godotengine/godot/GodotRenderView;->queueOnRenderThread(Ljava/lang/Runnable;)V

    .line 630
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v3

    invoke-virtual {v3}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_11
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_13

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 631
    .local v4, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v4, v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainCreate(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v5

    .line 632
    .local v5, "pluginView":Landroid/view/View;
    if-eqz v5, :cond_11

    .line 633
    invoke-virtual {v4}, Lorg/godotengine/godot/plugin/GodotPlugin;->shouldBeOnTop()Z

    move-result v6

    if-eqz v6, :cond_12

    .line 634
    iget-object v6, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v6, :cond_11

    invoke-virtual {v6, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    goto :goto_2

    .line 636
    :cond_12
    iget-object v6, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v6, :cond_11

    invoke-virtual {v6, v5, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    goto :goto_2

    .line 640
    .end local v4    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    .end local v5    # "pluginView":Landroid/view/View;
    :cond_13
    iput-boolean v12, v7, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 642
    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v1    # "activity":Landroid/app/Activity;
    .end local v2    # "topView":Landroid/view/View;
    .end local v13    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    .end local v18    # "shouldBeTransparent":Z
    .end local v19    # "nativeRenderer":Ljava/lang/String;
    iget-boolean v0, v7, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z

    if-nez v0, :cond_15

    .line 643
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 644
    :cond_14
    const/4 v1, 0x0

    iput-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    goto :goto_3

    .line 642
    :cond_15
    const/4 v1, 0x0

    .line 647
    :goto_3
    const/4 v2, 0x4

    invoke-static {v10, v11, v14, v2, v1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    .line 648
    nop

    .line 649
    iget-object v0, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    return-object v0

    .line 550
    .restart local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .restart local v3    # "nativeRenderer":Ljava/lang/String;
    .local v4, "shouldBeTransparent":Z
    .restart local v6    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    :cond_16
    move-object/from16 v19, v3

    move/from16 v18, v4

    move-object v13, v6

    .end local v3    # "nativeRenderer":Ljava/lang/String;
    .end local v4    # "shouldBeTransparent":Z
    .end local v6    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    .restart local v13    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    .restart local v18    # "shouldBeTransparent":Z
    .restart local v19    # "nativeRenderer":Ljava/lang/String;
    :try_start_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No native renderer is available."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .end local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .end local p2    # "providedContainerLayout":Landroid/widget/FrameLayout;
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 642
    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v13    # "editText":Lorg/godotengine/godot/input/GodotEditText;
    .end local v18    # "shouldBeTransparent":Z
    .end local v19    # "nativeRenderer":Ljava/lang/String;
    .restart local p1    # "host":Lorg/godotengine/godot/GodotHost;
    .restart local p2    # "providedContainerLayout":Landroid/widget/FrameLayout;
    :catchall_0
    move-exception v0

    iget-boolean v1, v7, Lorg/godotengine/godot/Godot;->renderViewInitialized:Z

    if-nez v1, :cond_18

    .line 643
    iget-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_17

    invoke-virtual {v1}, Landroid/widget/FrameLayout;->removeAllViews()V

    .line 644
    :cond_17
    const/4 v1, 0x0

    iput-object v1, v7, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    goto :goto_4

    .line 642
    :cond_18
    const/4 v1, 0x0

    .line 647
    :goto_4
    const/4 v2, 0x4

    invoke-static {v10, v11, v14, v2, v1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)V

    throw v0

    .line 501
    :cond_19
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "initEngine(...) must be invoked successfully prior to initializing the render view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final onPause(Lorg/godotengine/godot/GodotHost;)V
    .locals 3
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 705
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnPause: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/godotengine/godot/Godot;->resumed:Z

    .line 707
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 708
    return-void

    .line 711
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 712
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainPause()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 714
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/godotengine/godot/GodotRenderView;->onActivityPaused()V

    .line 715
    :cond_2
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->getMSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v1, p0, Lorg/godotengine/godot/Godot;->godotInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    check-cast v1, Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 716
    :cond_3
    return-void
.end method

.method public final onPictureInPictureModeChanged$lib_templateDebug(Z)V
    .locals 3
    .param p1, "isInPictureInPictureMode"    # Z

    .line 698
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onPictureInPictureModeChanged: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 699
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda18;

    invoke-direct {v0, p1}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda18;-><init>(Z)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 702
    return-void
.end method

.method public final onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "grantResults"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 791
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 792
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1, p1, p2, p3}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 794
    :cond_0
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda11;

    invoke-direct {v0, p2, p3}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda11;-><init>([Ljava/lang/String;[I)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 802
    return-void
.end method

.method public final onResume(Lorg/godotengine/godot/GodotHost;)V
    .locals 3
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 665
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnResume: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/Godot;->resumed:Z

    .line 667
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 668
    return-void

    .line 671
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/godotengine/godot/GodotRenderView;->onActivityResumed()V

    .line 672
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/Godot;->registerSensorsIfNeeded()V

    .line 673
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 674
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainResume()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 676
    :cond_2
    return-void
.end method

.method public final onStart(Lorg/godotengine/godot/GodotHost;)V
    .locals 3
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 653
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnStart: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 655
    return-void

    .line 658
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/godotengine/godot/GodotRenderView;->onActivityStarted()V

    .line 659
    :cond_1
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 660
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainStart()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 662
    :cond_2
    return-void
.end method

.method public final onStop(Lorg/godotengine/godot/GodotHost;)V
    .locals 3
    .param p1, "host"    # Lorg/godotengine/godot/GodotHost;

    const-string v0, "host"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 719
    sget-object v0, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "OnStop: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 721
    return-void

    .line 724
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getPluginRegistry$lib_templateDebug()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getAllPlugins()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/plugin/GodotPlugin;

    .line 725
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onMainStop()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 727
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lorg/godotengine/godot/GodotRenderView;->onActivityStopped()V

    .line 728
    :cond_2
    return-void
.end method

.method public final requestPermission(Ljava/lang/String;)Z
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 1035
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1036
    .local v0, "activity":Landroid/app/Activity;
    :cond_0
    invoke-static {p1, v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestPermission(Ljava/lang/String;Landroid/app/Activity;)Z

    move-result v1

    return v1
.end method

.method public final requestPermissions()Z
    .locals 1

    .line 1040
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestManifestPermissions(Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method

.method public final runOnHostThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "action"    # Ljava/lang/Runnable;

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 912
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 913
    :cond_0
    return-void
.end method

.method public final runOnRenderThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "action"    # Ljava/lang/Runnable;

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 905
    iget-object v0, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotRenderView;->queueOnRenderThread(Ljava/lang/Runnable;)V

    .line 906
    :cond_0
    return-void
.end method

.method public final setClipboard(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .line 986
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda19;

    invoke-direct {v0, p0, p1}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda19;-><init>(Lorg/godotengine/godot/Godot;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 989
    return-void
.end method

.method public final setContainerLayout$lib_templateDebug(Landroid/widget/FrameLayout;)V
    .locals 0
    .param p1, "<set-?>"    # Landroid/widget/FrameLayout;

    .line 211
    iput-object p1, p0, Lorg/godotengine/godot/Godot;->containerLayout:Landroid/widget/FrameLayout;

    return-void
.end method

.method public final setDarkMode$lib_templateDebug(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 205
    iput-boolean p1, p0, Lorg/godotengine/godot/Godot;->darkMode:Z

    return-void
.end method

.method public final setKeepScreenOn$lib_templateDebug(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 953
    new-instance v0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda9;

    invoke-direct {v0, p1, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda9;-><init>(ZLorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 960
    return-void
.end method

.method public final setPrimaryHost$lib_templateDebug(Lorg/godotengine/godot/GodotHost;)V
    .locals 0
    .param p1, "<set-?>"    # Lorg/godotengine/godot/GodotHost;

    .line 183
    iput-object p1, p0, Lorg/godotengine/godot/Godot;->primaryHost:Lorg/godotengine/godot/GodotHost;

    return-void
.end method

.method public final setRenderView(Lorg/godotengine/godot/GodotRenderView;)V
    .locals 0
    .param p1, "<set-?>"    # Lorg/godotengine/godot/GodotRenderView;

    .line 212
    iput-object p1, p0, Lorg/godotengine/godot/Godot;->renderView:Lorg/godotengine/godot/GodotRenderView;

    return-void
.end method

.method public final setSystemBarsAppearance()V
    .locals 5

    .line 454
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 455
    .local v0, "window":Landroid/view/Window;
    :cond_0
    invoke-direct {p0, v0}, Lorg/godotengine/godot/Godot;->getWindowBackgroundColor(Landroid/view/Window;)I

    move-result v1

    invoke-static {v1}, Landroidx/core/graphics/ColorUtils;->calculateLuminance(I)D

    move-result-wide v1

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    cmpl-double v1, v1, v3

    if-lez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 457
    .local v1, "isLight":Z
    :goto_0
    new-instance v2, Landroidx/core/view/WindowInsetsControllerCompat;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    invoke-direct {v2, v0, v3}, Landroidx/core/view/WindowInsetsControllerCompat;-><init>(Landroid/view/Window;Landroid/view/View;)V

    .line 458
    .local v2, "controller":Landroidx/core/view/WindowInsetsControllerCompat;
    invoke-virtual {v2, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightNavigationBars(Z)V

    .line 459
    invoke-virtual {v2, v1}, Landroidx/core/view/WindowInsetsControllerCompat;->setAppearanceLightStatusBars(Z)V

    .line 460
    return-void

    .line 454
    .end local v0    # "window":Landroid/view/Window;
    .end local v1    # "isLight":Z
    .end local v2    # "controller":Landroidx/core/view/WindowInsetsControllerCompat;
    :cond_2
    :goto_1
    return-void
.end method

.method public final setWindowColor(Ljava/lang/String;)V
    .locals 4
    .param p1, "colorStr"    # Ljava/lang/String;

    const-string v0, "colorStr"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 472
    nop

    .line 473
    move-object v0, p1

    .local v0, "$this$toColorInt$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1072
    .local v1, "$i$f$toColorInt":I
    :try_start_0
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 472
    .end local v0    # "$this$toColorInt$iv":Ljava/lang/String;
    .end local v1    # "$i$f$toColorInt":I
    move v0, v2

    .line 478
    .local v0, "color":I
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 479
    .local v1, "decorView":Landroid/view/View;
    :cond_0
    new-instance v2, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1, v0, p0}, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda0;-><init>(Landroid/view/View;ILorg/godotengine/godot/Godot;)V

    invoke-virtual {p0, v2}, Lorg/godotengine/godot/Godot;->runOnHostThread(Ljava/lang/Runnable;)V

    .line 484
    return-void

    .line 478
    .end local v1    # "decorView":Landroid/view/View;
    :cond_1
    :goto_0
    return-void

    .line 474
    .end local v0    # "color":I
    :catch_0
    move-exception v0

    .line 475
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v1, Lorg/godotengine/godot/Godot;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to parse background color: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 476
    return-void
.end method

.method public final setXrMode$lib_templateDebug(Lorg/godotengine/godot/xr/XRMode;)V
    .locals 1
    .param p1, "<set-?>"    # Lorg/godotengine/godot/xr/XRMode;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 201
    iput-object p1, p0, Lorg/godotengine/godot/Godot;->xrMode:Lorg/godotengine/godot/xr/XRMode;

    return-void
.end method
