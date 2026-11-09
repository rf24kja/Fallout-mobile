.class public final synthetic Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic f$0:[Ljava/lang/String;

.field public final synthetic f$1:J


# direct methods
.method public synthetic constructor <init>([Ljava/lang/String;J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;->f$0:[Ljava/lang/String;

    iput-wide p2, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;->f$1:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;->f$0:[Ljava/lang/String;

    iget-wide v1, p0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;->f$1:J

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->$r8$lambda$NwN3Yvl8cH-xBgLJv-AJNRX4Omc([Ljava/lang/String;JLjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
