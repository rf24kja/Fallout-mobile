.class Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;
.super Ljava/lang/Object;
.source "GLSurfaceView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/gl/GLSurfaceView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EglHelper"
.end annotation


# instance fields
.field mEgl:Ljavax/microedition/khronos/egl/EGL10;

.field mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

.field mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field private mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/gl/GLSurfaceView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Lorg/godotengine/godot/gl/GLSurfaceView;",
            ">;)V"
        }
    .end annotation

    .line 1052
    .local p1, "glSurfaceViewWeakRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lorg/godotengine/godot/gl/GLSurfaceView;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1053
    iput-object p1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 1054
    return-void
.end method

.method private destroySurfaceImp()V
    .locals 5

    .line 1219
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-eq v0, v1, :cond_1

    .line 1220
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    .line 1223
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 1224
    .local v0, "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    if-eqz v0, :cond_0

    .line 1225
    invoke-static {v0}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmEGLWindowSurfaceFactory(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v1, v2, v3, v4}, Lorg/godotengine/godot/gl/GLSurfaceView$EGLWindowSurfaceFactory;->destroySurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)V

    .line 1227
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1229
    .end local v0    # "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    :cond_1
    return-void
.end method

.method public static formatEglError(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .param p0, "function"    # Ljava/lang/String;
    .param p1, "error"    # I

    .line 1266
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Lorg/godotengine/godot/gl/EGLLogWrapper;->getErrorString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "function"    # Ljava/lang/String;
    .param p2, "error"    # I

    .line 1262
    invoke-static {p1, p2}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->formatEglError(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1263
    return-void
.end method

.method private throwEglException(Ljava/lang/String;)V
    .locals 1
    .param p1, "function"    # Ljava/lang/String;

    .line 1249
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    invoke-static {p1, v0}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->throwEglException(Ljava/lang/String;I)V

    .line 1250
    return-void
.end method

.method public static throwEglException(Ljava/lang/String;I)V
    .locals 2
    .param p0, "function"    # Ljava/lang/String;
    .param p1, "error"    # I

    .line 1253
    invoke-static {p0, p1}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->formatEglError(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 1258
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method createGL()Ljavax/microedition/khronos/opengles/GL;
    .locals 5

    .line 1178
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {v0}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    .line 1179
    .local v0, "gl":Ljavax/microedition/khronos/opengles/GL;
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 1180
    .local v1, "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    if-eqz v1, :cond_3

    .line 1181
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmGLWrapper(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$GLWrapper;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1182
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmGLWrapper(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$GLWrapper;

    move-result-object v2

    invoke-interface {v2, v0}, Lorg/godotengine/godot/gl/GLSurfaceView$GLWrapper;->wrap(Ljavax/microedition/khronos/opengles/GL;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    .line 1185
    :cond_0
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmDebugFlags(Lorg/godotengine/godot/gl/GLSurfaceView;)I

    move-result v2

    and-int/lit8 v2, v2, 0x3

    if-eqz v2, :cond_3

    .line 1186
    const/4 v2, 0x0

    .line 1187
    .local v2, "configFlags":I
    const/4 v3, 0x0

    .line 1188
    .local v3, "log":Ljava/io/Writer;
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmDebugFlags(Lorg/godotengine/godot/gl/GLSurfaceView;)I

    move-result v4

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_1

    .line 1189
    or-int/lit8 v2, v2, 0x1

    .line 1191
    :cond_1
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmDebugFlags(Lorg/godotengine/godot/gl/GLSurfaceView;)I

    move-result v4

    and-int/lit8 v4, v4, 0x2

    if-eqz v4, :cond_2

    .line 1192
    new-instance v4, Lorg/godotengine/godot/gl/GLSurfaceView$LogWriter;

    invoke-direct {v4}, Lorg/godotengine/godot/gl/GLSurfaceView$LogWriter;-><init>()V

    move-object v3, v4

    .line 1194
    :cond_2
    invoke-static {v0, v2, v3}, Landroid/opengl/GLDebugHelper;->wrap(Ljavax/microedition/khronos/opengles/GL;ILjava/io/Writer;)Ljavax/microedition/khronos/opengles/GL;

    move-result-object v0

    .line 1197
    .end local v2    # "configFlags":I
    .end local v3    # "log":Ljava/io/Writer;
    :cond_3
    return-object v0
.end method

.method public createSurface()Z
    .locals 7

    .line 1121
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    if-eqz v0, :cond_7

    .line 1124
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_6

    .line 1127
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    if-eqz v0, :cond_5

    .line 1135
    invoke-direct {p0}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->destroySurfaceImp()V

    .line 1140
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 1141
    .local v0, "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    if-eqz v0, :cond_0

    .line 1142
    invoke-static {v0}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmEGLWindowSurfaceFactory(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$EGLWindowSurfaceFactory;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 1143
    invoke-virtual {v0}, Lorg/godotengine/godot/gl/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v5

    .line 1142
    invoke-interface {v1, v2, v3, v4, v5}, Lorg/godotengine/godot/gl/GLSurfaceView$EGLWindowSurfaceFactory;->createWindowSurface(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object v1

    iput-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    goto :goto_0

    .line 1145
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1148
    :goto_0
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    if-ne v1, v3, :cond_1

    goto :goto_1

    .line 1160
    :cond_1
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v5, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v6, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v1, v3, v4, v5, v6}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1165
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    const-string v3, "EGLHelper"

    const-string v4, "eglMakeCurrent"

    invoke-static {v3, v4, v1}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1166
    return v2

    .line 1169
    :cond_2
    const/4 v1, 0x1

    return v1

    .line 1149
    :cond_3
    :goto_1
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v1

    .line 1150
    .local v1, "error":I
    const/16 v3, 0x300b

    if-ne v1, v3, :cond_4

    .line 1151
    const-string v3, "EglHelper"

    const-string v4, "createWindowSurface returned EGL_BAD_NATIVE_WINDOW."

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1153
    :cond_4
    return v2

    .line 1128
    .end local v0    # "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    .end local v1    # "error":I
    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "mEglConfig not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1125
    :cond_6
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglDisplay not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1122
    :cond_7
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "egl not initialized"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public destroySurface()V
    .locals 0

    .line 1215
    invoke-direct {p0}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->destroySurfaceImp()V

    .line 1216
    return-void
.end method

.method public finish()V
    .locals 6

    .line 1235
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1236
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 1237
    .local v0, "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    if-eqz v0, :cond_0

    .line 1238
    invoke-static {v0}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmEGLContextFactory(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;

    move-result-object v2

    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v5, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v2, v3, v4, v5}, Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;->destroyContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)V

    .line 1240
    :cond_0
    iput-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1242
    .end local v0    # "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    :cond_1
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eqz v0, :cond_2

    .line 1243
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    .line 1244
    iput-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 1246
    :cond_2
    return-void
.end method

.method public start()V
    .locals 7

    .line 1066
    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    iput-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    .line 1071
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    .line 1073
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_DISPLAY:Ljavax/microedition/khronos/egl/EGLDisplay;

    if-eq v0, v1, :cond_4

    .line 1080
    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1081
    .local v0, "version":[I
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v1, v2, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1084
    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mGLSurfaceViewWeakRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/gl/GLSurfaceView;

    .line 1085
    .local v1, "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 1086
    iput-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 1087
    iput-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    goto :goto_0

    .line 1089
    :cond_0
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmEGLConfigChooser(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$EGLConfigChooser;

    move-result-object v3

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v5, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v3, v4, v5}, Lorg/godotengine/godot/gl/GLSurfaceView$EGLConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object v3

    iput-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    .line 1095
    invoke-static {v1}, Lorg/godotengine/godot/gl/GLSurfaceView;->-$$Nest$fgetmEGLContextFactory(Lorg/godotengine/godot/gl/GLSurfaceView;)Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;

    move-result-object v3

    iget-object v4, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v5, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v6, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {v3, v4, v5, v6}, Lorg/godotengine/godot/gl/GLSurfaceView$EGLContextFactory;->createContext(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object v3

    iput-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1097
    :goto_0
    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    if-ne v3, v4, :cond_2

    .line 1098
    :cond_1
    iput-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglContext:Ljavax/microedition/khronos/egl/EGLContext;

    .line 1099
    const-string v3, "createContext"

    invoke-direct {p0, v3}, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->throwEglException(Ljava/lang/String;)V

    .line 1105
    :cond_2
    iput-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    .line 1106
    return-void

    .line 1082
    .end local v1    # "view":Lorg/godotengine/godot/gl/GLSurfaceView;
    :cond_3
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "eglInitialize failed"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1074
    .end local v0    # "version":[I
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "eglGetDisplay failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public swap()I
    .locals 3

    .line 1205
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEglSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1206
    iget-object v0, p0, Lorg/godotengine/godot/gl/GLSurfaceView$EglHelper;->mEgl:Ljavax/microedition/khronos/egl/EGL10;

    invoke-interface {v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    return v0

    .line 1208
    :cond_0
    const/16 v0, 0x3000

    return v0
.end method
