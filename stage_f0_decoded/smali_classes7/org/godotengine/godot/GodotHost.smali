.class public interface abstract Lorg/godotengine/godot/GodotHost;
.super Ljava/lang/Object;
.source "GodotHost.java"


# virtual methods
.method public abstract getActivity()Landroid/app/Activity;
.end method

.method public getBuildProvider()Lorg/godotengine/godot/BuildProvider;
    .locals 1

    .line 181
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCommandLine()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 53
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract getGodot()Lorg/godotengine/godot/Godot;
.end method

.method public getHostPlugins(Lorg/godotengine/godot/Godot;)Ljava/util/Set;
    .locals 1
    .param p1, "engine"    # Lorg/godotengine/godot/Godot;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/godotengine/godot/Godot;",
            ")",
            "Ljava/util/Set<",
            "Lorg/godotengine/godot/plugin/GodotPlugin;",
            ">;"
        }
    .end annotation

    .line 114
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public onDistractionFreeModeChanged(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "enabled"    # Ljava/lang/Boolean;

    .line 159
    return-void
.end method

.method public onEditorWorkspaceSelected(Ljava/lang/String;)V
    .locals 0
    .param p1, "workspace"    # Ljava/lang/String;

    .line 154
    return-void
.end method

.method public onGodotForceQuit(Lorg/godotengine/godot/Godot;)V
    .locals 0
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 69
    return-void
.end method

.method public onGodotForceQuit(I)Z
    .locals 1
    .param p1, "godotInstanceId"    # I

    .line 78
    const/4 v0, 0x0

    return v0
.end method

.method public onGodotMainLoopStarted()V
    .locals 0

    .line 64
    return-void
.end method

.method public onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V
    .locals 0
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 85
    return-void
.end method

.method public onGodotSetupCompleted()V
    .locals 0

    .line 59
    return-void
.end method

.method public onNewGodotInstanceRequested([Ljava/lang/String;)I
    .locals 1
    .param p1, "args"    # [Ljava/lang/String;

    .line 96
    const/4 v0, -0x1

    return v0
.end method

.method public runOnHostThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "action"    # Ljava/lang/Runnable;

    .line 165
    if-nez p1, :cond_0

    .line 166
    return-void

    .line 169
    :cond_0
    invoke-interface {p0}, Lorg/godotengine/godot/GodotHost;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 170
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_1

    .line 171
    invoke-virtual {v0, p1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 173
    :cond_1
    return-void
.end method

.method public signApk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/godotengine/godot/error/Error;
    .locals 1
    .param p1, "inputPath"    # Ljava/lang/String;
    .param p2, "outputPath"    # Ljava/lang/String;
    .param p3, "keystorePath"    # Ljava/lang/String;
    .param p4, "keystoreUser"    # Ljava/lang/String;
    .param p5, "keystorePassword"    # Ljava/lang/String;

    .line 129
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    return-object v0
.end method

.method public supportsFeature(Ljava/lang/String;)Z
    .locals 1
    .param p1, "featureTag"    # Ljava/lang/String;

    .line 148
    const/4 v0, 0x0

    return v0
.end method

.method public verifyApk(Ljava/lang/String;)Lorg/godotengine/godot/error/Error;
    .locals 1
    .param p1, "apkPath"    # Ljava/lang/String;

    .line 139
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    return-object v0
.end method
