.class public final enum Lorg/godotengine/godot/service/GodotService$EngineStatus;
.super Ljava/lang/Enum;
.source "GodotService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/service/GodotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EngineStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/godotengine/godot/service/GodotService$EngineStatus;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0008\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lorg/godotengine/godot/service/GodotService$EngineStatus;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "INITIALIZED",
        "SCVH_CREATED",
        "STARTED",
        "STOPPED",
        "DESTROYED",
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

.field private static final synthetic $VALUES:[Lorg/godotengine/godot/service/GodotService$EngineStatus;

.field public static final enum DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

.field public static final enum INITIALIZED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

.field public static final enum SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

.field public static final enum STARTED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

.field public static final enum STOPPED:Lorg/godotengine/godot/service/GodotService$EngineStatus;


# direct methods
.method private static final synthetic $values()[Lorg/godotengine/godot/service/GodotService$EngineStatus;
    .locals 5

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->INITIALIZED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    sget-object v1, Lorg/godotengine/godot/service/GodotService$EngineStatus;->SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    sget-object v2, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STARTED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    sget-object v3, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STOPPED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    sget-object v4, Lorg/godotengine/godot/service/GodotService$EngineStatus;->DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    filled-new-array {v0, v1, v2, v3, v4}, [Lorg/godotengine/godot/service/GodotService$EngineStatus;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 98
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const-string v1, "INITIALIZED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->INITIALIZED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 99
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const-string v1, "SCVH_CREATED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->SCVH_CREATED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 100
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const-string v1, "STARTED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STARTED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 101
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const-string v1, "STOPPED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->STOPPED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    .line 102
    new-instance v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    const-string v1, "DESTROYED"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/service/GodotService$EngineStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->DESTROYED:Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-static {}, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$values()[Lorg/godotengine/godot/service/GodotService$EngineStatus;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineStatus;

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineStatus;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

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

    .line 97
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lorg/godotengine/godot/service/GodotService$EngineStatus;",
            ">;"
        }
    .end annotation

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 103
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/godotengine/godot/service/GodotService$EngineStatus;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 103
    check-cast v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;

    return-object v0
.end method

.method public static values()[Lorg/godotengine/godot/service/GodotService$EngineStatus;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/service/GodotService$EngineStatus;->$VALUES:[Lorg/godotengine/godot/service/GodotService$EngineStatus;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 103
    check-cast v0, [Lorg/godotengine/godot/service/GodotService$EngineStatus;

    return-object v0
.end method
