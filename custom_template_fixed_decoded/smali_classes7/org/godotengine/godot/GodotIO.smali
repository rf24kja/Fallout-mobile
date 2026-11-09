.class public Lorg/godotengine/godot/GodotIO;
.super Ljava/lang/Object;
.source "GodotIO.java"


# static fields
.field public static final SYSTEM_DIR_DCIM:I = 0x1

.field public static final SYSTEM_DIR_DESKTOP:I = 0x0

.field public static final SYSTEM_DIR_DOCUMENTS:I = 0x2

.field public static final SYSTEM_DIR_DOWNLOADS:I = 0x3

.field public static final SYSTEM_DIR_MOVIES:I = 0x4

.field public static final SYSTEM_DIR_MUSIC:I = 0x5

.field public static final SYSTEM_DIR_PICTURES:I = 0x6

.field public static final SYSTEM_DIR_RINGTONES:I = 0x7

.field private static final TAG:Ljava/lang/String;


# instance fields
.field final SCREEN_LANDSCAPE:I

.field final SCREEN_PORTRAIT:I

.field final SCREEN_REVERSE_LANDSCAPE:I

.field final SCREEN_REVERSE_PORTRAIT:I

.field final SCREEN_SENSOR:I

.field final SCREEN_SENSOR_LANDSCAPE:I

.field final SCREEN_SENSOR_PORTRAIT:I

.field edit:Lorg/godotengine/godot/input/GodotEditText;

.field private final godot:Lorg/godotengine/godot/Godot;

