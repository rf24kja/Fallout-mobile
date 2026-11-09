.class public final enum Lorg/godotengine/godot/io/StorageScope;
.super Ljava/lang/Enum;
.source "StorageScope.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/StorageScope$Identifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/godotengine/godot/io/StorageScope;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\t\u0008\u0080\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\tB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lorg/godotengine/godot/io/StorageScope;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "ASSETS",
        "APP",
        "SHARED",
        "SAF",
        "UNKNOWN",
        "Identifier",
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

.field private static final synthetic $VALUES:[Lorg/godotengine/godot/io/StorageScope;

.field public static final enum APP:Lorg/godotengine/godot/io/StorageScope;

.field public static final enum ASSETS:Lorg/godotengine/godot/io/StorageScope;

.field public static final enum SAF:Lorg/godotengine/godot/io/StorageScope;

.field public static final enum SHARED:Lorg/godotengine/godot/io/StorageScope;

.field public static final enum UNKNOWN:Lorg/godotengine/godot/io/StorageScope;


# direct methods
.method private static final synthetic $values()[Lorg/godotengine/godot/io/StorageScope;
    .locals 5

    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->ASSETS:Lorg/godotengine/godot/io/StorageScope;

    sget-object v1, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    sget-object v2, Lorg/godotengine/godot/io/StorageScope;->SHARED:Lorg/godotengine/godot/io/StorageScope;

    sget-object v3, Lorg/godotengine/godot/io/StorageScope;->SAF:Lorg/godotengine/godot/io/StorageScope;

    sget-object v4, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    filled-new-array {v0, v1, v2, v3, v4}, [Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 47
    new-instance v0, Lorg/godotengine/godot/io/StorageScope;

    const-string v1, "ASSETS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/io/StorageScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->ASSETS:Lorg/godotengine/godot/io/StorageScope;

    .line 52
    new-instance v0, Lorg/godotengine/godot/io/StorageScope;

    const-string v1, "APP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/io/StorageScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->APP:Lorg/godotengine/godot/io/StorageScope;

    .line 57
    new-instance v0, Lorg/godotengine/godot/io/StorageScope;

    const-string v1, "SHARED"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/io/StorageScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->SHARED:Lorg/godotengine/godot/io/StorageScope;

    .line 62
    new-instance v0, Lorg/godotengine/godot/io/StorageScope;

    const-string v1, "SAF"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/io/StorageScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->SAF:Lorg/godotengine/godot/io/StorageScope;

    .line 67
    new-instance v0, Lorg/godotengine/godot/io/StorageScope;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/godotengine/godot/io/StorageScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->UNKNOWN:Lorg/godotengine/godot/io/StorageScope;

    invoke-static {}, Lorg/godotengine/godot/io/StorageScope;->$values()[Lorg/godotengine/godot/io/StorageScope;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->$VALUES:[Lorg/godotengine/godot/io/StorageScope;

    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->$VALUES:[Lorg/godotengine/godot/io/StorageScope;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/io/StorageScope;->$ENTRIES:Lkotlin/enums/EnumEntries;

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

    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lorg/godotengine/godot/io/StorageScope;",
            ">;"
        }
    .end annotation

    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 172
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/godotengine/godot/io/StorageScope;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    const-class v0, Lorg/godotengine/godot/io/StorageScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 172
    check-cast v0, Lorg/godotengine/godot/io/StorageScope;

    return-object v0
.end method

.method public static values()[Lorg/godotengine/godot/io/StorageScope;
    .locals 1

    sget-object v0, Lorg/godotengine/godot/io/StorageScope;->$VALUES:[Lorg/godotengine/godot/io/StorageScope;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    .line 172
    check-cast v0, [Lorg/godotengine/godot/io/StorageScope;

    return-object v0
.end method
