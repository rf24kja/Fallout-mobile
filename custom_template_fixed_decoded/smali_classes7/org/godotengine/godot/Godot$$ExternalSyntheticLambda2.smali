.class public final synthetic Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lorg/godotengine/godot/Godot;


# direct methods
.method public synthetic constructor <init>(Lorg/godotengine/godot/Godot;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda2;->f$0:Lorg/godotengine/godot/Godot;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lorg/godotengine/godot/Godot$$ExternalSyntheticLambda2;->f$0:Lorg/godotengine/godot/Godot;

    invoke-static {v0}, Lorg/godotengine/godot/Godot;->$r8$lambda$jkgBAkiDEqpBevd9ZyV19G0D2hI(Lorg/godotengine/godot/Godot;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
