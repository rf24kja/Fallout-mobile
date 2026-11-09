.class public final enum Lorg/godotengine/godot/service/GodotService$EngineError;
.super Ljava/lang/Enum;
.source "GodotService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/GodotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EngineError"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/godotengine/godot/service/GodotService$EngineError;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService$EngineError;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "ALREADY_BOUND",
        "INIT_FAILED",
        "SCVH_CREATION_FAILED",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lorg/godotengine/godot/service/GodotService$EngineError;

.field public static final enum ALREADY_BOUND:Lorg/godotengine/godot/service/GodotService$EngineError;

.field public static final enum INIT_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

.field public static final enum SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;


# direct methods
.method private static final synthetic $values()[Lorg/godotengine/godot/service/GodotService$EngineError;
    .locals 3

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->ALREADY_BOUND:Lorg/godotengine/godot/service/GodotService$EngineError;

    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineError;->INIT_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    sget-object v2, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    filled-new-array {v0, v1, v2}, [Lorg/godotengine/godot/service/GodotService$EngineError;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 106
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineError;

    const-string v1, "ALREADY_BOUND"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->ALREADY_BOUND:Lorg/godotengine/godot/service/GodotService$EngineError;

    .line 107
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineError;

    const-string v1, "INIT_FAILED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->INIT_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    .line 108
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineError;

    const-string v1, "SCVH_CREATION_FAILED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->SCVH_CREATION_FAILED:Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {}, Lorg/godotengine/godot/service/GodotService$EngineError;->$values()[Lorg/godotengine/godot/service/GodotService$EngineError;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineError;

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineError;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "$enum$name"    # Ljava/lang/String;
    .param p2, "$enum$ordinal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lorg/godotengine/godot/service/GodotService$EngineError;",
            ">;"
        }
    .end annotation

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 109
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/godotengine/godot/service/GodotService$EngineError;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 109
    check-cast v0, Lorg/godotengine/godot/service/GodotService$EngineError;

    return-object v0
.end method

.method public static values()[Lorg/godotengine/godot/service/GodotService$EngineError;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineError;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineError;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 109
    check-cast v0, [Lorg/godotengine/godot/service/GodotService$EngineError;

    return-object v0
.end method
