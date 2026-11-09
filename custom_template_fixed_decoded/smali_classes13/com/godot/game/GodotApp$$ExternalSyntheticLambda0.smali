.class public final synthetic Lcom/godot/game/GodotApp$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/core/splashscreen/SplashScreen$KeepOnScreenCondition;


# instance fields
.field public final synthetic f$0:Lorg/godotengine/godot/Godot;


# direct methods
.method public synthetic constructor <init>(Lorg/godotengine/godot/Godot;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda0;->f$0:Lorg/godotengine/godot/Godot;

    return-void
.end method


# virtual methods
.method public final shouldKeepOnScreen()Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/godot/game/GodotApp$$ExternalSyntheticLambda0;->f$0:Lorg/godotengine/godot/Godot;

    invoke-static {v0}, Lcom/godot/game/GodotApp;->lambda$onCreate$1(Lorg/godotengine/godot/Godot;)Z

    move-result v0

    return v0
.end method
