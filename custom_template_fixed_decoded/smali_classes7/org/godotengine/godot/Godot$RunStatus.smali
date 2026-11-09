.class public final enum Lorg/godotengine/godot/Godot$RunStatus;
.super Ljava/lang/Enum;
.source "Godot.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/Godot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RunStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/godotengine/godot/Godot$RunStatus;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lorg/godotengine/godot/Godot$RunStatus;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "INITIALIZING",
        "STARTED",
        "TERMINATING",
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

.field private static final synthetic $VALUES:[Lorg/godotengine/godot/Godot$RunStatus;

.field public static final enum INITIALIZING:Lorg/godotengine/godot/Godot$RunStatus;

.field public static final enum STARTED:Lorg/godotengine/godot/Godot$RunStatus;

.field public static final enum TERMINATING:Lorg/godotengine/godot/Godot$RunStatus;


# direct methods
.method private static final synthetic $values()[Lorg/godotengine/godot/Godot$RunStatus;
    .locals 3

    sget-object v0, Lorg/godotengine/godot/Godot$RunStatus;->INITIALIZING:Lorg/godotengine/godot/Godot$RunStatus;

    sget-object v1, Lorg/godotengine/godot/Godot$RunStatus;->STARTED:Lorg/godotengine/godot/Godot$RunStatus;

    sget-object v2, Lorg/godotengine/godot/Godot$RunStatus;->TERMINATING:Lorg/godotengine/godot/Godot$RunStatus;

    filled-new-array {v0, v1, v2}, [Lorg/godotengine/godot/Godot$RunStatus;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 123
    new-instance v0, Lorg/godotengine/godot/Godot$RunStatus;

    const-string v1, "INITIALIZING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/Godot$RunStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/Godot$RunStatus;->INITIALIZING:Lorg/godotengine/godot/Godot$RunStatus;

    .line 124
    new-instance v0, Lorg/godotengine/godot/Godot$RunStatus;

    const-string v1, "STARTED"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/Godot$RunStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/Godot$RunStatus;->STARTED:Lorg/godotengine/godot/Godot$RunStatus;

    .line 125
    new-instance v0, Lorg/godotengine/godot/Godot$RunStatus;

    const-string v1, "TERMINATING"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/Godot$RunStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/Godot$RunStatus;->TERMINATING:Lorg/godotengine/godot/Godot$RunStatus;

    invoke-static {}, Lorg/godotengine/godot/Godot$RunStatus;->$values()[Lorg/godotengine/godot/Godot$RunStatus;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/Godot$RunStatus;->$VALUES:[Lorg/godotengine/godot/Godot$RunStatus;

    sget-object v0, Lorg/godotengine/godot/Godot$RunStatus;->$VALUES:[Lorg/godotengine/godot/Godot$RunStatus;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/Godot$RunStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

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

    .line 122
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lorg/godotengine/godot/Godot$RunStatus;",
            ">;"
        }
    .end annotation

    sget-object v0, Lorg/godotengine/godot/Godot$RunStatus;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 126
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/godotengine/godot/Godot$RunStatus;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lorg/godotengine/godot/Godot$RunStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 126
    check-cast v0, Lorg/godotengine/godot/Godot$RunStatus;

    return-object v0
.end method

.method public static values()[Lorg/godotengine/godot/Godot$RunStatus;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/Godot$RunStatus;->$VALUES:[Lorg/godotengine/godot/Godot$RunStatus;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 126
    check-cast v0, [Lorg/godotengine/godot/Godot$RunStatus;

    return-object v0
.end method
