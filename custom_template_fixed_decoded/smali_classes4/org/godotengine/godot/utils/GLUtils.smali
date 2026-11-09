.class public Lorg/godotengine/godot/utils/GLUtils;
.super Ljava/lang/Object;
.source "GLUtils.java"


# static fields
.field private static final ATTRIBUTES:[I

.field private static final ATTRIBUTES_NAMES:[Ljava/lang/String;

.field public static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 43
    const-class v0, Lorg/godotengine/godot/utils/GLUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/utils/GLUtils;->TAG:Ljava/lang/String;

    .line 47
    const/16 v0, 0x21

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "EGL_BUFFER_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "EGL_ALPHA_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, "EGL_BLUE_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-string v3, "EGL_GREEN_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "EGL_RED_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    const-string v3, "EGL_DEPTH_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "EGL_STENCIL_SIZE"

    aput-object v3, v1, v2

    const/4 v2, 0x7

    const-string v3, "EGL_CONFIG_CAVEAT"

    aput-object v3, v1, v2

    const/16 v2, 0x8

    const-string v3, "EGL_CONFIG_ID"

    aput-object v3, v1, v2

    const/16 v2, 0x9

    const-string v3, "EGL_LEVEL"

    aput-object v3, v1, v2

    const/16 v2, 0xa

    const-string v3, "EGL_MAX_PBUFFER_HEIGHT"

    aput-object v3, v1, v2

    const/16 v2, 0xb

    const-string v3, "EGL_MAX_PBUFFER_PIXELS"

    aput-object v3, v1, v2

    const/16 v2, 0xc

    const-string v3, "EGL_MAX_PBUFFER_WIDTH"

    aput-object v3, v1, v2

    const/16 v2, 0xd

    const-string v3, "EGL_NATIVE_RENDERABLE"

    aput-object v3, v1, v2

    const/16 v2, 0xe

    const-string v3, "EGL_NATIVE_VISUAL_ID"

    aput-object v3, v1, v2

    const/16 v2, 0xf

    const-string v3, "EGL_NATIVE_VISUAL_TYPE"

    aput-object v3, v1, v2

    const/16 v2, 0x10

    const-string v3, "EGL_PRESERVED_RESOURCES"

    aput-object v3, v1, v2

    const/16 v2, 0x11

    const-string v3, "EGL_SAMPLES"

    aput-object v3, v1, v2

    const/16 v2, 0x12

    const-string v3, "EGL_SAMPLE_BUFFERS"

    aput-object v3, v1, v2

    const/16 v2, 0x13

    const-string v3, "EGL_SURFACE_TYPE"

    aput-object v3, v1, v2

    const/16 v2, 0x14

    const-string v3, "EGL_TRANSPARENT_TYPE"

    aput-object v3, v1, v2

    const/16 v2, 0x15

    const-string v3, "EGL_TRANSPARENT_RED_VALUE"

    aput-object v3, v1, v2

    const/16 v2, 0x16

    const-string v3, "EGL_TRANSPARENT_GREEN_VALUE"

    aput-object v3, v1, v2

    const/16 v2, 0x17

    const-string v3, "EGL_TRANSPARENT_BLUE_VALUE"

    aput-object v3, v1, v2

    const/16 v2, 0x18

    const-string v3, "EGL_BIND_TO_TEXTURE_RGB"

    aput-object v3, v1, v2

    const/16 v2, 0x19

    const-string v3, "EGL_BIND_TO_TEXTURE_RGBA"

    aput-object v3, v1, v2

    const/16 v2, 0x1a

    const-string v3, "EGL_MIN_SWAP_INTERVAL"

    aput-object v3, v1, v2

    const/16 v2, 0x1b

    const-string v3, "EGL_MAX_SWAP_INTERVAL"

    aput-object v3, v1, v2

    const/16 v2, 0x1c

    const-string v3, "EGL_LUMINANCE_SIZE"

    aput-object v3, v1, v2

    const/16 v2, 0x1d

    const-string v3, "EGL_ALPHA_MASK_SIZE"

    aput-object v3, v1, v2

    const/16 v2, 0x1e

    const-string v3, "EGL_COLOR_BUFFER_TYPE"

    aput-object v3, v1, v2

    const/16 v2, 0x1f

    const-string v3, "EGL_RENDERABLE_TYPE"

    aput-object v3, v1, v2

    const/16 v2, 0x20

    const-string v3, "EGL_CONFORMANT"

    aput-object v3, v1, v2

    sput-object v1, Lorg/godotengine/godot/utils/GLUtils;->ATTRIBUTES_NAMES:[Ljava/lang/String;

    .line 83
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lorg/godotengine/godot/utils/GLUtils;->ATTRIBUTES:[I

    return-void

    :array_0
    .array-data 4
        0x3020
        0x3021
        0x3022
        0x3023
        0x3024
        0x3025
        0x3026
        0x3027
        0x3028
        0x3029
        0x302a
        0x302b
        0x302c
        0x302d
        0x302e
        0x302f
        0x3030
        0x3031
        0x3032
        0x3033
        0x3034
        0x3037
        0x3036
        0x3035
        0x3039
        0x303a
        0x303b
        0x303c
        0x303d
        0x303e
        0x303f
        0x3040
        0x3042
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkEglError(Ljava/lang/String;Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "prompt"    # Ljava/lang/String;
    .param p2, "egl"    # Ljavax/microedition/khronos/egl/EGL10;

    .line 123
    nop

    :goto_0
    invoke-interface {p2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    move v1, v0

    .local v1, "error":I
    const/16 v2, 0x3000

    if-eq v0, v2, :cond_0

    .line 124
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {p1, v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "%s: EGL error: 0x%x"

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 126
    :cond_0
    return-void
.end method

.method private static printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 7
    .param p0, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p1, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p2, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;

    .line 140
    const/4 v0, 0x1

    new-array v0, v0, [I

    .line 141
    .local v0, "value":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Lorg/godotengine/godot/utils/GLUtils;->ATTRIBUTES:[I

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 142
    sget-object v2, Lorg/godotengine/godot/utils/GLUtils;->ATTRIBUTES:[I

    aget v2, v2, v1

    .line 143
    .local v2, "attribute":I
    sget-object v3, Lorg/godotengine/godot/utils/GLUtils;->ATTRIBUTES_NAMES:[Ljava/lang/String;

    aget-object v3, v3, v1

    .line 144
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p0, p1, p2, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 145
    sget-object v4, Lorg/godotengine/godot/utils/GLUtils;->TAG:Ljava/lang/String;

    const/4 v5, 0x0

    aget v5, v0, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v3, v5}, [Ljava/lang/Object;

    move-result-object v5

    const-string v6, "  %s: %d\n"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 148
    :cond_0
    :goto_1
    invoke-interface {p0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v4

    const/16 v5, 0x3000

    if-eq v4, v5, :cond_1

    goto :goto_1

    .line 141
    .end local v2    # "attribute":I
    .end local v3    # "name":Ljava/lang/String;
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 153
    .end local v1    # "i":I
    :cond_2
    return-void
.end method

.method public static printConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 5
    .param p0, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p1, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p2, "configs"    # [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 130
    array-length v0, p2

    .line 131
    .local v0, "numConfigs":I
    sget-object v1, Lorg/godotengine/godot/utils/GLUtils;->TAG:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "%d configurations"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 133
    sget-object v2, Lorg/godotengine/godot/utils/GLUtils;->TAG:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Configuration %d:\n"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    aget-object v2, p2, v1

    invoke-static {p0, p1, v2}, Lorg/godotengine/godot/utils/GLUtils;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 132
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    .end local v1    # "i":I
    :cond_0
    return-void
.end method
