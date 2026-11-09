.class public final Lorg/godotengine/godot/editor/utils/EditorUtils;
.super Ljava/lang/Object;
.source "EditorUtils.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J$\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\tH\u0087 \u00a2\u0006\u0002\u0010\nJ\u0011\u0010\u000b\u001a\u00020\u00052\u0006\u0010\u000c\u001a\u00020\rH\u0087 \u00a8\u0006\u000e"
    }
    d2 = {
        "Lorg/godotengine/godot/editor/utils/EditorUtils;",
        "",
        "<init>",
        "()V",
        "runScene",
        "",
        "scene",
        "",
        "sceneArgs",
        "",
        "(Ljava/lang/String;[Ljava/lang/String;)V",
        "toggleTitleBar",
        "visible",
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


# static fields
.field public static final INSTANCE:Lorg/godotengine/godot/editor/utils/EditorUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lorg/godotengine/godot/editor/utils/EditorUtils;

    invoke-direct {v0}, Lorg/godotengine/godot/editor/utils/EditorUtils;-><init>()V

    sput-object v0, Lorg/godotengine/godot/editor/utils/EditorUtils;->INSTANCE:Lorg/godotengine/godot/editor/utils/EditorUtils;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native runScene(Ljava/lang/String;[Ljava/lang/String;)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native toggleTitleBar(Z)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method
