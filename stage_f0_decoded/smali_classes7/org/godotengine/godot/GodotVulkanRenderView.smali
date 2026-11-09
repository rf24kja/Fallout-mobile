.class Lorg/godotengine/godot/GodotVulkanRenderView;
.super Lorg/godotengine/godot/vulkan/VkSurfaceView;
.source "GodotVulkanRenderView.java"

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

.field private final mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

.field private final mRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;


# direct methods
.method public static synthetic $r8$lambda$7povJCDOJUMWGivR-6g8fdreJ3o(Lorg/godotengine/godot/GodotVulkanRenderView;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->lambda$onActivityResumed$1()V

    return-void
.end method

.method public static synthetic $r8$lambda$LhKHivxDLNK-5sSk4XdOjetTtWU(Lorg/godotengine/godot/GodotVulkanRenderView;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->lambda$onActivityPaused$0()V

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/Godot;Lorg/godotengine/godot/input/GodotInputHandler;Z)V
    .locals 2
    .param p1, "godot"    # Lorg/godotengine/godot/Godot;
    .param p2, "inputHandler"    # Lorg/godotengine/godot/input/GodotInputHandler;
    .param p3, "shouldBeTranslucent"    # Z

    .line 60
    invoke-virtual {p1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;-><init>(Landroid/content/Context;)V

    .line 57
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->customPointerIcons:Landroid/util/SparseArray;

    .line 62
    iput-object p1, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->godot:Lorg/godotengine/godot/Godot;

    .line 63
    iput-object p2, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    .line 64
    new-instance v0, Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-direct {v0}, Lorg/godotengine/godot/vulkan/VkRenderer;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    .line 65
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x3e8

    invoke-static {v0, v1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->setFocusableInTouchMode(Z)V

    .line 67
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->setClickable(Z)V

    .line 69
    if-eqz p3, :cond_0

    .line 70
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 72
    :cond_0
    return-void
.end method

.method private synthetic lambda$onActivityPaused$0()V
    .locals 1

    .line 92
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->focusout()V

    .line 94
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkRenderer;->onVkPause()V

    .line 95
    return-void
.end method

.method private synthetic lambda$onActivityResumed$1()V
    .locals 1

    .line 112
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkRenderer;->onVkResume()V

    .line 113
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->focusin()V

    .line 114
    return-void
.end method


# virtual methods
.method public blockingExitRenderer(J)Z
    .locals 1
    .param p1, "blockingTimeInMs"    # J

    .line 119
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/GodotVulkanRenderView;->requestRenderThreadExitAndWait(J)Z

    move-result v0

    return v0
.end method

.method public canCapturePointer()Z
    .locals 1

    .line 157
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isXrRuntime()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

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

    .line 188
    const/4 v0, 0x0

    .line 189
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 190
    iget-object v1, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getDirectoryAccessHandler()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->filesystemFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 192
    invoke-static {p2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    move-object v0, v1

    goto :goto_0

    .line 193
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getDirectoryAccessHandler()Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->assetsFileExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 195
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    .line 196
    .local v1, "am":Landroid/content/res/AssetManager;
    invoke-virtual {v1, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 197
    .local v2, "imageInputStream":Ljava/io/InputStream;
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v3

    move-object v0, v3

    .line 201
    .end local v1    # "am":Landroid/content/res/AssetManager;
    .end local v2    # "imageInputStream":Ljava/io/InputStream;
    :cond_1
    :goto_0
    invoke-static {v0, p3, p4}, Landroid/view/PointerIcon;->create(Landroid/graphics/Bitmap;FF)Landroid/view/PointerIcon;

    move-result-object v1

    .line 202
    .local v1, "customPointerIcon":Landroid/view/PointerIcon;
    iget-object v2, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 206
    .end local v0    # "bitmap":Landroid/graphics/Bitmap;
    .end local v1    # "customPointerIcon":Landroid/view/PointerIcon;
    goto :goto_1

    .line 203
    :catch_0
    move-exception v0

    .line 205
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->delete(I)V

    .line 207
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_1
    return-void
.end method

.method public getInputHandler()Lorg/godotengine/godot/input/GodotInputHandler;
    .locals 1

    .line 124
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    return-object v0
.end method

.method public getView()Landroid/view/SurfaceView;
    .locals 0

    .line 81
    return-object p0
.end method

.method public onActivityPaused()V
    .locals 1

    .line 91
    new-instance v0, Lorg/godotengine/godot/GodotVulkanRenderView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/GodotVulkanRenderView$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/GodotVulkanRenderView;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->queueOnVkThread(Ljava/lang/Runnable;)V

    .line 96
    return-void
.end method

.method public onActivityResumed()V
    .locals 1

    .line 110
    new-instance v0, Lorg/godotengine/godot/GodotVulkanRenderView$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/GodotVulkanRenderView$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/GodotVulkanRenderView;)V

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->queueOnVkThread(Ljava/lang/Runnable;)V

    .line 115
    return-void
.end method

.method public onActivityStarted()V
    .locals 0

    .line 105
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->resumeRenderThread()V

    .line 106
    return-void
.end method

.method public onActivityStopped()V
    .locals 0

    .line 100
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->pauseRenderThread()V

    .line 101
    return-void
.end method

.method public onCapturedPointerEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 151
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 146
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

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

    .line 141
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->onKeyDown(ILandroid/view/KeyEvent;)Z

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

    .line 136
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1, p2}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->onKeyUp(ILandroid/view/KeyEvent;)Z

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

    .line 175
    invoke-super {p0, p1}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->onPointerCaptureChange(Z)V

    .line 176
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 177
    return-void
.end method

.method public onResolvePointerIcon(Landroid/view/MotionEvent;I)Landroid/view/PointerIcon;
    .locals 1
    .param p1, "me"    # Landroid/view/MotionEvent;
    .param p2, "pointerIndex"    # I

    .line 224
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->getPointerIcon()Landroid/view/PointerIcon;

    move-result-object v0

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 130
    invoke-super {p0, p1}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 131
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public queueOnRenderThread(Ljava/lang/Runnable;)V
    .locals 0
    .param p1, "event"    # Ljava/lang/Runnable;

    .line 86
    invoke-virtual {p0, p1}, Lorg/godotengine/godot/GodotVulkanRenderView;->queueOnVkThread(Ljava/lang/Runnable;)V

    .line 87
    return-void
.end method

.method public releasePointerCapture()V
    .locals 2

    .line 169
    invoke-super {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->releasePointerCapture()V

    .line 170
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 171
    return-void
.end method

.method public requestPointerCapture()V
    .locals 2

    .line 161
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->canCapturePointer()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 162
    invoke-super {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->requestPointerCapture()V

    .line 163
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mInputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->onPointerCaptureChange(Z)V

    .line 165
    :cond_0
    return-void
.end method

.method public setPointerIcon(I)V
    .locals 2
    .param p1, "pointerType"    # I

    .line 215
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->customPointerIcons:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/PointerIcon;

    .line 216
    .local v0, "pointerIcon":Landroid/view/PointerIcon;
    if-nez v0, :cond_0

    .line 217
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotVulkanRenderView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v0

    .line 219
    :cond_0
    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 220
    return-void
.end method

.method public startRenderer()V
    .locals 1

    .line 76
    iget-object v0, p0, Lorg/godotengine/godot/GodotVulkanRenderView;->mRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/GodotVulkanRenderView;->startRenderer(Lorg/godotengine/godot/vulkan/VkRenderer;)V

    .line 77
    return-void
.end method
