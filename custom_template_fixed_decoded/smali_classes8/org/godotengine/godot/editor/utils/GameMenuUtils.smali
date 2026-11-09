.class public final Lorg/godotengine/godot/editor/utils/GameMenuUtils;
.super Ljava/lang/Object;
.source "GameMenuUtils.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\r\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001!B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0011\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0087 J\t\u0010\u000b\u001a\u00020\u0008H\u0087 J\u0011\u0010\u000c\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000eH\u0087 J\u0011\u0010\u000f\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000eH\u0087 J\u0011\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\nH\u0087 J\u0011\u0010\u0013\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0087 J\u0011\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0010\u001a\u00020\u000eH\u0087 J\t\u0010\u0015\u001a\u00020\u0008H\u0087 J\t\u0010\u0016\u001a\u00020\u0008H\u0087 J\t\u0010\u0017\u001a\u00020\u0008H\u0087 J\u0011\u0010\u0018\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0087 J\t\u0010\u0019\u001a\u00020\u0008H\u0087 J\u0011\u0010\u001a\u001a\u00020\u00082\u0006\u0010\u001b\u001a\u00020\u001cH\u0087 J\u0006\u0010\u001d\u001a\u00020\u001eJ\u000e\u0010\u001f\u001a\u00020\u00082\u0006\u0010 \u001a\u00020\u001eR\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\""
    }
    d2 = {
        "Lorg/godotengine/godot/editor/utils/GameMenuUtils;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "setSuspend",
        "",
        "enabled",
        "",
        "nextFrame",
        "setNodeType",
        "type",
        "",
        "setSelectMode",
        "mode",
        "setSelectionVisible",
        "visible",
        "setCameraOverride",
        "setCameraManipulateMode",
        "resetCamera2DPosition",
        "resetCamera3DPosition",
        "playMainScene",
        "setDebugMuteAudio",
        "resetTimeScale",
        "setTimeScale",
        "scale",
        "",
        "fetchGameEmbedMode",
        "Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;",
        "saveGameEmbedMode",
        "gameEmbedMode",
        "GameEmbedMode",
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
.field public static final INSTANCE:Lorg/godotengine/godot/editor/utils/GameMenuUtils;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lorg/godotengine/godot/editor/utils/GameMenuUtils;

    invoke-direct {v0}, Lorg/godotengine/godot/editor/utils/GameMenuUtils;-><init>()V

    sput-object v0, Lorg/godotengine/godot/editor/utils/GameMenuUtils;->INSTANCE:Lorg/godotengine/godot/editor/utils/GameMenuUtils;

    .line 42
    const-class v0, Lorg/godotengine/godot/editor/utils/GameMenuUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/editor/utils/GameMenuUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final native nextFrame()V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native playMainScene()V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native resetCamera2DPosition()V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native resetCamera3DPosition()V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native resetTimeScale()V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setCameraManipulateMode(I)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setCameraOverride(Z)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setDebugMuteAudio(Z)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setNodeType(I)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setSelectMode(I)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setSelectionVisible(Z)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setSuspend(Z)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method

.method public static final native setTimeScale(D)V
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method


# virtual methods
.method public final fetchGameEmbedMode()Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;
    .locals 4

    .line 111
    nop

    .line 112
    :try_start_0
    const-string v0, "run/window_placement/game_embed_mode"

    invoke-static {v0}, Lorg/godotengine/godot/GodotLib;->getEditorSetting(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 113
    .local v0, "gameEmbedModeValue":I
    sget-object v1, Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;->Companion:Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode$Companion;

    invoke-virtual {v1, v0}, Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode$Companion;->fromNativeValue$lib_templateDebug(I)Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v1, Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;->AUTO:Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .local v1, "gameEmbedMode":Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;
    :cond_0
    return-object v1

    .line 115
    .end local v0    # "gameEmbedModeValue":I
    .end local v1    # "gameEmbedMode":Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/editor/utils/GameMenuUtils;->TAG:Ljava/lang/String;

    const-string v2, "Unable to retrieve game embed mode"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 117
    sget-object v1, Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;->AUTO:Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;

    return-object v1
.end method

.method public final saveGameEmbedMode(Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;)V
    .locals 2
    .param p1, "gameEmbedMode"    # Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;

    const-string v0, "gameEmbedMode"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    invoke-virtual {p1}, Lorg/godotengine/godot/editor/utils/GameMenuUtils$GameEmbedMode;->getNativeValue$lib_templateDebug()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "run/window_placement/game_embed_mode"

    invoke-static {v1, v0}, Lorg/godotengine/godot/GodotLib;->setEditorSetting(Ljava/lang/String;Ljava/lang/Object;)V

    .line 128
    return-void
.end method
