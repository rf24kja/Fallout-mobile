.class public final Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;
.super Ljava/lang/Object;
.source "DirectoryAccessHandler.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion$WhenMappings;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0006\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u0008\u0012\u0004\u0012\u00020\u00050\u00072\u0006\u0010\t\u001a\u00020\u0005J\u0012\u0010\n\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u000b\u001a\u00020\u0005H\u0002J\u001c\u0010\n\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u000b\u001a\u00020\u00052\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\rR\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000e"
    }
    d2 = {
        "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;",
        "",
        "<init>",
        "()V",
        "DIR_ACCESS_ID_MULTIPLIER",
        "",
        "fromDirAccessId",
        "Lkotlin/Pair;",
        "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;",
        "dirAccessId",
        "fromNative",
        "nativeAccessType",
        "storageScope",
        "Lorg/godotengine/godot/io/StorageScope;",
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

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;-><init>()V

    return-void
.end method

.method private final fromNative(I)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .locals 3
    .param p1, "nativeAccessType"    # I

    .line 74
    invoke-static {}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->getEntries()Lkotlin/enums/EnumEntries;

    move-result-object v0

    invoke-interface {v0}, Lkotlin/enums/EnumEntries;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .line 75
    .local v1, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    invoke-virtual {v1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->getNativeValue()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 76
    return-object v1

    .line 79
    .end local v1    # "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public static synthetic fromNative$default(Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;ILorg/godotengine/godot/io/StorageScope;ILjava/lang/Object;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .locals 0

    .line 82
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final fromDirAccessId(I)Lkotlin/Pair;
    .locals 5
    .param p1, "dirAccessId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lkotlin/Pair<",
            "Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 68
    rem-int/lit8 v0, p1, 0xa

    .line 69
    .local v0, "nativeValue":I
    div-int/lit8 v1, p1, 0xa

    .line 70
    .local v1, "dirId":I
    new-instance v2, Lkotlin/Pair;

    invoke-direct {p0, v0}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(I)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method public final fromNative(ILorg/godotengine/godot/io/StorageScope;)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    .locals 5
    .param p1, "nativeAccessType"    # I
    .param p2, "storageScope"    # Lorg/godotengine/godot/io/StorageScope;

    .line 83
    invoke-direct {p0, p1}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion;->fromNative(I)Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    move-result-object v0

    .line 84
    .local v0, "accessType":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 85
    invoke-static {}, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler;->access$getTAG$cp()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupported access type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-object v1

    .line 94
    :cond_0
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_RESOURCES:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    if-ne v0, v2, :cond_2

    .line 95
    sget-object v1, Lorg/godotengine/godot/Godot;->Companion:Lorg/godotengine/godot/Godot$Companion;

    invoke-virtual {v1}, Lorg/godotengine/godot/Godot$Companion;->isEditorBuild$lib_templateDebug()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 96
    sget-object v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_FILESYSTEM:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    goto :goto_0

    .line 98
    :cond_1
    sget-object v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_RESOURCES:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .line 95
    :goto_0
    return-object v1

    .line 108
    :cond_2
    if-eqz p2, :cond_3

    .line 109
    sget-object v2, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType$Companion$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {p2}, Lorg/godotengine/godot/io/StorageScope;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    new-instance v1, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v1}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v1

    .line 112
    :pswitch_0
    goto :goto_1

    .line 111
    :pswitch_1
    sget-object v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_FILESYSTEM:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    goto :goto_1

    .line 110
    :pswitch_2
    sget-object v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_RESOURCES:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    .line 109
    :goto_1
    nop

    .line 115
    .local v1, "accessTypeFromStorageScope":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    if-eqz v1, :cond_3

    .line 116
    return-object v1

    .line 123
    .end local v1    # "accessTypeFromStorageScope":Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;
    :cond_3
    sget-object v1, Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;->ACCESS_FILESYSTEM:Lorg/godotengine/godot/io/directory/DirectoryAccessHandler$AccessType;

    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
