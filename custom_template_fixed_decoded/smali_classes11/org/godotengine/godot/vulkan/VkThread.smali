.class public final Lorg/godotengine/godot/vulkan/VkThread;
.super Ljava/lang/Thread;
.source "VkThread.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/vulkan/VkThread$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0008\u0008\u0000\u0018\u0000 *2\u00020\u0001:\u0001*B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0008\u0010\u001d\u001a\u00020\u001eH\u0002J\u000e\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\nJ\u0006\u0010!\u001a\u00020\u001eJ\u000e\u0010!\u001a\u00020\u00122\u0006\u0010\"\u001a\u00020#J\u0006\u0010$\u001a\u00020\u001eJ\u0006\u0010%\u001a\u00020\u001eJ\u0006\u0010&\u001a\u00020\u001eJ\u0016\u0010\'\u001a\u00020\u001e2\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0018J\u0006\u0010(\u001a\u00020\u001eJ\u0008\u0010)\u001a\u00020\u001eH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0008\u001a\u0012\u0012\u0004\u0012\u00020\n0\tj\u0008\u0012\u0004\u0012\u00020\n`\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000e\u001a\n \u0010*\u0004\u0018\u00010\u000f0\u000fX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\u00020\u00128BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u001b\u0010\u001c\u00a8\u0006+"
    }
    d2 = {
        "Lorg/godotengine/godot/vulkan/VkThread;",
        "Ljava/lang/Thread;",
        "vkSurfaceView",
        "Lorg/godotengine/godot/vulkan/VkSurfaceView;",
        "vkRenderer",
        "Lorg/godotengine/godot/vulkan/VkRenderer;",
        "<init>",
        "(Lorg/godotengine/godot/vulkan/VkSurfaceView;Lorg/godotengine/godot/vulkan/VkRenderer;)V",
        "eventQueue",
        "Ljava/util/ArrayList;",
        "Ljava/lang/Runnable;",
        "Lkotlin/collections/ArrayList;",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "lockCondition",
        "Ljava/util/concurrent/locks/Condition;",
        "kotlin.jvm.PlatformType",
        "shouldExit",
        "",
        "exited",
        "resumed",
        "surfaceChanged",
        "hasSurface",
        "width",
        "",
        "height",
        "readyToDraw",
        "getReadyToDraw",
        "()Z",
        "threadExiting",
        "",
        "queueEvent",
        "event",
        "requestExitAndWait",
        "timeInMs",
        "",
        "onResume",
        "onPause",
        "onSurfaceCreated",
        "onSurfaceChanged",
        "onSurfaceDestroyed",
        "run",
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
.field public static final Companion:Lorg/godotengine/godot/vulkan/VkThread$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final eventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private exited:Z

.field private hasSurface:Z

.field private height:I

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private final lockCondition:Ljava/util/concurrent/locks/Condition;

.field private resumed:Z

.field private shouldExit:Z

.field private surfaceChanged:Z

.field private final vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

.field private final vkSurfaceView:Lorg/godotengine/godot/vulkan/VkSurfaceView;

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/vulkan/VkThread$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/vulkan/VkThread$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/vulkan/VkThread;->Companion:Lorg/godotengine/godot/vulkan/VkThread$Companion;

    .line 46
    const-class v0, Lorg/godotengine/godot/vulkan/VkThread;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/vulkan/VkSurfaceView;Lorg/godotengine/godot/vulkan/VkRenderer;)V
    .locals 1
    .param p1, "vkSurfaceView"    # Lorg/godotengine/godot/vulkan/VkSurfaceView;
    .param p2, "vkRenderer"    # Lorg/godotengine/godot/vulkan/VkRenderer;

    const-string v0, "vkSurfaceView"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "vkRenderer"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    sget-object v0, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkSurfaceView:Lorg/godotengine/godot/vulkan/VkSurfaceView;

    iput-object p2, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->eventQueue:Ljava/util/ArrayList;

    .line 57
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 58
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    .line 44
    return-void
.end method

.method private final getReadyToDraw()Z
    .locals 1

    .line 73
    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->hasSurface:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->resumed:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final threadExiting()V
    .locals 4

    .line 76
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 77
    .local v1, "$i$a$-withLock-VkThread$threadExiting$1":I
    :try_start_0
    sget-object v2, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    const-string v3, "Exiting render thread"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v2}, Lorg/godotengine/godot/vulkan/VkRenderer;->onRenderThreadExiting()V

    .line 80
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->exited:Z

    .line 81
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 82
    nop

    .end local v1    # "$i$a$-withLock-VkThread$threadExiting$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 83
    return-void

    .line 76
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method


