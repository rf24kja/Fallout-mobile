.class public final Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;
.super Lorg/godotengine/godot/plugin/GodotPlugin;
.source "AndroidRuntimePlugin.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAndroidRuntimePlugin.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AndroidRuntimePlugin.kt\norg/godotengine/godot/plugin/AndroidRuntimePlugin\n+ 2 Uri.kt\nandroidx/core/net/UriKt\n*L\n1#1,170:1\n29#2:171\n*S KotlinDebug\n*F\n+ 1 AndroidRuntimePlugin.kt\norg/godotengine/godot/plugin/AndroidRuntimePlugin\n*L\n156#1:171\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\n\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007J\n\u0010\n\u001a\u0004\u0018\u00010\u000bH\u0017J\u0010\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0007J\u0016\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u00112\u0006\u0010\u000e\u001a\u00020\u000fH\u0007J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00072\u0006\u0010\u0016\u001a\u00020\u0014H\u0007\u00a8\u0006\u0018"
    }
    d2 = {
        "Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;",
        "Lorg/godotengine/godot/plugin/GodotPlugin;",
        "godot",
        "Lorg/godotengine/godot/Godot;",
        "<init>",
        "(Lorg/godotengine/godot/Godot;)V",
        "getPluginName",
        "",
        "getApplicationContext",
        "Landroid/content/Context;",
        "getActivity",
        "Landroid/app/Activity;",
        "createRunnableFromGodotCallable",
        "Ljava/lang/Runnable;",
        "godotCallable",
        "Lorg/godotengine/godot/variant/Callable;",
        "createCallableFromGodotCallable",
        "Ljava/util/concurrent/Callable;",
        "",
        "updatePersistableUriPermission",
        "",
        "uriString",
        "persist",
        "Companion",
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


# static fields
.field public static final Companion:Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method public static synthetic $r8$lambda$WwndH0C9ZBYTJei7LC135pxedCk(Lorg/godotengine/godot/variant/Callable;)V
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->createRunnableFromGodotCallable$lambda$0(Lorg/godotengine/godot/variant/Callable;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ibJDzJs-sb-bMY6Uzsm2zocrBhQ(Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->createCallableFromGodotCallable$lambda$1(Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->Companion:Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

    .line 51
    const-class v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/Godot;)V
    .locals 1
    .param p1, "godot"    # Lorg/godotengine/godot/Godot;

    const-string v0, "godot"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 48
    invoke-direct {p0, p1}, Lorg/godotengine/godot/plugin/GodotPlugin;-><init>(Lorg/godotengine/godot/Godot;)V

    return-void
.end method

.method public static final synthetic access$getTAG$cp()Ljava/lang/String;
    .locals 1

    .line 48
    sget-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private static final createCallableFromGodotCallable$lambda$1(Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;
    .locals 1
    .param p0, "$godotCallable"    # Lorg/godotengine/godot/variant/Callable;

    .line 147
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/variant/Callable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static final createProxyFromGodotCallable(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;
    .locals 1
    .param p0, "interfaceName"    # Ljava/lang/String;
    .param p1, "godotCallable"    # Lorg/godotengine/godot/variant/Callable;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->Companion:Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

    invoke-static {v0, p0, p1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->access$createProxyFromGodotCallable(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;

    move-result-object v0

    .line 92
    return-object v0
.end method

.method private static final createProxyFromGodotObjectID(J[Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "godotObjectID"    # J
    .param p2, "interfaces"    # [Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->Companion:Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

    invoke-static {v0, p0, p1, p2}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->access$createProxyFromGodotObjectID(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;J[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 117
    return-object v0
.end method

.method private static final createRunnableFromGodotCallable$lambda$0(Lorg/godotengine/godot/variant/Callable;)V
    .locals 1
    .param p0, "$godotCallable"    # Lorg/godotengine/godot/variant/Callable;

    .line 139
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/godotengine/godot/variant/Callable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static final generateProxyInstance([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;
    .locals 1
    .param p0, "interfaces"    # [Ljava/lang/String;
    .param p1, "invocationHandler"    # Ljava/lang/reflect/InvocationHandler;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->Companion:Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;

    invoke-static {v0, p0, p1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->access$generateProxyInstance(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;[Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    .line 68
    return-object v0
.end method


# virtual methods
.method public final createCallableFromGodotCallable(Lorg/godotengine/godot/variant/Callable;)Ljava/util/concurrent/Callable;
    .locals 1
    .param p1, "godotCallable"    # Lorg/godotengine/godot/variant/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/godotengine/godot/variant/Callable;",
            ")",
            "Ljava/util/concurrent/Callable<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Lorg/godotengine/godot/plugin/UsedByGodot;
    .end annotation

    const-string v0, "godotCallable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 147
    new-instance v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$$ExternalSyntheticLambda0;-><init>(Lorg/godotengine/godot/variant/Callable;)V

    return-object v0
.end method

.method public final createRunnableFromGodotCallable(Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Runnable;
    .locals 1
    .param p1, "godotCallable"    # Lorg/godotengine/godot/variant/Callable;
    .annotation runtime Lorg/godotengine/godot/plugin/UsedByGodot;
    .end annotation

    const-string v0, "godotCallable"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 139
    new-instance v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$$ExternalSyntheticLambda1;

    invoke-direct {v0, p1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$$ExternalSyntheticLambda1;-><init>(Lorg/godotengine/godot/variant/Callable;)V

    return-object v0
.end method

.method public getActivity()Landroid/app/Activity;
    .locals 1
    .annotation runtime Lorg/godotengine/godot/plugin/UsedByGodot;
    .end annotation

    .line 132
    invoke-super {p0}, Lorg/godotengine/godot/plugin/GodotPlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method public final getApplicationContext()Landroid/content/Context;
    .locals 1
    .annotation runtime Lorg/godotengine/godot/plugin/UsedByGodot;
    .end annotation

    .line 126
    invoke-virtual {p0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getPluginName()Ljava/lang/String;
    .locals 1

    .line 120
    const-string v0, "AndroidRuntime"

    return-object v0
.end method

.method public final updatePersistableUriPermission(Ljava/lang/String;Z)Z
    .locals 4
    .param p1, "uriString"    # Ljava/lang/String;
    .param p2, "persist"    # Z
    .annotation runtime Lorg/godotengine/godot/plugin/UsedByGodot;
    .end annotation

    const-string v0, "uriString"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    nop

    .line 156
    move-object v0, p1

    .local v0, "$this$toUri$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 171
    .local v1, "$i$f$toUri":I
    :try_start_0
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "Uri.parse(this)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkExpressionValueIsNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 156
    .end local v0    # "$this$toUri$iv":Ljava/lang/String;
    .end local v1    # "$i$f$toUri":I
    move-object v0, v2

    .line 157
    .local v0, "uri":Landroid/net/Uri;
    invoke-virtual {p0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 158
    .local v1, "contentResolver":Landroid/content/ContentResolver;
    const/4 v2, 0x3

    if-eqz p2, :cond_0

    .line 159
    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {v1, v0, v2}, Landroid/content/ContentResolver;->releasePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 167
    .end local v0    # "uri":Landroid/net/Uri;
    .end local v1    # "contentResolver":Landroid/content/ContentResolver;
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v1, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->TAG:Ljava/lang/String;

    const-string v2, "Error updating persistable permission: "

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 165
    const/4 v1, 0x0

    return v1
.end method
