.class public Lorg/godotengine/godot/vulkan/VkSurfaceView;
.super Landroid/view/SurfaceView;
.source "VkSurfaceView.kt"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u0010\u0018\u0000 #2\u00020\u00012\u00020\u0002:\u0001#B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u0013J\u0008\u0010\u0014\u001a\u00020\u0010H\u0004J\u0008\u0010\u0015\u001a\u00020\u0010H\u0004J\u0006\u0010\u0016\u001a\u00020\u0010J\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019J(\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u001eH\u0016J\u0010\u0010!\u001a\u00020\u00102\u0006\u0010\u001b\u001a\u00020\u001cH\u0016J\u0010\u0010\"\u001a\u00020\u00102\u0006\u0010\u001b\u001a\u00020\u001cH\u0016R\u001b\u0010\u0007\u001a\u00020\u00088BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u000b\u0010\u000c\u001a\u0004\u0008\t\u0010\nR\u000e\u0010\r\u001a\u00020\u000eX\u0082.\u00a2\u0006\u0002\n\u0000\u00a8\u0006$"
    }
    d2 = {
        "Lorg/godotengine/godot/vulkan/VkSurfaceView;",
        "Landroid/view/SurfaceView;",
        "Landroid/view/SurfaceHolder$Callback;",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "vkThread",
        "Lorg/godotengine/godot/vulkan/VkThread;",
        "getVkThread",
        "()Lorg/godotengine/godot/vulkan/VkThread;",
        "vkThread$delegate",
        "Lkotlin/Lazy;",
        "renderer",
        "Lorg/godotengine/godot/vulkan/VkRenderer;",
        "startRenderer",
        "",
        "queueOnVkThread",
        "runnable",
        "Ljava/lang/Runnable;",
        "resumeRenderThread",
        "pauseRenderThread",
        "requestRenderThreadExitAndWait",
        "",
        "timeInMs",
        "",
        "surfaceChanged",
        "holder",
        "Landroid/view/SurfaceHolder;",
        "format",
        "",
        "width",
        "height",
        "surfaceDestroyed",
        "surfaceCreated",
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
.field public static final Companion:Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private renderer:Lorg/godotengine/godot/vulkan/VkRenderer;

.field private final vkThread$delegate:Lkotlin/Lazy;


# direct methods
.method public static synthetic $r8$lambda$DK1drZOEWecoE_WdaEQh6aqmzFA(Lorg/godotengine/godot/vulkan/VkSurfaceView;)Lorg/godotengine/godot/vulkan/VkThread;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->vkThread_delegate$lambda$0(Lorg/godotengine/godot/vulkan/VkSurfaceView;)Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->Companion:Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;

    .line 55
    const-class v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-direct {p0, p1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 65
    new-instance v0, Lorg/godotengine/godot/vulkan/VkSurfaceView$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/vulkan/VkSurfaceView;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->vkThread$delegate:Lkotlin/Lazy;

    .line 74
    nop

    .line 75
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->setClickable(Z)V

    .line 76
    invoke-virtual {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    move-object v1, p0

    check-cast v1, Landroid/view/SurfaceHolder$Callback;

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 77
    nop

    .line 53
    return-void
.end method

.method private final getVkThread()Lorg/godotengine/godot/vulkan/VkThread;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->vkThread$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/vulkan/VkThread;

    return-object v0
.end method

.method private static final vkThread_delegate$lambda$0(Lorg/godotengine/godot/vulkan/VkSurfaceView;)Lorg/godotengine/godot/vulkan/VkThread;
    .locals 2
    .param p0, "this$0"    # Lorg/godotengine/godot/vulkan/VkSurfaceView;

    .line 66
    new-instance v0, Lorg/godotengine/godot/vulkan/VkThread;

    iget-object v1, p0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->renderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    if-nez v1, :cond_0

    const-string v1, "renderer"

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_0
    invoke-direct {v0, p0, v1}, Lorg/godotengine/godot/vulkan/VkThread;-><init>(Lorg/godotengine/godot/vulkan/VkSurfaceView;Lorg/godotengine/godot/vulkan/VkRenderer;)V

    return-object v0
.end method


# virtual methods
.method protected final pauseRenderThread()V
    .locals 1

    .line 115
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->onPause()V

    .line 116
    return-void
.end method

.method public final queueOnVkThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    const-string v0, "runnable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/vulkan/VkThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 98
    return-void
.end method

.method public final requestRenderThreadExitAndWait()V
    .locals 1

    .line 122
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->requestExitAndWait()V

    .line 123
    return-void
.end method

.method public final requestRenderThreadExitAndWait(J)Z
    .locals 1
    .param p1, "timeInMs"    # J

    .line 131
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/godotengine/godot/vulkan/VkThread;->requestExitAndWait(J)Z

    move-result v0

    return v0
.end method

.method protected final resumeRenderThread()V
    .locals 1

    .line 106
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->onResume()V

    .line 107
    return-void
.end method

.method public final startRenderer(Lorg/godotengine/godot/vulkan/VkRenderer;)V
    .locals 3
    .param p1, "renderer"    # Lorg/godotengine/godot/vulkan/VkRenderer;

    const-string v0, "renderer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    sget-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->Companion:Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;

    iget-object v1, p0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->renderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const-string v2, "startRenderer must only be invoked once"

    invoke-virtual {v0, v1, v2}, Lorg/godotengine/godot/vulkan/VkSurfaceView$Companion;->checkState(ZLjava/lang/Object;)V

    .line 87
    iput-object p1, p0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->renderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    .line 88
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->start()V

    .line 89
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 3
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 135
    sget-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "On surface changed ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " x "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0, p3, p4}, Lorg/godotengine/godot/vulkan/VkThread;->onSurfaceChanged(II)V

    .line 137
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    sget-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->TAG:Ljava/lang/String;

    const-string v1, "On surface created"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->onSurfaceCreated()V

    .line 147
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    const-string v0, "holder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    sget-object v0, Lorg/godotengine/godot/vulkan/VkSurfaceView;->TAG:Ljava/lang/String;

    const-string v1, "On surface destroyed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getVkThread()Lorg/godotengine/godot/vulkan/VkThread;

    move-result-object v0

    invoke-virtual {v0}, Lorg/godotengine/godot/vulkan/VkThread;->onSurfaceDestroyed()V

    .line 142
    return-void
.end method
