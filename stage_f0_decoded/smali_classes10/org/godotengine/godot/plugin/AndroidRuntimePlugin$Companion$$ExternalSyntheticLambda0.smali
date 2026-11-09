.class public final synthetic Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lorg/godotengine/godot/variant/Callable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;->f$1:Lorg/godotengine/godot/variant/Callable;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;->f$1:Lorg/godotengine/godot/variant/Callable;

    invoke-static {v0, v1, p1, p2, p3}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->$r8$lambda$Cthj7dhkTJChPGHeD4sULGeVZyo(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
