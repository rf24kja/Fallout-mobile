.class public Lorg/godotengine/godot/GodotFragment;
.super Landroidx/fragment/app/Fragment;
.source "GodotFragment.java"

# interfaces
.implements Lorg/godotengine/godot/GodotHost;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private godot:Lorg/godotengine/godot/Godot;

.field private godotContainerLayout:Landroid/widget/FrameLayout;

.field private parentHost:Lorg/godotengine/godot/GodotHost;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const-class v0, Lorg/godotengine/godot/GodotFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/GodotFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 60
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method

.method private performEngineInitialization()V
    .locals 6

    .line 133
    :try_start_0
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->getCommandLine()Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {p0, v2}, Lorg/godotengine/godot/GodotFragment;->getHostPlugins(Lorg/godotengine/godot/Godot;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lorg/godotengine/godot/Godot;->initEngine(Lorg/godotengine/godot/GodotHost;Ljava/util/List;Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 137
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onInitRenderView(Lorg/godotengine/godot/GodotHost;)Landroid/widget/FrameLayout;

    move-result-object v0

    iput-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    .line 138
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 147
    goto :goto_1

    .line 139
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to initialize engine render view"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unable to initialize Godot engine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :catch_0
    move-exception v0

    .line 142
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lorg/godotengine/godot/GodotFragment;->TAG:Ljava/lang/String;

    const-string v2, "Engine initialization failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 143
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 144
    sget v1, Lorg/godotengine/godot/R$string;->error_engine_setup_message:I

    invoke-virtual {p0, v1}, Lorg/godotengine/godot/GodotFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 145
    :cond_2
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_0
    nop

    .line 146
    .local v1, "errorMessage":Ljava/lang/String;
    iget-object v2, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    sget v3, Lorg/godotengine/godot/R$string;->text_error_title:I

    invoke-virtual {p0, v3}, Lorg/godotengine/godot/GodotFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lorg/godotengine/godot/GodotFragment$$ExternalSyntheticLambda0;

    invoke-direct {v5, v4}, Lorg/godotengine/godot/GodotFragment$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/Godot;)V

    invoke-virtual {v2, v1, v3, v5}, Lorg/godotengine/godot/Godot;->alert(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 148
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "errorMessage":Ljava/lang/String;
    :goto_1
    return-void
.end method


# virtual methods
.method public bridge synthetic getActivity()Landroid/app/Activity;
    .locals 1

    .line 60
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public getBuildProvider()Lorg/godotengine/godot/BuildProvider;
    .locals 1

    .line 297
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 298
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getBuildProvider()Lorg/godotengine/godot/BuildProvider;

    move-result-object v0

    return-object v0

    .line 300
    :cond_0
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

    .line 202
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->getCommandLine()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getGodot()Lorg/godotengine/godot/Godot;
    .locals 1

    .line 71
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    return-object v0
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

    .line 251
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->getHostPlugins(Lorg/godotengine/godot/Godot;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 254
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .line 105
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 106
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->onActivityResult(IILandroid/content/Intent;)V

    .line 107
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 76
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 77
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/GodotHost;

    iput-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    instance-of v0, v0, Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_1

    .line 80
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lorg/godotengine/godot/GodotHost;

    iput-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    .line 82
    :cond_1
    :goto_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 196
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0}, Lorg/godotengine/godot/Godot;->onBackPressed()V

    .line 197
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 98
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 99
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/Godot;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 100
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "icicle"    # Landroid/os/Bundle;

    .line 118
    const-string v0, "Startup"

    const-string v1, "GodotFragment::onCreate"

    invoke-static {v0, v1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->beginBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 121
    iget-object v2, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v2, :cond_0

    .line 122
    iget-object v2, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v2}, Lorg/godotengine/godot/GodotHost;->getGodot()Lorg/godotengine/godot/Godot;

    move-result-object v2

    iput-object v2, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    .line 124
    :cond_0
    iget-object v2, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    if-nez v2, :cond_1

    .line 125
    invoke-virtual {p0}, Lorg/godotengine/godot/GodotFragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lorg/godotengine/godot/Godot;->getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;

    move-result-object v2

    iput-object v2, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    .line 127
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/GodotFragment;->performEngineInitialization()V

    .line 128
    invoke-static {v0, v1}, Lorg/godotengine/godot/utils/BenchmarkUtils;->endBenchmarkMeasure(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "icicle"    # Landroid/os/Bundle;

    .line 152
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 153
    sget-object v0, Lorg/godotengine/godot/GodotFragment;->TAG:Ljava/lang/String;

    const-string v1, "Godot container layout already has a parent, removing it."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 157
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .line 162
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 163
    sget-object v0, Lorg/godotengine/godot/GodotFragment;->TAG:Ljava/lang/String;

    const-string v1, "Removing Godot container layout from parent during destruction."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 167
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onDestroy(Lorg/godotengine/godot/GodotHost;)V

    .line 168
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 169
    return-void
.end method

.method public onDetach()V
    .locals 2

    .line 86
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 87
    sget-object v0, Lorg/godotengine/godot/GodotFragment;->TAG:Ljava/lang/String;

    const-string v1, "Cleaning up Godot container layout during detach."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lorg/godotengine/godot/GodotFragment;->godotContainerLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 91
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    .line 93
    return-void
.end method

.method public onDistractionFreeModeChanged(Ljava/lang/Boolean;)V
    .locals 1
    .param p1, "enabled"    # Ljava/lang/Boolean;

    .line 290
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 291
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onDistractionFreeModeChanged(Ljava/lang/Boolean;)V

    .line 293
    :cond_0
    return-void
.end method

.method public onEditorWorkspaceSelected(Ljava/lang/String;)V
    .locals 1
    .param p1, "workspace"    # Ljava/lang/String;

    .line 283
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onEditorWorkspaceSelected(Ljava/lang/String;)V

    .line 286
    :cond_0
    return-void
.end method

.method public onGodotForceQuit(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 223
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onGodotForceQuit(Lorg/godotengine/godot/Godot;)V

    .line 226
    :cond_0
    return-void
.end method

.method public onGodotForceQuit(I)Z
    .locals 1
    .param p1, "godotInstanceId"    # I

    .line 230
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onGodotForceQuit(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onGodotMainLoopStarted()V
    .locals 1

    .line 216
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->onGodotMainLoopStarted()V

    .line 219
    :cond_0
    return-void
.end method

.method public onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "instance"    # Lorg/godotengine/godot/Godot;

    .line 235
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 236
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onGodotRestartRequested(Lorg/godotengine/godot/Godot;)V

    .line 238
    :cond_0
    return-void
.end method

.method public onGodotSetupCompleted()V
    .locals 1

    .line 208
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0}, Lorg/godotengine/godot/GodotHost;->onGodotSetupCompleted()V

    .line 211
    :cond_0
    return-void
.end method

.method public onNewGodotInstanceRequested([Ljava/lang/String;)I
    .locals 1
    .param p1, "args"    # [Ljava/lang/String;

    .line 242
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 243
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->onNewGodotInstanceRequested([Ljava/lang/String;)I

    move-result v0

    return v0

    .line 245
    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public onPause()V
    .locals 1

    .line 173
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 174
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onPause(Lorg/godotengine/godot/GodotHost;)V

    .line 175
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .line 112
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 113
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p1, p2, p3}, Lorg/godotengine/godot/Godot;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 114
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 191
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 192
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onResume(Lorg/godotengine/godot/GodotHost;)V

    .line 193
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 185
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStart()V

    .line 186
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onStart(Lorg/godotengine/godot/GodotHost;)V

    .line 187
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 179
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 180
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->godot:Lorg/godotengine/godot/Godot;

    invoke-virtual {v0, p0}, Lorg/godotengine/godot/Godot;->onStop(Lorg/godotengine/godot/GodotHost;)V

    .line 181
    return-void
.end method

.method public signApk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/godotengine/godot/error/Error;
    .locals 7
    .param p1, "inputPath"    # Ljava/lang/String;
    .param p2, "outputPath"    # Ljava/lang/String;
    .param p3, "keystorePath"    # Ljava/lang/String;
    .param p4, "keystoreUser"    # Ljava/lang/String;
    .param p5, "keystorePassword"    # Ljava/lang/String;

    .line 259
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 260
    iget-object v1, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v1 .. v6}, Lorg/godotengine/godot/GodotHost;->signApk(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/godotengine/godot/error/Error;

    move-result-object v0

    return-object v0

    .line 262
    :cond_0
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    return-object v0
.end method

.method public supportsFeature(Ljava/lang/String;)Z
    .locals 1
    .param p1, "featureTag"    # Ljava/lang/String;

    .line 275
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 276
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->supportsFeature(Ljava/lang/String;)Z

    move-result v0

    return v0

    .line 278
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public verifyApk(Ljava/lang/String;)Lorg/godotengine/godot/error/Error;
    .locals 1
    .param p1, "apkPath"    # Ljava/lang/String;

    .line 267
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lorg/godotengine/godot/GodotFragment;->parentHost:Lorg/godotengine/godot/GodotHost;

    invoke-interface {v0, p1}, Lorg/godotengine/godot/GodotHost;->verifyApk(Ljava/lang/String;)Lorg/godotengine/godot/error/Error;

    move-result-object v0

    return-object v0

    .line 270
    :cond_0
    sget-object v0, Lorg/godotengine/godot/error/Error;->ERR_UNAVAILABLE:Lorg/godotengine/godot/error/Error;

    return-object v0
.end method
