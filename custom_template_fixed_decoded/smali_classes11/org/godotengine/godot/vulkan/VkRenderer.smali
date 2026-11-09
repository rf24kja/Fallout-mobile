.class public final Lorg/godotengine/godot/vulkan/VkRenderer;
.super Ljava/lang/Object;
.source "VkRenderer.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/vulkan/VkRenderer$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0007\u0008\u0000\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\r\u0010\u000c\u001a\u00020\u0007H\u0000\u00a2\u0006\u0002\u0008\rJ\u000e\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011J\u001e\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0014J\u0006\u0010\u0016\u001a\u00020\u000fJ\u0006\u0010\u0017\u001a\u00020\u000fJ\u0006\u0010\u0018\u001a\u00020\u000fJ\u0006\u0010\u0019\u001a\u00020\u000fR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001e\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0007@BX\u0080\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u000e\u0010\u000b\u001a\u00020\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001b"
    }
    d2 = {
        "Lorg/godotengine/godot/vulkan/VkRenderer;",
        "",
        "<init>",
        "()V",
        "pluginRegistry",
        "Lorg/godotengine/godot/plugin/GodotPluginRegistry;",
        "value",
        "",
        "initialized",
        "getInitialized$lib_templateDebug",
        "()Z",
        "rendererResumed",
        "initialize",
        "initialize$lib_templateDebug",
        "onVkSurfaceCreated",
        "",
        "surface",
        "Landroid/view/Surface;",
        "onVkSurfaceChanged",
        "width",
        "",
        "height",
        "onVkDrawFrame",
        "onVkResume",
        "onVkPause",
        "onRenderThreadExiting",
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
.field public static final Companion:Lorg/godotengine/godot/vulkan/VkRenderer$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private initialized:Z

.field private final pluginRegistry:Lorg/godotengine/godot/plugin/GodotPluginRegistry;

.field private rendererResumed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/vulkan/VkRenderer$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/vulkan/VkRenderer$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->Companion:Lorg/godotengine/godot/vulkan/VkRenderer$Companion;

    .line 55
    const-class v0, Lorg/godotengine/godot/vulkan/VkRenderer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-static {}, Lorg/godotengine/godot/plugin/GodotPluginRegistry;->getPluginRegistry()Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    move-result-object v0

    const-string v1, "getPluginRegistry(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->pluginRegistry:Lorg/godotengine/godot/plugin/GodotPluginRegistry;

    .line 52
    return-void
.end method


# virtual methods
.method public final getInitialized$lib_templateDebug()Z
    .locals 1

    .line 60
    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->initialized:Z

    return v0
.end method

.method public final initialize$lib_templateDebug()Z
    .locals 2

    .line 65
    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->initialized:Z

    if-nez v0, :cond_0

    .line 67
    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->rendererResumed:Z

    if-eqz v0, :cond_0

    .line 68
    sget-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Initializing renderer..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->initialized:Z

    .line 73
    :cond_0
    iget-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->initialized:Z

    return v0
.end method

.method public final onRenderThreadExiting()V
    .locals 2

    .line 130
    sget-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Destroying Godot Engine"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->ondestroy()V

    .line 132
    return-void
.end method

.method public final onVkDrawFrame()V
    .locals 2

    .line 102
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->step()Z

    .line 103
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->pluginRegistry:Lorg/godotengine/godot/plugin/GodotPluginRegistry;

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

    .line 104
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onVkDrawFrame()V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 106
    :cond_0
    return-void
.end method

.method public final onVkPause()V
    .locals 2

    .line 121
    sget-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Renderer paused"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 122
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->rendererResumed:Z

    .line 123
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->onRendererPaused()V

    .line 124
    return-void
.end method

.method public final onVkResume()V
    .locals 2

    .line 112
    sget-object v0, Lorg/godotengine/godot/vulkan/VkRenderer;->TAG:Ljava/lang/String;

    const-string v1, "Renderer resumed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->rendererResumed:Z

    .line 114
    invoke-static {}, Lorg/godotengine/godot/GodotLib;->onRendererResumed()V

    .line 115
    return-void
.end method

.method public final onVkSurfaceChanged(Landroid/view/Surface;II)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "width"    # I
    .param p3, "height"    # I

    const-string v0, "surface"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    invoke-static {p1, p2, p3}, Lorg/godotengine/godot/GodotLib;->resize(Landroid/view/Surface;II)V

    .line 93
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->pluginRegistry:Lorg/godotengine/godot/plugin/GodotPluginRegistry;

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

    .line 94
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1, p1, p2, p3}, Lorg/godotengine/godot/plugin/GodotPlugin;->onVkSurfaceChanged(Landroid/view/Surface;II)V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 96
    :cond_0
    return-void
.end method

.method public final onVkSurfaceCreated(Landroid/view/Surface;)V
    .locals 2
    .param p1, "surface"    # Landroid/view/Surface;

    const-string v0, "surface"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 80
    invoke-static {p1}, Lorg/godotengine/godot/GodotLib;->newcontext(Landroid/view/Surface;)V

    .line 82
    iget-object v0, p0, Lorg/godotengine/godot/vulkan/VkRenderer;->pluginRegistry:Lorg/godotengine/godot/plugin/GodotPluginRegistry;

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

    .line 83
    .local v1, "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    invoke-virtual {v1, p1}, Lorg/godotengine/godot/plugin/GodotPlugin;->onVkSurfaceCreated(Landroid/view/Surface;)V

    .end local v1    # "plugin":Lorg/godotengine/godot/plugin/GodotPlugin;
    goto :goto_0

    .line 85
    :cond_0
    return-void
.end method
