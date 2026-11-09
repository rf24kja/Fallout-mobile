.class public final synthetic Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Lorg/godotengine/godot/GodotActivity;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;->f$0:Landroid/view/View;

    iput-object p2, p0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;->f$1:Lorg/godotengine/godot/GodotActivity;

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 12

    .line 0
    move-object v0, p0

    iget-object v1, v0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;->f$0:Landroid/view/View;

    iget-object v2, v0, Lorg/godotengine/godot/GodotActivity$$ExternalSyntheticLambda3;->f$1:Lorg/godotengine/godot/GodotActivity;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-static/range {v1 .. v11}, Lorg/godotengine/godot/GodotActivity;->$r8$lambda$UbfvOyhZwvQGNHSeX8eqNwFYifA(Landroid/view/View;Lorg/godotengine/godot/GodotActivity;Landroid/view/View;IIIIIIII)V

    return-void
.end method
