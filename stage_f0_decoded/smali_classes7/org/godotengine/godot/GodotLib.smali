.class public Lorg/godotengine/godot/GodotLib;
.super Ljava/lang/Object;
.source "GodotLib.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    const-string v0, "godot_android"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native accelerometer(FFF)V
.end method

.method public static native back()V
.end method

.method public static calldeferred(JLjava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "p_id"    # J
    .param p2, "p_method"    # Ljava/lang/String;
    .param p3, "p_params"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 259
    invoke-static {p0, p1, p2, p3}, Lorg/godotengine/godot/variant/Callable;->callDeferred(JLjava/lang/String;[Ljava/lang/Object;)V

    .line 260
    return-void
.end method

.method public static callobject(JLjava/lang/String;[Ljava/lang/Object;)V
    .locals 0
    .param p0, "p_id"    # J
    .param p2, "p_method"    # Ljava/lang/String;
    .param p3, "p_params"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 246
    invoke-static {p0, p1, p2, p3}, Lorg/godotengine/godot/variant/Callable;->call(JLjava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    return-void
.end method

.method public static native dispatchMouseEvent(IIFFFFZZFFF)V
.end method

.method public static native dispatchTouchEvent(III[FZ)V
.end method

.method public static native filePickerCallback(Z[Ljava/lang/String;)V
.end method

.method public static native focusin()V
.end method

.method public static native focusout()V
.end method

.method public static native getEditorProjectMetadata(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method public static native getEditorSetting(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native getGlobal(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public static native getProjectResourceDir()Ljava/lang/String;
.end method

.method public static native getRendererInfo(Z)[Ljava/lang/String;
.end method

.method public static native gravity(FFF)V
.end method

.method public static native gyroscope(FFF)V
.end method

.method public static native hardwareKeyboardConnected(Z)V
.end method

.method static native hasFeature(Ljava/lang/String;)Z
.end method

.method public static native initialize(Lorg/godotengine/godot/nativeapi/GodotNativeBridge;Landroid/content/res/AssetManager;Lorg/godotengine/godot/GodotIO;Lorg/godotengine/godot/utils/GodotNetUtils;Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;Lorg/godotengine/godot/io/file/FileAccessHandler;Z)Z
.end method

.method static native isEditorHint()Z
.end method

.method static native isProjectManagerHint()Z
.end method

.method public static native joyaxis(IIF)V
.end method

.method public static native joybutton(IIZ)V
.end method

.method public static native joyconnectionchanged(IZLjava/lang/String;)V
.end method

.method public static native joyhat(III)V
.end method

.method public static native key(IIIZZ)V
.end method

.method public static native magnetometer(FFF)V
.end method

.method public static native magnify(FFF)V
.end method

.method public static native newcontext(Landroid/view/Surface;)V
.end method

.method public static native onNightModeChanged()V
.end method

.method static native onOrientationChange(I)V
.end method

.method static native onPictureInPictureModeChanged(Z)V
.end method

.method public static native onRendererPaused()V
.end method

.method public static native onRendererResumed()V
.end method

.method public static native ondestroy()V
.end method

.method public static native pan(FFFF)V
.end method

.method public static native requestPermissionResult(Ljava/lang/String;Z)V
.end method

.method public static native resize(Landroid/view/Surface;II)V
.end method

.method public static native setEditorProjectMetadata(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public static native setEditorSetting(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public static native setVirtualKeyboardHeight(I)V
.end method

.method public static native setup([Ljava/lang/String;Lorg/godotengine/godot/tts/GodotTTS;)Z
.end method

.method public static native shouldDispatchInputToRenderThread()Z
.end method

.method public static native step()Z
.end method

.method public static native ttsCallback(IJI)V
.end method
