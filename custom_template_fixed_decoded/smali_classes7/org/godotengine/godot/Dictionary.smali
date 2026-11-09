.class public final Lorg/godotengine/godot/Dictionary;
.super Ljava/util/HashMap;
.source "Dictionary.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private keys_cache:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public get_keys()[Ljava/lang/String;
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 45
    invoke-virtual {p0}, Lorg/godotengine/godot/Dictionary;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 46
    .local v0, "ret":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 47
    .local v1, "i":I
    invoke-virtual {p0}, Lorg/godotengine/godot/Dictionary;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 48
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 49
    .local v4, "key":Ljava/lang/String;
    aput-object v4, v0, v1

    .line 50
    nop

    .end local v4    # "key":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 51
    goto :goto_0

    .line 53
    :cond_0
    return-object v0
.end method

.method public get_values()[Ljava/lang/Object;
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 61
    invoke-virtual {p0}, Lorg/godotengine/godot/Dictionary;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Object;

    .line 62
    .local v0, "ret":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 63
    .local v1, "i":I
    invoke-virtual {p0}, Lorg/godotengine/godot/Dictionary;->keySet()Ljava/util/Set;

    move-result-object v2

    .line 64
    .local v2, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 65
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/godotengine/godot/Dictionary;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v0, v1

    .line 66
    nop

    .end local v4    # "key":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 67
    goto :goto_0

    .line 69
    :cond_0
    return-object v0
.end method

.method public set_keys([Ljava/lang/String;)V
    .locals 0
    .param p1, "keys"    # [Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 77
    iput-object p1, p0, Lorg/godotengine/godot/Dictionary;->keys_cache:[Ljava/lang/String;

    .line 78
    return-void
.end method

.method public set_values([Ljava/lang/Object;)V
    .locals 6
    .param p1, "vals"    # [Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "i":I
    iget-object v1, p0, Lorg/godotengine/godot/Dictionary;->keys_cache:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 87
    .local v4, "key":Ljava/lang/String;
    aget-object v5, p1, v0

    invoke-virtual {p0, v4, v5}, Lorg/godotengine/godot/Dictionary;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    nop

    .end local v4    # "key":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    .line 86
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 90
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/godotengine/godot/Dictionary;->keys_cache:[Ljava/lang/String;

    .line 91
    return-void
.end method
