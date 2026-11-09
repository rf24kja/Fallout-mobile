.class public final Lorg/godotengine/godot/Godot$Companion;
.super Ljava/lang/Object;
.source "Godot.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/Godot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nGodot.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Godot.kt\norg/godotengine/godot/Godot$Companion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,1067:1\n1#2:1068\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000bH\u0007J\r\u0010\u0010\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008\u0012J\r\u0010\u0013\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008\u0014R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lorg/godotengine/godot/Godot$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "INSTANCE",
        "Lorg/godotengine/godot/Godot;",
        "getInstance",
        "context",
        "Landroid/content/Context;",
        "EXIT_RENDERER_TIMEOUT_IN_MS",
        "",
        "EDITOR_FLAVOR",
        "TEMPLATE_FLAVOR",
        "isEditorBuild",
        "",
        "isEditorBuild$lib_templateDebug",
        "isTemplateBuild",
        "isTemplateBuild$lib_templateDebug",
        "lib_templateDebug"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/Godot$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 97
    invoke-static {}, Lorg/godotengine/godot/Godot;->access$getINSTANCE$cp()Lorg/godotengine/godot/Godot;

    move-result-object v0

    if-nez v0, :cond_1

    monitor-enter p0

    const/4 v0, 0x0

    .line 98
    .local v0, "$i$a$-synchronized-Godot$Companion$getInstance$1":I
    :try_start_0
    invoke-static {}, Lorg/godotengine/godot/Godot;->access$getINSTANCE$cp()Lorg/godotengine/godot/Godot;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lorg/godotengine/godot/Godot;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "getApplicationContext(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lorg/godotengine/godot/Godot;-><init>(Landroid/content/Context;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v2, v1

    .line 1068
    .local v2, "it":Lorg/godotengine/godot/Godot;
    const/4 v3, 0x0

    .line 98
    .local v3, "$i$a$-also-Godot$Companion$getInstance$1$1":I
    sget-object v4, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-static {v2}, Lorg/godotengine/godot/Godot;->access$setINSTANCE$cp(Lorg/godotengine/godot/Godot;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .end local v0    # "$i$a$-synchronized-Godot$Companion$getInstance$1":I
    .end local v2    # "it":Lorg/godotengine/godot/Godot;
    .end local v3    # "$i$a$-also-Godot$Companion$getInstance$1$1":I
    :cond_0
    monitor-exit p0

    move-object v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_1
    :goto_0
    return-object v0
.end method

.method public final isEditorBuild$lib_templateDebug()Z
    .locals 1

    .line 111
    const/4 v0, 0x0

    return v0
.end method

.method public final isTemplateBuild$lib_templateDebug()Z
    .locals 1

    .line 116
    const/4 v0, 0x1

    return v0
.end method
