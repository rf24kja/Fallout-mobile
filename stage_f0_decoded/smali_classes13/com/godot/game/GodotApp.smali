.class public Lcom/godot/game/GodotApp;
.super Lorg/godotengine/godot/GodotActivity;
.source "GodotApp.java"


# instance fields
.field private final updateWindowAppearance:Ljava/lang/Runnable;


# direct methods
.method public static synthetic $r8$lambda$56vBLMgu49qK9JtZPrh48MItZGc(Lcom/godot/game/GodotApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/godot/game/GodotApp;->lambda$new$0()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 49
    const-string v0, "GODOT"

    const-string v1, "standard"

    const-string v2, "mono"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    :try_start_0
    const-string v1, "Loading System.Security.Cryptography.Native.Android library"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    const-string v1, "System.Security.Cryptography.Native.Android"

    invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/UnsatisfiedLinkError; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    goto :goto_0

    .line 53
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/UnsatisfiedLinkError;
    const-string v2, "Unable to load System.Security.Cryptography.Native.Android library"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .end local v1    # "e":Ljava/lang/UnsatisfiedLinkError;
    :cond_0
    :goto_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 46
    invoke-direct {p0}, Lorg/godotengine/godot/GodotActivity;-><init>()V

    .line 59
    new-instance v0, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0}, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda1;-><init>(Lcom/godot/game/GodotApp;)V

    iput-object v0, p0, Lcom/godot/game/GodotApp;->updateWindowAppearance:Ljava/lang/Runnable;

    return-void
.end method

.method private synthetic lambda$new$0()V
    .locals 3

    .line 60
    invoke-virtual {p0}, Lcom/godot/game/GodotApp;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v0

    .line 61
    .local v0, "godot":Lorg/godotengine/godot/Godot;
    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInImmersiveMode()Z

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lorg/godotengine/godot/Godot;->enableImmersiveMode(ZZ)V

    .line 63
    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->isInEdgeToEdgeMode()Z

    move-result v1

    invoke-virtual {v0, v1, v2}, Lorg/godotengine/godot/Godot;->enableEdgeToEdge(ZZ)V

    .line 64
    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->setSystemBarsAppearance()V

    .line 66
    :cond_0
    return-void
.end method

.method static synthetic lambda$onCreate$1(Lorg/godotengine/godot/Godot;)Z
    .locals 2
    .param p0, "godot"    # Lorg/godotengine/godot/Godot;

    .line 76
    invoke-virtual {p0}, Lorg/godotengine/godot/Godot;->getRunStatus()Lorg/godotengine/godot/Godot$RunStatus;

    move-result-object v0

    sget-object v1, Lorg/godotengine/godot/Godot$RunStatus;->STARTED:Lorg/godotengine/godot/Godot$RunStatus;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method protected isPiPEnabled()Z
    .locals 1

    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 70
    invoke-static {p0}, Landroidx/core/splashscreen/SplashScreen;->installSplashScreen(Landroid/app/Activity;)Landroidx/core/splashscreen/SplashScreen;

    move-result-object v0

    .line 71
    .local v0, "splashScreen":Landroidx/core/splashscreen/SplashScreen;
    invoke-static {p0}, Landroidx/activity/EdgeToEdge;->enable(Landroidx/activity/ComponentActivity;)V

    .line 72
    invoke-super {p0, p1}, Lorg/godotengine/godot/GodotActivity;->onCreate(Landroid/os/Bundle;)V

    .line 74
    invoke-virtual {p0}, Lcom/godot/game/GodotApp;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v1

    .line 75
    .local v1, "godot":Lorg/godotengine/godot/Godot;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot;->getDisableGodotSplash()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    new-instance v2, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda0;

    invoke-direct {v2, v1}, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-virtual {v0, v2}, Landroidx/core/splashscreen/SplashScreen;->setKeepOnScreenCondition(Landroidx/core/splashscreen/SplashScreen$KeepOnScreenCondition;)V

    .line 78
    :cond_0
    return-void
.end method

.method public onGodotForceQuit(Lorg/godotengine/godot/Godot;)V
    .locals 2
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 94
    const-string v0, "standard"

    const-string v1, "instrumented"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 97
    invoke-super {p0, p1}, Lorg/godotengine/godot/GodotActivity;->onGodotForceQuit(Lorg/godotengine/godot/Godot;)V

    .line 99
    :cond_0
    return-void
.end method

.method public onGodotMainLoopStarted()V
    .locals 1

    .line 88
    invoke-super {p0}, Lorg/godotengine/godot/GodotActivity;->onGodotMainLoopStarted()V

    .line 89
    iget-object v0, p0, Lcom/godot/game/GodotApp;->updateWindowAppearance:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/godot/game/GodotApp;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 90
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 82
    invoke-super {p0}, Lorg/godotengine/godot/GodotActivity;->onResume()V

    .line 83
    iget-object v0, p0, Lcom/godot/game/GodotApp;->updateWindowAppearance:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 84
    return-void
.end method
