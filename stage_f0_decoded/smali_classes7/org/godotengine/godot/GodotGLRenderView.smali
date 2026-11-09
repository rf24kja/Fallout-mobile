.class Lorg/godotengine/godot/GodotGLRenderView;
.super Lorg/godotengine/godot/gl/GLSurfaceView;
.source "GodotGLRenderView.java"

# interfaces
.implements Lorg/godotengine/godot/GodotRenderView;


# instance fields
.field private final customPointerIcons:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/view/PointerIcon;",
            ">;"
        }
    .end annotation
.end field

.field private final godot:Lorg/godotengine/godot/Godot;

.field private final godotRenderer:Lorg/godotengine/godot/gl/GodotRenderer;

.field private final inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;


# direct methods
.method public static synthetic $r8$lambda$ct8N6pWSOp97Py4RveklFKw5w2A(Lorg/godotengine/godot/GodotGLRenderView;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/GodotGLRenderView;->lambda$onActivityPaused$0()V

    return-void
.end method

.method public static synthetic $r8$lambda$idEEj0Xes1JX4PC9yAyHGAq2UD8(Lorg/godotengine/godot/GodotGLRenderView;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/GodotGLRenderView;->lambda$onActivityResumed$1()V

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/input/GodotInputHandler;Lorg/godotengine/godot/xr/XRMode;ZZ)V
    .locals 2
    .param p1, "godot"    # Lorg/godotengine/godot/Godot;
    .param p2, "inputHandler"    # Lorg/godotengine/godot/input/GodotInputHandler;
    .param p3, "xrMode"    # Lorg/godotengine/godot/xr/XRMode;
    .param p4, "useDebugOpengl"    # Z
    .param p5, "shouldBeTranslucent"    # Z

    .line 85
    invoke-virtual {p1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/godotengine/godot/gl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    .line 82
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->customPointerIcons:Landroid/util/SparseArray;

    .line 87
    iput-object p1, p0, Lorg/godotengine/godot/GodotGLRenderView;->godot:Lorg/godotengine/godot/Godot;

    .line 88
    iput-object p2, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    .line 89
    new-instance v0, Lorg/godotengine/godot/gl/GodotRenderer;

    invoke-direct {v0}, Lorg/godotengine/godot/gl/GodotRenderer;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->godotRenderer:Lorg/godotengine/godot/gl/GodotRenderer;

    .line 90
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-static {v0, v1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 91
    invoke-direct {p0, p3, p5, p4}, Lorg/godotengine/godot/GodotGLRenderView;->init(Lorg/godotengine/godot/xr/XRMode;ZZ)V

    .line 92
    return-void
.end method

.method private init(Lorg/godotengine/godot/xr/XRMode;ZZ)V
    .locals 9
    .param p1, "xrMode"    # Lorg/godotengine/godot/xr/XRMode;
    .param p2, "translucent"    # Z
    .param p3, "useDebugOpengl"    # Z

    .line 244
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setPreserveEGLContextOnPause(Z)V

    .line 245
    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setFocusableInTouchMode(Z)V

    .line 246
    sget-object v0, Lorg/godotengine/godot/GodotGLRenderView$1;->$SwitchMap$org$godotengine$godot$xr$XRMode:[I

    invoke-virtual {p1}, Lorg/godotengine/godot/xr/XRMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 265
    if-eqz p2, :cond_0

    .line 266
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    goto :goto_0

    .line 249
    :pswitch_0
    new-instance v0, Lorg/godotengine/godot/xr/ovr/OvrConfigChooser;

    invoke-direct {v0}, Lorg/godotengine/godot/xr/ovr/OvrConfigChooser;-><init>()V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setEGLConfigChooser(Lorg/godotengine/godot/gl/GLSurfaceView$EGLConfigChooser;)V

    .line 252
    new-instance v0, Lorg/godotengine/godot/xr/ovr/OvrContextFactory;

    invoke-direct {v0}, Lorg/godotengine/godot/xr/ovr/OvrContextFactory;-><init>()V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setEGLContextFactory(Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;)V

    .line 255
    new-instance v0, Lorg/godotengine/godot/xr/ovr/OvrWindowSurfaceFactory;

    invoke-direct {v0}, Lorg/godotengine/godot/xr/ovr/OvrWindowSurfaceFactory;-><init>()V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setEGLWindowSurfaceFactory(Lorg/godotengine/godot/gl/GLSurfaceView$EGLWindowSurfaceFactory;)V

    .line 256
    goto :goto_1

    .line 272
    :cond_0
    :goto_0
    new-instance v0, Lorg/godotengine/godot/xr/regular/RegularContextFactory;

    invoke-direct {v0, p3}, Lorg/godotengine/godot/xr/regular/RegularContextFactory;-><init>(Z)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setEGLContextFactory(Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;)V

    .line 280
    new-instance v0, Lorg/godotengine/godot/xr/regular/RegularFallbackConfigChooser;

    new-instance v8, Lorg/godotengine/godot/xr/regular/RegularConfigChooser;

    const/16 v6, 0x10

    const/4 v7, 0x0

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/16 v4, 0x8

    const/16 v5, 0x8

    move-object v1, v8

    invoke-direct/range {v1 .. v7}, Lorg/godotengine/godot/xr/regular/RegularConfigChooser;-><init>(IIIIII)V

    const/16 v6, 0x18

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lorg/godotengine/godot/xr/regular/RegularFallbackConfigChooser;-><init>(IIIIIILorg/godotengine/godot/xr/regular/RegularConfigChooser;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setEGLConfigChooser(Lorg/godotengine/godot/gl/GLSurfaceView$EGLConfigChooser;)V

    .line 285
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private synthetic lambda$onActivityPaused$0()V
    .locals 1

    .line 107
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->focusout()V

    .line 109
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->godotRenderer:Lorg/godotengine/godot/gl/GodotRenderer;

    invoke-virtual {v0}, Lorg/godotengine/godot/gl/GodotRenderer;->onActivityPaused()V

    .line 110
    return-void
.end method

.method private synthetic lambda$onActivityResumed$1()V
    .locals 1

    .line 122
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->godotRenderer:Lorg/godotengine/godot/gl/GodotRenderer;

    invoke-virtual {v0}, Lorg/godotengine/godot/gl/GodotRenderer;->onActivityResumed()V

    .line 123
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->focusin()V

    .line 124
    return-void
.end method


# virtual methods
.method public blockingExitRenderer(J)Z
    .locals 1
    .param p1, "blockingTimeInMs"    # J

    .line 134
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/GodotGLRenderView;->requestRenderThreadExitAndWait(J)Z

    move-result v0

    return v0
.end method

.method public canCapturePointer()Z
    .locals 1

    .line 178
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isXrRuntime()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0}, Lorg/godotengine/godot/input/GodotInputHandler;->canCapturePointer()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public configurePointerIcon(ILjava/lang/String;FF)V
    .locals 4
    .param p1, "pointerType"    # I
    .param p2, "imagePath"    # Ljava/lang/String;
    .param p3, "hotSpotX"    # F
    .param p4, "hotSpotY"    # F

    .line 204
    const/4 v0, 0x0

    .line 205
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 206
    iget-object v1, p0, Lorg/godotengine/godot/GodotGLRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getDirectoryAccessHandler()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->filesystemFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    invoke-static {p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    move-object v0, v1

    goto :goto_0

    .line 209
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/GodotGLRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getDirectoryAccessHandler()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 211
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 212
    .local v1, "am":Landroid/content/res/AssetManager;
    invoke-virtual {v1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 213
    .local v2, "imageInputStream":Ljava/io/InputStream;
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    move-object v0, v3

    .line 217
    .end local v1    # "am":Landroid/content/res/AssetManager;
    .end local v2    # "imageInputStream":Ljava/io/InputStream;
    :cond_1
    :goto_0
    invoke-static {v0, p3, p4}, Landroid/view/PointerIcon;->create(Landroid/graphics/Bitmap;FF)Landroid/view/PointerIcon;

    move-result-object v1

    .line 218
    .local v1, "customPointerIcon":Landroid/view/PointerIcon;
    iget-object v2, p0, Lorg/godotengine/godot/GodotGLRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 222
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "customPointerIcon":Landroid/view/PointerIcon;
    goto :goto_1

    .line 219
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/godotengine/godot/GodotGLRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 223
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public getInputHandler()Lorg/godotengine/godot/input/GodotInputHandler;
    .locals 1

    .line 139
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    return-object v0
.end method

.method public getView()Landroid/view/SurfaceView;
    .locals 0

    .line 96
    return-object p0
.end method

.method public onActivityPaused()V
    .locals 1

    .line 106
    new-instance v0, Lorg/godotengine/godot/GodotGLRenderView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/GodotGLRenderView$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/GodotGLRenderView;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->queueEvent(Ljava/lang/Runnable;)V

    .line 111
    return-void
.end method

.method public onActivityResumed()V
    .locals 1

    .line 120
    new-instance v0, Lorg/godotengine/godot/GodotGLRenderView$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/GodotGLRenderView$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/GodotGLRenderView;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->queueEvent(Ljava/lang/Runnable;)V

    .line 125
    return-void
.end method

.method public onActivityStarted()V
    .locals 0

    .line 129
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->resumeGLThread()V

    .line 130
    return-void
.end method

.method public onActivityStopped()V
    .locals 0

    .line 115
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->pauseGLThread()V

    .line 116
    return-void
.end method

.method public onCapturedPointerEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 166
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 161
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Lorg/godotengine/godot/gl/GLSurfaceView;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 156
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lorg/godotengine/godot/gl/GLSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .line 151
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lorg/godotengine/godot/gl/GLSurfaceView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onPointerCaptureChange(Z)V
    .locals 1
    .param p1, "hasCapture"    # Z

    .line 171
    invoke-super {p0, p1}, Lorg/godotengine/godot/gl/GLSurfaceView;->onPointerCaptureChange(Z)V

    .line 172
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 173
    return-void
.end method

.method public onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .locals 1
    .param p1, "me"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 240
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->getPointerIcon()Landroid/view/PointerIcon;

    move-result-object v0

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 145
    invoke-super {p0, p1}, Lorg/godotengine/godot/gl/GLSurfaceView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 146
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public queueOnRenderThread(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/Runnable;

    .line 101
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/GodotGLRenderView;->queueEvent(Ljava/lang/Runnable;)V

    .line 102
    return-void
.end method

.method public releasePointerCapture()V
    .locals 2

    .line 191
    invoke-super {p0}, Lorg/godotengine/godot/gl/GLSurfaceView;->releasePointerCapture()V

    .line 192
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 193
    return-void
.end method

.method public requestPointerCapture()V
    .locals 2

    .line 183
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->canCapturePointer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 184
    invoke-super {p0}, Lorg/godotengine/godot/gl/GLSurfaceView;->requestPointerCapture()V

    .line 185
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 187
    :cond_0
    return-void
.end method

.method public setPointerIcon(I)V
    .locals 2
    .param p1, "pointerType"    # I

    .line 231
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/PointerIcon;

    .line 232
    .local v0, "pointerIcon":Landroid/view/PointerIcon;
    if-nez v0, :cond_0

    .line 233
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotGLRenderView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v0

    .line 235
    :cond_0
    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 236
    return-void
.end method

.method public startRenderer()V
    .locals 1

    .line 290
    iget-object v0, p0, Lorg/godotengine/godot/GodotGLRenderView;->godotRenderer:Lorg/godotengine/godot/gl/GodotRenderer;

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotGLRenderView;->setRenderer(Lorg/godotengine/godot/gl/GLSurfaceView$Renderer;)V

    .line 291
    return-void
.end method
