.class Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;
.super Lorg/godotengine/godot/gl/GLSurfaceView$BaseConfigChooser;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/gl/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ComponentSizeChooser"
.end annotation


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I

.field final synthetic this$0:Lorg/godotengine/godot/gl/GLSurfaceView;


# direct methods
.method public constructor <init>(Lorg/godotengine/godot/gl/GLSurfaceView;IIIIII)V
    .locals 15
    .param p2, "redSize"    # I
    .param p3, "greenSize"    # I
    .param p4, "blueSize"    # I
    .param p5, "alphaSize"    # I
    .param p6, "depthSize"    # I
    .param p7, "stencilSize"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 973
    move-object v0, p0

    move-object/from16 v1, p1

    iput-object v1, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->this$0:Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 974
    const/16 v12, 0x3026

    const/16 v14, 0x3038

    const/16 v2, 0x3024

    const/16 v4, 0x3023

    const/16 v6, 0x3022

    const/16 v8, 0x3021

    const/16 v10, 0x3025

    move/from16 v3, p2

    move/from16 v5, p3

    move/from16 v7, p4

    move/from16 v9, p5

    move/from16 v11, p6

    move/from16 v13, p7

    filled-new-array/range {v2 .. v14}, [I

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lorg/godotengine/godot/gl/GLSurfaceView$BaseConfigChooser;-><init>(Lorg/godotengine/godot/gl/GLSurfaceView;[I)V

    .line 982
    const/4 v1, 0x1

    new-array v1, v1, [I

    iput-object v1, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mValue:[I

    .line 983
    move/from16 v1, p2

    iput v1, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mRedSize:I

    .line 984
    move/from16 v2, p3

    iput v2, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mGreenSize:I

    .line 985
    move/from16 v3, p4

    iput v3, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mBlueSize:I

    .line 986
    move/from16 v4, p5

    iput v4, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mAlphaSize:I

    .line 987
    move/from16 v5, p6

    iput v5, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mDepthSize:I

    .line 988
    move/from16 v6, p7

    iput v6, v0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mStencilSize:I

    .line 989
    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 2
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "config"    # Ljavax/microedition/khronos/egl/EGLConfig;
    .param p4, "attribute"    # I
    .param p5, "defaultValue"    # I

    .line 1020
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1021
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mValue:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    return v0

    .line 1023
    :cond_0
    return p5
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 16
    .param p1, "egl"    # Ljavax/microedition/khronos/egl/EGL10;
    .param p2, "display"    # Ljavax/microedition/khronos/egl/EGLDisplay;
    .param p3, "configs"    # [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 994
    move-object/from16 v6, p0

    move-object/from16 v7, p3

    array-length v8, v7

    const/4 v0, 0x0

    move v9, v0

    :goto_0
    if-ge v9, v8, :cond_1

    aget-object v10, v7, v9

    .line 995
    .local v10, "config":Ljavax/microedition/khronos/egl/EGLConfig;
    const/16 v4, 0x3025

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v10

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v11

    .line 997
    .local v11, "d":I
    const/16 v4, 0x3026

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v12

    .line 999
    .local v12, "s":I
    iget v0, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mDepthSize:I

    if-lt v11, v0, :cond_0

    iget v0, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mStencilSize:I

    if-lt v12, v0, :cond_0

    .line 1000
    const/16 v4, 0x3024

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v10

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v13

    .line 1002
    .local v13, "r":I
    const/16 v4, 0x3023

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    .line 1004
    .local v14, "g":I
    const/16 v4, 0x3022

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v15

    .line 1006
    .local v15, "b":I
    const/16 v4, 0x3021

    invoke-direct/range {v0 .. v5}, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    .line 1008
    .local v0, "a":I
    iget v1, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mRedSize:I

    if-ne v13, v1, :cond_0

    iget v1, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mGreenSize:I

    if-ne v14, v1, :cond_0

    iget v1, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mBlueSize:I

    if-ne v15, v1, :cond_0

    iget v1, v6, Lorg/godotengine/godot/gl/GLSurfaceView$ComponentSizeChooser;->mAlphaSize:I

    if-ne v0, v1, :cond_0

    .line 1010
    return-object v10

    .line 994
    .end local v0    # "a":I
    .end local v10    # "config":Ljavax/microedition/khronos/egl/EGLConfig;
    .end local v11    # "d":I
    .end local v12    # "s":I
    .end local v13    # "r":I
    .end local v14    # "g":I
    .end local v15    # "b":I
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1014
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method
