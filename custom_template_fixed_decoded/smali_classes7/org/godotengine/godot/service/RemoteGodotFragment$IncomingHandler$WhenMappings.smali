.class public final synthetic Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;
.super Ljava/lang/Object;
.source "RemoteGodotFragment.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1001
    name = "WhenMappings"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic $EnumSwitchMapping$0:[I

.field public static final synthetic $EnumSwitchMapping$1:[I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    invoke-static {}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->values()[Lorg/godotengine/godot/service/GodotService$EngineStatus;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lorg/godotengine/godot/service/GodotService$EngineStatus;->INITIALIZED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    :goto_0
    const/4 v2, 0x2

    :try_start_1
    sget-object v3, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STARTED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v3}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v3

    aput v2, v0, v3
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v3

    :goto_1
    const/4 v3, 0x3

    :try_start_2
    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STOPPED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v4}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v4

    aput v3, v0, v4
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception v4

    :goto_2
    :try_start_3
    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineStatus;->DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v4}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v4

    const/4 v5, 0x4

    aput v5, v0, v4
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    goto :goto_3

    :catch_3
    move-exception v4

    :goto_3
    :try_start_4
    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineStatus;->SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v4}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->ordinal()I

    move-result v4

    const/4 v5, 0x5

    aput v5, v0, v4
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_4

    :catch_4
    move-exception v4

    :goto_4
    sput-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-static {}, Lorg/godotengine/godot/service/GodotService$EngineError;->values()[Lorg/godotengine/godot/service/GodotService$EngineError;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_5
    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineError;->ALREADY_BOUND:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-virtual {v4}, Lorg/godotengine/godot/service/GodotService$EngineError;->ordinal()I

    move-result v4

    aput v1, v0, v4
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    goto :goto_5

    :catch_5
    move-exception v1

    :goto_5
    :try_start_6
    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineError;->INIT_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-virtual {v1}, Lorg/godotengine/godot/service/GodotService$EngineError;->ordinal()I

    move-result v1

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_6

    :catch_6
    move-exception v1

    :goto_6
    :try_start_7
    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-virtual {v1}, Lorg/godotengine/godot/service/GodotService$EngineError;->ordinal()I

    move-result v1

    aput v3, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    goto :goto_7

    :catch_7
    move-exception v1

    :goto_7
    sput-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment$IncomingHandler$WhenMappings;->$EnumSwitchMapping$1:[I

    return-void
.end method
