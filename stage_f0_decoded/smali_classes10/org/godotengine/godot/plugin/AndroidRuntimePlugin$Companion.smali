.class public final Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;
.super Ljava/lang/Object;
.source "AndroidRuntimePlugin.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAndroidRuntimePlugin.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AndroidRuntimePlugin.kt\norg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,170:1\n11228#2:171\n11563#2,3:172\n37#3:175\n36#3,3:176\n*S KotlinDebug\n*F\n+ 1 AndroidRuntimePlugin.kt\norg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion\n*L\n60#1:171\n60#1:172,3\n60#1:175\n60#1:176,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\t\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J%\u0010\u0007\u001a\u0004\u0018\u00010\u00012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00050\t2\u0006\u0010\n\u001a\u00020\u000bH\u0003\u00a2\u0006\u0002\u0010\u000cJ\u001a\u0010\r\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u0010H\u0003J%\u0010\u0011\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0012\u001a\u00020\u00132\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00050\tH\u0003\u00a2\u0006\u0002\u0010\u0014R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;",
        "",
        "<init>",
        "()V",
        "TAG",
        "",
        "kotlin.jvm.PlatformType",
        "generateProxyInstance",
        "interfaces",
        "",
        "invocationHandler",
        "Ljava/lang/reflect/InvocationHandler;",
        "([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;",
        "createProxyFromGodotCallable",
        "interfaceName",
        "godotCallable",
        "Lorg/godotengine/godot/variant/Callable;",
        "createProxyFromGodotObjectID",
        "godotObjectID",
        "",
        "(J[Ljava/lang/String;)Ljava/lang/Object;",
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
.method public static synthetic $r8$lambda$Cthj7dhkTJChPGHeD4sULGeVZyo(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->createProxyFromGodotCallable$lambda$1(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$NwN3Yvl8cH-xBgLJv-AJNRX4Omc([Ljava/lang/String;JLjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    invoke-static/range {p0 .. p5}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->createProxyFromGodotObjectID$lambda$2([Ljava/lang/String;JLjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$createProxyFromGodotCallable(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;
    .param p1, "interfaceName"    # Ljava/lang/String;
    .param p2, "godotCallable"    # Lorg/godotengine/godot/variant/Callable;

    .line 50
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->createProxyFromGodotCallable(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$createProxyFromGodotObjectID(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;J[Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;
    .param p1, "godotObjectID"    # J
    .param p3, "interfaces"    # [Ljava/lang/String;

    .line 50
    invoke-direct {p0, p1, p2, p3}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->createProxyFromGodotObjectID(J[Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$generateProxyInstance(Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;[Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;
    .param p1, "interfaces"    # [Ljava/lang/String;
    .param p2, "invocationHandler"    # Ljava/lang/reflect/InvocationHandler;

    .line 50
    invoke-direct {p0, p1, p2}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->generateProxyInstance([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final createProxyFromGodotCallable(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)Ljava/lang/Object;
    .locals 2
    .param p1, "interfaceName"    # Ljava/lang/String;
    .param p2, "godotCallable"    # Lorg/godotengine/godot/variant/Callable;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 79
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    new-instance v1, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1, p2}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;)V

    invoke-direct {p0, v0, v1}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->generateProxyInstance([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static final createProxyFromGodotCallable$lambda$1(Ljava/lang/String;Lorg/godotengine/godot/variant/Callable;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "$interfaceName"    # Ljava/lang/String;
    .param p1, "$godotCallable"    # Lorg/godotengine/godot/variant/Callable;
    .param p2, "proxy"    # Ljava/lang/Object;
    .param p3, "method"    # Ljava/lang/reflect/Method;
    .param p4, "args"    # [Ljava/lang/Object;

    .line 80
    invoke-virtual {p3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v2, "hashCode"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 85
    :cond_0
    invoke-virtual {p1}, Lorg/godotengine/godot/variant/Callable;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_2

    .line 80
    :sswitch_1
    const-string v2, "equals"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 84
    :cond_1
    aget-object v0, p4, v1

    if-ne p2, v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_2

    .line 80
    :sswitch_2
    const-string v2, "toString"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Godot Callable Proxy for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    .line 89
    :cond_3
    :goto_0
    if-nez p4, :cond_4

    new-array v0, v1, [Ljava/lang/Object;

    goto :goto_1

    :cond_4
    move-object v0, p4

    :goto_1
    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/godotengine/godot/variant/Callable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 90
    :goto_2
    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x69e9ad94 -> :sswitch_2
        -0x4d378041 -> :sswitch_1
        0x8cdac1b -> :sswitch_0
    .end sparse-switch
.end method

.method private final createProxyFromGodotObjectID(J[Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "godotObjectID"    # J
    .param p3, "interfaces"    # [Ljava/lang/String;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 104
    new-instance v0, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;

    invoke-direct {v0, p3, p1, p2}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion$$ExternalSyntheticLambda1;-><init>([Ljava/lang/String;J)V

    invoke-direct {p0, p3, v0}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin$Companion;->generateProxyInstance([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static final createProxyFromGodotObjectID$lambda$2([Ljava/lang/String;JLjava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
    .param p0, "$interfaces"    # [Ljava/lang/String;
    .param p1, "$godotObjectID"    # J
    .param p3, "proxy"    # Ljava/lang/Object;
    .param p4, "method"    # Ljava/lang/reflect/Method;
    .param p5, "args"    # [Ljava/lang/Object;

    .line 105
    invoke-virtual/range {p4 .. p4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    .local v0, "methodName":Ljava/lang/String;
    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v2, "hashCode"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    .line 110
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->hashCode(J)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    move-wide v4, p1

    move-object/from16 v3, p3

    goto :goto_4

    .line 105
    :sswitch_1
    const-string v2, "equals"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    :goto_0
    move-object/from16 v3, p3

    goto :goto_2

    .line 109
    :cond_1
    aget-object v2, p5, v1

    move-object/from16 v3, p3

    if-ne v3, v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    move-wide v4, p1

    goto :goto_4

    .line 105
    :sswitch_2
    move-object/from16 v3, p3

    const-string v2, "toString"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 108
    const-string v1, ","

    move-object v5, v1

    check-cast v5, Ljava/lang/CharSequence;

    const/16 v11, 0x3e

    const/4 v12, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    invoke-static/range {v4 .. v12}, Lkotlin/collections/ArraysKt;->joinToString$default([Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Godot Object Proxy for "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-wide v4, p1

    goto :goto_4

    .line 105
    :cond_3
    :goto_1
    move-object/from16 v3, p3

    .line 114
    :cond_4
    :goto_2
    sget-object v2, Lorg/godotengine/godot/variant/Callable;->Companion:Lorg/godotengine/godot/variant/Callable$Companion;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    if-nez p5, :cond_5

    new-array v1, v1, [Ljava/lang/Object;

    goto :goto_3

    :cond_5
    move-object/from16 v1, p5

    :goto_3
    array-length v4, v1

    invoke-static {v1, v4}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    move-wide v4, p1

    invoke-virtual {v2, p1, p2, v0, v1}, Lorg/godotengine/godot/variant/Callable$Companion;->call(JLjava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 115
    .end local v0    # "methodName":Ljava/lang/String;
    :goto_4
    return-object v1

    :sswitch_data_0
    .sparse-switch
        -0x69e9ad94 -> :sswitch_2
        -0x4d378041 -> :sswitch_1
        0x8cdac1b -> :sswitch_0
    .end sparse-switch
.end method

.method private final generateProxyInstance([Ljava/lang/String;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;
    .locals 12
    .param p1, "interfaces"    # [Ljava/lang/String;
    .param p2, "invocationHandler"    # Ljava/lang/reflect/InvocationHandler;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 59
    nop

    .line 60
    move-object v0, p1

    .local v0, "$this$map$iv":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 171
    .local v1, "$i$f$map":I
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, v0

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$mapTo$iv$iv":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 172
    .local v4, "$i$f$mapTo":I
    array-length v5, v3

    const/4 v6, 0x0

    move v7, v6

    :goto_0
    if-ge v7, v5, :cond_0

    aget-object v8, v3, v7

    .line 173
    .local v8, "item$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    .local v9, "it":Ljava/lang/String;
    const/4 v10, 0x0

    .line 60
    .local v10, "$i$a$-map-AndroidRuntimePlugin$Companion$generateProxyInstance$interfaceClasses$1":I
    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v11

    .line 173
    .end local v9    # "it":Ljava/lang/String;
    .end local v10    # "$i$a$-map-AndroidRuntimePlugin$Companion$generateProxyInstance$interfaceClasses$1":I
    invoke-interface {v2, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 172
    nop

    .end local v8    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 174
    :cond_0
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$mapTo$iv$iv":[Ljava/lang/Object;
    .end local v4    # "$i$f$mapTo":I
    check-cast v2, Ljava/util/List;

    .line 171
    nop

    .end local v0    # "$this$map$iv":[Ljava/lang/Object;
    .end local v1    # "$i$f$map":I
    check-cast v2, Ljava/util/Collection;

    .line 60
    move-object v0, v2

    .local v0, "$this$toTypedArray$iv":Ljava/util/Collection;
    const/4 v1, 0x0

    .line 175
    .local v1, "$i$f$toTypedArray":I
    nop

    .line 176
    nop

    .line 178
    .local v2, "thisCollection$iv":Ljava/util/Collection;
    new-array v3, v6, [Ljava/lang/Class;

    invoke-interface {v2, v3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    .line 60
    .end local v0    # "$this$toTypedArray$iv":Ljava/util/Collection;
    .end local v1    # "$i$f$toTypedArray":I
    .end local v2    # "thisCollection$iv":Ljava/util/Collection;
    check-cast v3, [Ljava/lang/Class;

    move-object v0, v3

    .line 62
    .local v0, "interfaceClasses":[Ljava/lang/Class;
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v1, v0, p2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .local v1, "proxy":Ljava/lang/Object;
    return-object v1

    .line 64
    .end local v0    # "interfaceClasses":[Ljava/lang/Class;
    .end local v1    # "proxy":Ljava/lang/Object;
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {}, Lorg/godotengine/godot/plugin/AndroidRuntimePlugin;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v1

    const-string v2, ","

    move-object v4, v2

    check-cast v4, Ljava/lang/CharSequence;

    const/16 v10, 0x3e

    const/4 v11, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, p1

    invoke-static/range {v3 .. v11}, Lkotlin/collections/ArraysKt;->joinToString$default([Ljava/lang/Object;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error generating Godot proxy for interfaces "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, v0

    check-cast v3, Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 67
    .end local v0    # "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    return-object v0
.end method