.field private final uniqueId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 66
    const-class v0, Lorg/godotengine/godot/GodotIO;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/GodotIO;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lorg/godotengine/godot/Godot;)V
    .locals 2
    .param p1, "godot"    # Lorg/godotengine/godot/Godot;

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const/4 v0, 0x0

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_LANDSCAPE:I

    .line 74
    const/4 v0, 0x1

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_PORTRAIT:I

    .line 75
    const/4 v0, 0x2

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_REVERSE_LANDSCAPE:I

    .line 76
    const/4 v0, 0x3

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_REVERSE_PORTRAIT:I

    .line 77
    const/4 v0, 0x4

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_SENSOR_LANDSCAPE:I

    .line 78
    const/4 v0, 0x5

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_SENSOR_PORTRAIT:I

    .line 79
    const/4 v0, 0x6

    iput v0, p0, Lorg/godotengine/godot/GodotIO;->SCREEN_SENSOR:I

    .line 82
    iput-object p1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    .line 83
    invoke-virtual {p1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "android_id"

    invoke-static {v0, v1}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "androidId":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 86
    const-string v0, ""

    .line 89
    :cond_0
    iput-object v0, p0, Lorg/godotengine/godot/GodotIO;->uniqueId:Ljava/lang/String;

    .line 90
    return-void
.end method

.method private getContext()Landroid/content/Context;
    .locals 2

    .line 93
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 94
    .local v0, "context":Landroid/content/Context;
    if-nez v0, :cond_0

    .line 95
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 97
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getCacheDir()Ljava/lang/String;
    .locals 1

    .line 147
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDataDir()Ljava/lang/String;
    .locals 1

    .line 163
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayCutouts()[I
    .locals 10

    .line 256
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    .line 257
    new-array v0, v2, [I

    return-object v0

    .line 260
    :cond_0
    const/4 v0, 0x0

    .line 261
    .local v0, "topView":Landroid/view/View;
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 262
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    goto :goto_0

    .line 263
    :cond_1
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getRenderView()Lorg/godotengine/godot/GodotRenderView;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 264
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getRenderView()Lorg/godotengine/godot/GodotRenderView;

    move-result-object v1

    invoke-interface {v1}, Lorg/godotengine/godot/GodotRenderView;->getView()Landroid/view/SurfaceView;

    move-result-object v0

    .line 267
    :cond_2
    :goto_0
    if-nez v0, :cond_3

    .line 268
    new-array v1, v2, [I

    return-object v1

    .line 270
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object v1

    .line 271
    .local v1, "cutout":Landroid/view/DisplayCutout;
    if-nez v1, :cond_4

    .line 272
    new-array v2, v2, [I

    return-object v2

    .line 274
    :cond_4
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getBoundingRects()Ljava/util/List;

    move-result-object v2

    .line 275
    .local v2, "rects":Ljava/util/List;, "Ljava/util/List<Landroid/graphics/Rect;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .line 276
    .local v3, "cutouts":I
    mul-int/lit8 v4, v3, 0x4

    new-array v4, v4, [I

    .line 277
    .local v4, "result":[I
    const/4 v5, 0x0

    .line 278
    .local v5, "index":I
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/graphics/Rect;

    .line 279
    .local v7, "rect":Landroid/graphics/Rect;
    add-int/lit8 v8, v5, 0x1

    .end local v5    # "index":I
    .local v8, "index":I
    iget v9, v7, Landroid/graphics/Rect;->left:I

    aput v9, v4, v5

    .line 280
    add-int/lit8 v5, v8, 0x1

    .end local v8    # "index":I
    .restart local v5    # "index":I
    iget v9, v7, Landroid/graphics/Rect;->top:I

    aput v9, v4, v8

    .line 281
    add-int/lit8 v8, v5, 0x1

    .end local v5    # "index":I
    .restart local v8    # "index":I
    invoke-virtual {v7}, Landroid/graphics/Rect;->width()I

    move-result v9

    aput v9, v4, v5

    .line 282
    add-int/lit8 v5, v8, 0x1

    .end local v8    # "index":I
    .restart local v5    # "index":I
    invoke-virtual {v7}, Landroid/graphics/Rect;->height()I

    move-result v9

    aput v9, v4, v8

    .line 283
    .end local v7    # "rect":Landroid/graphics/Rect;
    goto :goto_1

    .line 284
    :cond_5
    return-object v4
.end method

.method public getDisplayRotation()I
    .locals 4

    .line 374
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 376
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    .line 377
    .local v1, "display":Landroid/view/Display;
    if-eqz v0, :cond_0

    .line 378
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    goto :goto_0

    .line 379
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_1

    .line 380
    iget-object v2, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v2}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v1

    .line 383
    :cond_1
    :goto_0
    if-eqz v1, :cond_4

    .line 384
    invoke-virtual {v1}, Landroid/view/Display;->getRotation()I

    move-result v2

    .line 385
    .local v2, "rotation":I
    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 386
    const/16 v3, 0x5a

    return v3

    .line 387
    :cond_2
    const/4 v3, 0x2

    if-ne v2, v3, :cond_3

    .line 388
    const/16 v3, 0xb4

    return v3

    .line 389
    :cond_3
    const/4 v3, 0x3

    if-ne v2, v3, :cond_4

    .line 390
    const/16 v3, 0x10e

    return v3

    .line 393
    .end local v2    # "rotation":I
    :cond_4
    const/4 v2, 0x0

    return v2
.end method

.method public getDisplaySafeArea()[I
    .locals 9

    .line 217
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 218
    .local v0, "rect":Landroid/graphics/Rect;
    const/4 v1, 0x4

    new-array v1, v1, [I

    .line 220
    .local v1, "result":[I
    const/4 v2, 0x0

    .line 221
    .local v2, "topView":Landroid/view/View;
    iget-object v3, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 222
    iget-object v3, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    goto :goto_0

    .line 223
    :cond_0
    iget-object v3, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->getRenderView()Lorg/godotengine/godot/GodotRenderView;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 224
    iget-object v3, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->getRenderView()Lorg/godotengine/godot/GodotRenderView;

    move-result-object v3

    invoke-interface {v3}, Lorg/godotengine/godot/GodotRenderView;->getView()Landroid/view/SurfaceView;

    move-result-object v2

    .line 227
    :cond_1
    :goto_0
    if-eqz v2, :cond_5

    .line 229
    iget-object v3, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v3}, Lorg/godotengine/godot/Godot;->isInImmersiveMode()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 230
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v3

    .local v3, "insetTypes":I
    goto :goto_1

    .line 232
    .end local v3    # "insetTypes":I
    :cond_2
    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->systemBars()I

    move-result v3

    invoke-static {}, Landroidx/core/view/WindowInsetsCompat$Type;->displayCutout()I

    move-result v4

    or-int/2addr v3, v4

    .line 235
    .restart local v3    # "insetTypes":I
    :goto_1
    invoke-virtual {v2}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 236
    invoke-virtual {v2}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v4

    invoke-static {v4, v2}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;Landroid/view/View;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v4

    .line 237
    .local v4, "insetsCompat":Landroidx/core/view/WindowInsetsCompat;
    invoke-virtual {v4, v3}, Landroidx/core/view/WindowInsetsCompat;->getInsets(I)Landroidx/core/graphics/Insets;

    move-result-object v5

    .line 239
    .local v5, "insets":Landroidx/core/graphics/Insets;
    iget-object v6, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v6}, Lorg/godotengine/godot/Godot;->isInEdgeToEdgeMode()Z

    move-result v6

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v6, :cond_4

    iget-object v6, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v6}, Lorg/godotengine/godot/Godot;->isInImmersiveMode()Z

    move-result v6

    if-eqz v6, :cond_3

    goto :goto_2

    .line 244
    :cond_3
    aput v8, v1, v8

    .line 245
    aput v8, v1, v7

    goto :goto_3

    .line 240
    :cond_4
    :goto_2
    iget v6, v5, Landroidx/core/graphics/Insets;->left:I

    aput v6, v1, v8

    .line 241
    iget v6, v5, Landroidx/core/graphics/Insets;->top:I

    aput v6, v1, v7

    .line 247
    :goto_3
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v6

    iget v7, v5, Landroidx/core/graphics/Insets;->right:I

    sub-int/2addr v6, v7

    iget v7, v5, Landroidx/core/graphics/Insets;->left:I

    sub-int/2addr v6, v7

    const/4 v7, 0x2

    aput v6, v1, v7

    .line 248
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v6

    iget v7, v5, Landroidx/core/graphics/Insets;->bottom:I

    sub-int/2addr v6, v7

    iget v7, v5, Landroidx/core/graphics/Insets;->top:I

    sub-int/2addr v6, v7

    const/4 v7, 0x3

    aput v6, v1, v7

    .line 252
    .end local v3    # "insetTypes":I
    .end local v4    # "insetsCompat":Landroidx/core/view/WindowInsetsCompat;
    .end local v5    # "insets":Landroidx/core/graphics/Insets;
    :cond_5
    return-object v1
.end method

.method public getLocale()Ljava/lang/String;
    .locals 1

    .line 167
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    .line 171
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    return-object v0
.end method

.method public getScaledDensity()F
    .locals 2

    .line 182
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 184
    .local v0, "densityDpi":I
    const/16 v1, 0x280

    if-lt v0, v1, :cond_0

    .line 185
    const/high16 v1, 0x40800000    # 4.0f

    .local v1, "selectedScaledDensity":F
    goto :goto_0

    .line 186
    .end local v1    # "selectedScaledDensity":F
    :cond_0
    const/16 v1, 0x1e0

    if-lt v0, v1, :cond_1

    .line 187
    const/high16 v1, 0x40400000    # 3.0f

    .restart local v1    # "selectedScaledDensity":F
    goto :goto_0

    .line 188
    .end local v1    # "selectedScaledDensity":F
    :cond_1
    const/16 v1, 0x140

    if-lt v0, v1, :cond_2

    .line 189
    const/high16 v1, 0x40000000    # 2.0f

    .restart local v1    # "selectedScaledDensity":F
    goto :goto_0

    .line 190
    .end local v1    # "selectedScaledDensity":F
    :cond_2
    const/16 v1, 0xf0

    if-lt v0, v1, :cond_3

    .line 191
    const/high16 v1, 0x3fc00000    # 1.5f

    .restart local v1    # "selectedScaledDensity":F
    goto :goto_0

    .line 192
    .end local v1    # "selectedScaledDensity":F
    :cond_3
    const/16 v1, 0xa0

    if-lt v0, v1, :cond_4

    .line 193
    const/high16 v1, 0x3f800000    # 1.0f

    .restart local v1    # "selectedScaledDensity":F
    goto :goto_0

    .line 195
    .end local v1    # "selectedScaledDensity":F
    :cond_4
    const/high16 v1, 0x3f400000    # 0.75f

    .line 197
    .restart local v1    # "selectedScaledDensity":F
    :goto_0
    return v1
.end method

.method public getScreenDPI()I
    .locals 1

    .line 175
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    return v0
.end method

.method public getScreenOrientation()I
    .locals 3

    .line 338
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 339
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, -0x1

    if-nez v0, :cond_0

    .line 340
    return v1

    .line 343
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v2

    .line 344
    .local v2, "orientation":I
    packed-switch v2, :pswitch_data_0

    .line 369
    :pswitch_0
    return v1

    .line 352
    :pswitch_1
    const/4 v1, 0x3

    return v1

    .line 350
    :pswitch_2
    const/4 v1, 0x2

    return v1

    .line 358
    :pswitch_3
    const/4 v1, 0x5

    return v1

    .line 355
    :pswitch_4
    const/4 v1, 0x4

    return v1

    .line 362
    :pswitch_5
    const/4 v1, 0x6

    return v1

    .line 348
    :pswitch_6
    const/4 v1, 0x1

    return v1

    .line 346
    :pswitch_7
    const/4 v1, 0x0

    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method

.method public getScreenRefreshRate(D)D
    .locals 4
    .param p1, "fallback"    # D

    .line 201
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 203
    .local v0, "activity":Landroid/app/Activity;
    const/4 v1, 0x0

    .line 204
    .local v1, "display":Landroid/view/Display;
    if-eqz v0, :cond_0

    .line 205
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    goto :goto_0

    .line 206
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v2, v3, :cond_1

    .line 207
    iget-object v2, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v2}, Lorg/godotengine/godot/Godot;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getDisplay()Landroid/view/Display;

    move-result-object v1

    .line 210
    :cond_1
    :goto_0
    if-eqz v1, :cond_2

    .line 211
    invoke-virtual {v1}, Landroid/view/Display;->getRefreshRate()F

    move-result v2

    float-to-double v2, v2

    return-wide v2

    .line 213
    :cond_2
    return-wide p1
.end method

.method public getSystemDir(IZ)Ljava/lang/String;
    .locals 3
    .param p1, "idx"    # I
    .param p2, "shared_storage"    # Z

    .line 411
    packed-switch p1, :pswitch_data_0

    .line 414
    const/4 v0, 0x0

    .line 415
    .local v0, "what":Ljava/lang/String;
    goto :goto_0

    .line 442
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_0
    sget-object v0, Landroid/os/Environment;->DIRECTORY_RINGTONES:Ljava/lang/String;

    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 438
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_1
    sget-object v0, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 439
    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 434
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_2
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MUSIC:Ljava/lang/String;

    .line 435
    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 430
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_3
    sget-object v0, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    .line 431
    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 426
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_4
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    .line 427
    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 422
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_5
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DOCUMENTS:Ljava/lang/String;

    .line 423
    .restart local v0    # "what":Ljava/lang/String;
    goto :goto_0

    .line 418
    .end local v0    # "what":Ljava/lang/String;
    :pswitch_6
    sget-object v0, Landroid/os/Environment;->DIRECTORY_DCIM:Ljava/lang/String;

    .line 419
    .restart local v0    # "what":Ljava/lang/String;
    nop

    .line 446
    :goto_0
    if-eqz p2, :cond_2

    .line 447
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1d

    if-lt v1, v2, :cond_0

    .line 448
    sget-object v1, Lorg/godotengine/godot/GodotIO;->TAG:Ljava/lang/String;

    const-string v2, "Shared storage access is limited on Android 10 and higher."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 451
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 453
    :cond_1
    invoke-static {v0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 456
    :cond_2
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getTempDir()Ljava/lang/String;
    .locals 3

    .line 151
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotIO;->getCacheDir()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/tmp"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 153
    .local v0, "tempDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 154
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 155
    sget-object v1, Lorg/godotengine/godot/GodotIO;->TAG:Ljava/lang/String;

    const-string v2, "Unable to create temp dir"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 159
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getUniqueID()Ljava/lang/String;
    .locals 1

    .line 461
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->uniqueId:Ljava/lang/String;

    return-object v0
.end method

.method public hasHardwareKeyboard()Z
    .locals 1

    .line 288
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    if-eqz v0, :cond_0

    .line 289
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    invoke-virtual {v0}, Lorg/godotengine/godot/input/GodotEditText;->hasHardwareKeyboard()Z

    move-result v0

    return v0

    .line 291
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hideKeyboard()V
    .locals 1

    .line 302
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    invoke-virtual {v0}, Lorg/godotengine/godot/input/GodotEditText;->hideKeyboard()V

    .line 304
    :cond_0
    return-void
.end method

.method public openURI(Ljava/lang/String;)I
    .locals 7
    .param p1, "uriString"    # Ljava/lang/String;

    .line 106
    const-string v0, ""

    :try_start_0
    invoke-direct {p0}, Lorg/godotengine/godot/GodotIO;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 109
    .local v1, "context":Landroid/content/Context;
    move-object v2, v0

    .line 110
    .local v2, "dataType":Ljava/lang/String;
    const/4 v3, 0x0

    .line 112
    .local v3, "grantReadUriPermission":Z
    const-string v4, "/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v5, "file://"

    if-nez v4, :cond_1

    :try_start_1
    invoke-virtual {p1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 124
    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .local v0, "dataUri":Landroid/net/Uri;
    goto :goto_1

    .line 113
    .end local v0    # "dataUri":Landroid/net/Uri;
    :cond_1
    :goto_0
    move-object v4, p1

    .line 115
    .local v4, "filePath":Ljava/lang/String;
    const/4 v3, 0x1

    .line 116
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 117
    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    .line 120
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 121
    .local v0, "targetFile":Ljava/io/File;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ".fileprovider"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v5, v0}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v5

    .line 122
    .local v5, "dataUri":Landroid/net/Uri;
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v6

    move-object v2, v6

    .line 123
    .end local v0    # "targetFile":Ljava/io/File;
    .end local v4    # "filePath":Ljava/lang/String;
    move-object v0, v5

    .line 127
    .end local v5    # "dataUri":Landroid/net/Uri;
    .local v0, "dataUri":Landroid/net/Uri;
    :goto_1
    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4}, Landroid/content/Intent;-><init>()V

    .line 128
    .local v4, "intent":Landroid/content/Intent;
    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const/high16 v6, 0x10000000

    invoke-virtual {v5, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 129
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 130
    invoke-virtual {v4, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_2

    .line 132
    :cond_3
    invoke-virtual {v4, v0, v2}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 134
    :goto_2
    if-eqz v3, :cond_4

    .line 135
    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 138
    :cond_4
    invoke-virtual {v1, v4}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 139
    sget-object v5, Lorg/godotengine/godot/error/Error;->OK:Lorg/godotengine/godot/error/Error;

    invoke-virtual {v5}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return v5

    .line 140
    .end local v0    # "dataUri":Landroid/net/Uri;
    .end local v1    # "context":Landroid/content/Context;
    .end local v2    # "dataType":Ljava/lang/String;
    .end local v3    # "grantReadUriPermission":Z
    .end local v4    # "intent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/GodotIO;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to open uri "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 142
    sget-object v1, Lorg/godotengine/godot/error/Error;->FAILED:Lorg/godotengine/godot/error/Error;

    invoke-virtual {v1}, Lorg/godotengine/godot/error/Error;->toNativeValue()I

    move-result v1

    return v1
.end method

.method public setEdit(Lorg/godotengine/godot/input/GodotEditText;)V
    .locals 0
    .param p1, "_edit"    # Lorg/godotengine/godot/input/GodotEditText;

    .line 397
    iput-object p1, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    .line 398
    return-void
.end method

.method public setScreenOrientation(I)V
    .locals 2
    .param p1, "p_orientation"    # I

    .line 307
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 308
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 309
    return-void

    .line 312
    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 332
    :pswitch_0
    const/16 v1, 0xd

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    goto :goto_0

    .line 329
    :pswitch_1
    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 330
    goto :goto_0

    .line 326
    :pswitch_2
    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 327
    goto :goto_0

    .line 323
    :pswitch_3
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 324
    goto :goto_0

    .line 320
    :pswitch_4
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 321
    goto :goto_0

    .line 317
    :pswitch_5
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 318
    goto :goto_0

    .line 314
    :pswitch_6
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 315
    nop

    .line 335
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public showKeyboard(Ljava/lang/String;IIII)V
    .locals 7
    .param p1, "p_existing_text"    # Ljava/lang/String;
    .param p2, "p_type"    # I
    .param p3, "p_max_input_length"    # I
    .param p4, "p_cursor_start"    # I
    .param p5, "p_cursor_end"    # I

    .line 296
    iget-object v0, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    if-eqz v0, :cond_0

    .line 297
    iget-object v1, p0, Lorg/godotengine/godot/GodotIO;->edit:Lorg/godotengine/godot/input/GodotEditText;

    invoke-static {}, Lorg/godotengine/godot/input/GodotEditText$VirtualKeyboardType;->values()[Lorg/godotengine/godot/input/GodotEditText$VirtualKeyboardType;

    move-result-object v0

    aget-object v3, v0, p2

    move-object v2, p1

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lorg/godotengine/godot/input/GodotEditText;->showKeyboard(Ljava/lang/String;Lorg/godotengine/godot/input/GodotEditText$VirtualKeyboardType;III)V

    .line 299
    :cond_0
    return-void
.end method