# virtual methods
.method public final onPause()V
    .locals 3

    .line 151
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 152
    .local v1, "$i$a$-withLock-VkThread$onPause$1":I
    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->resumed:Z

    .line 153
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 154
    nop

    .end local v1    # "$i$a$-withLock-VkThread$onPause$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 155
    return-void

    .line 151
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final onResume()V
    .locals 3

    .line 141
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 142
    .local v1, "$i$a$-withLock-VkThread$onResume$1":I
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->resumed:Z

    .line 143
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 144
    nop

    .end local v1    # "$i$a$-withLock-VkThread$onResume$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 145
    return-void

    .line 141
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final onSurfaceChanged(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 169
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 170
    .local v1, "$i$a$-withLock-VkThread$onSurfaceChanged$1":I
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->hasSurface:Z

    .line 171
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->surfaceChanged:Z

    .line 172
    iput p1, p0, Lorg/godotengine/godot/vulkan/VkThread;->width:I

    .line 173
    iput p2, p0, Lorg/godotengine/godot/vulkan/VkThread;->height:I

    .line 175
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 176
    nop

    .end local v1    # "$i$a$-withLock-VkThread$onSurfaceChanged$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 177
    return-void

    .line 169
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final onSurfaceCreated()V
    .locals 0

    .line 163
    return-void
.end method

.method public final onSurfaceDestroyed()V
    .locals 3

    .line 183
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 184
    .local v1, "$i$a$-withLock-VkThread$onSurfaceDestroyed$1":I
    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->hasSurface:Z

    .line 185
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 186
    nop

    .end local v1    # "$i$a$-withLock-VkThread$onSurfaceDestroyed$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 187
    return-void

    .line 183
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final queueEvent(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "event"    # Ljava/lang/Runnable;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 90
    .local v1, "$i$a$-withLock-VkThread$queueEvent$1":I
    :try_start_0
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->eventQueue:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 92
    nop

    .end local v1    # "$i$a$-withLock-VkThread$queueEvent$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 93
    return-void

    .line 89
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final requestExitAndWait()V
    .locals 6

    .line 99
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 100
    .local v1, "$i$a$-withLock-VkThread$requestExitAndWait$1":I
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->shouldExit:Z

    .line 101
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 102
    :goto_0
    iget-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->exited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    .line 103
    nop

    .line 104
    :try_start_1
    sget-object v2, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/godotengine/godot/vulkan/VkThread;->getName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Waiting on exit for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 106
    :catch_0
    move-exception v2

    .line 107
    .local v2, "<unused var>":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .end local v2    # "<unused var>":Ljava/lang/InterruptedException;
    goto :goto_0

    .line 110
    :cond_0
    nop

    .end local v1    # "$i$a$-withLock-VkThread$requestExitAndWait$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 111
    return-void

    .line 99
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final requestExitAndWait(J)Z
    .locals 8
    .param p1, "timeInMs"    # J

    .line 119
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v0, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    const/4 v1, 0x0

    .line 120
    .local v1, "$i$a$-withLock-VkThread$requestExitAndWait$2":I
    const/4 v2, 0x1

    :try_start_0
    iput-boolean v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->shouldExit:Z

    .line 121
    iget-object v2, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v2}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 123
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, p1, p2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v2

    .line 124
    .local v2, "remainingTimeInNanos":J
    :goto_0
    iget-boolean v4, p0, Lorg/godotengine/godot/vulkan/VkThread;->exited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-lez v4, :cond_0

    .line 125
    nop

    .line 126
    :try_start_1
    sget-object v4, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/godotengine/godot/vulkan/VkThread;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Waiting on exit for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    iget-object v4, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v4, v2, v3}, Ljava/util/concurrent/locks/Condition;->awaitNanos(J)J

    move-result-wide v4
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-wide v2, v4

    goto :goto_0

    .line 128
    :catch_0
    move-exception v4

    .line 129
    .local v4, "<unused var>":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->interrupt()V

    .end local v4    # "<unused var>":Ljava/lang/InterruptedException;
    goto :goto_0

    .line 133
    :cond_0
    iget-boolean v4, p0, Lorg/godotengine/godot/vulkan/VkThread;->exited:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .end local v1    # "$i$a$-withLock-VkThread$requestExitAndWait$2":I
    .end local v2    # "remainingTimeInNanos":J
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return v4

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public run()V
    .locals 8

    .line 193
    nop

    .line 194
    :goto_0
    nop

    .line 195
    :try_start_0
    new-instance v0, Lkotlin/jvm/internal/Ref$ObjectRef;

    invoke-direct {v0}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 196
    .local v0, "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    iget-object v1, p0, Lorg/godotengine/godot/vulkan/VkThread;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    check-cast v1, Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v2, 0x0

    .line 197
    .local v2, "$i$a$-withLock-VkThread$run$1":I
    :goto_1
    nop

    .line 199
    :try_start_1
    iget-boolean v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->shouldExit:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_0

    .line 200
    nop

    .end local v2    # "$i$a$-withLock-VkThread$run$1":I
    :try_start_2
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 249
    .end local v0    # "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkThread;->threadExiting()V

    .restart local v0    # "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    return-void

    .line 205
    .restart local v2    # "$i$a$-withLock-VkThread$run$1":I
    :cond_0
    :try_start_3
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->eventQueue:Ljava/util/ArrayList;

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_1

    .line 206
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->eventQueue:Ljava/util/ArrayList;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 207
    goto :goto_2

    .line 210
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkThread;->getReadyToDraw()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 211
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v3}, Lorg/godotengine/godot/vulkan/VkRenderer;->getInitialized$lib_templateDebug()Z

    move-result v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string v5, "getSurface(...)"

    if-nez v3, :cond_2

    .line 212
    :try_start_4
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v3}, Lorg/godotengine/godot/vulkan/VkRenderer;->initialize$lib_templateDebug()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 213
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    iget-object v6, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkSurfaceView:Lorg/godotengine/godot/vulkan/VkSurfaceView;

    invoke-virtual {v6}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v6

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Lorg/godotengine/godot/vulkan/VkRenderer;->onVkSurfaceCreated(Landroid/view/Surface;)V

    .line 217
    :cond_2
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v3}, Lorg/godotengine/godot/vulkan/VkRenderer;->getInitialized$lib_templateDebug()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 218
    iget-boolean v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->surfaceChanged:Z

    if-eqz v3, :cond_3

    .line 219
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    iget-object v6, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkSurfaceView:Lorg/godotengine/godot/vulkan/VkSurfaceView;

    invoke-virtual {v6}, Lorg/godotengine/godot/vulkan/VkSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v6

    invoke-interface {v6}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object v6

    invoke-static {v6, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget v5, p0, Lorg/godotengine/godot/vulkan/VkThread;->width:I

    iget v7, p0, Lorg/godotengine/godot/vulkan/VkThread;->height:I

    invoke-virtual {v3, v6, v5, v7}, Lorg/godotengine/godot/vulkan/VkRenderer;->onVkSurfaceChanged(Landroid/view/Surface;II)V

    .line 220
    iput-boolean v4, p0, Lorg/godotengine/godot/vulkan/VkThread;->surfaceChanged:Z

    .line 224
    :cond_3
    nop

    .line 233
    :goto_2
    nop

    .end local v2    # "$i$a$-withLock-VkThread$run$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 196
    :try_start_5
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 236
    iget-object v1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    if-eqz v1, :cond_4

    .line 237
    iget-object v1, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 238
    goto/16 :goto_0

    .line 242
    :cond_4
    iget-object v1, p0, Lorg/godotengine/godot/vulkan/VkThread;->vkRenderer:Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v1}, Lorg/godotengine/godot/vulkan/VkRenderer;->onVkDrawFrame()V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local v0    # "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    goto/16 :goto_0

    .line 231
    .restart local v0    # "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    .restart local v2    # "$i$a$-withLock-VkThread$run$1":I
    :cond_5
    :try_start_6
    iget-object v3, p0, Lorg/godotengine/godot/vulkan/VkThread;->lockCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v3}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_1

    .line 196
    .end local v2    # "$i$a$-withLock-VkThread$run$1":I
    :catchall_0
    move-exception v2

    :try_start_7
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v2
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 249
    .end local v0    # "event":Lkotlin/jvm/internal/Ref$ObjectRef;
    :catchall_1
    move-exception v0

    goto :goto_4

    .line 246
    :catch_0
    move-exception v0

    .line 247
    .local v0, "ex":Ljava/lang/IllegalStateException;
    :try_start_8
    sget-object v1, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    const-string v2, "IllegalStateException"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 249
    nop

    .end local v0    # "ex":Ljava/lang/IllegalStateException;
    goto :goto_3

    .line 244
    :catch_1
    move-exception v0

    .line 245
    .local v0, "ex":Ljava/lang/InterruptedException;
    sget-object v1, Lorg/godotengine/godot/vulkan/VkThread;->TAG:Ljava/lang/String;

    const-string v2, "InterruptedException"

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 249
    nop

    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :goto_3
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkThread;->threadExiting()V

    .line 250
    nop

    .line 251
    return-void

    .line 249
    :goto_4
    invoke-direct {p0}, Lorg/godotengine/godot/vulkan/VkThread;->threadExiting()V

    throw v0
.end method
