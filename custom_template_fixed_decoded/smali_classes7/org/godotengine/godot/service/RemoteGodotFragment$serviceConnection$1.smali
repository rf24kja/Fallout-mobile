.class public final Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;
.super Ljava/lang/Object;
.source "RemoteGodotFragment.kt"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/godotengine/godot/service/RemoteGodotFragment;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001c\u0010\u0002\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0016J\u0012\u0010\u0008\u001a\u00020\u00032\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "org/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1",
        "Landroid/content/ServiceConnection;",
        "onServiceConnected",
        "",
        "name",
        "Landroid/content/ComponentName;",
        "service",
        "Landroid/os/IBinder;",
        "onServiceDisconnected",
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


# instance fields
.field final synthetic this$0:Lorg/godotengine/godot/service/RemoteGodotFragment;


# direct methods
.method constructor <init>(Lorg/godotengine/godot/service/RemoteGodotFragment;)V
    .locals 0
    .param p1, "$receiver"    # Lorg/godotengine/godot/service/RemoteGodotFragment;

    iput-object p1, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;->this$0:Lorg/godotengine/godot/service/RemoteGodotFragment;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .line 89
    sget-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Connected to service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;->this$0:Lorg/godotengine/godot/service/RemoteGodotFragment;

    new-instance v1, Landroid/os/Messenger;

    invoke-direct {v1, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    invoke-static {v0, v1}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$setServiceMessenger$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Landroid/os/Messenger;)V

    .line 93
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;->this$0:Lorg/godotengine/godot/service/RemoteGodotFragment;

    invoke-static {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$initGodotEngine(Lorg/godotengine/godot/service/RemoteGodotFragment;)V

    .line 94
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3
    .param p1, "name"    # Landroid/content/ComponentName;

    .line 97
    sget-object v0, Lorg/godotengine/godot/service/RemoteGodotFragment;->Companion:Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;

    invoke-virtual {v0}, Lorg/godotengine/godot/service/RemoteGodotFragment$Companion;->getTAG$lib_templateDebug()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Disconnected from service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    iget-object v0, p0, Lorg/godotengine/godot/service/RemoteGodotFragment$serviceConnection$1;->this$0:Lorg/godotengine/godot/service/RemoteGodotFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/godotengine/godot/service/RemoteGodotFragment;->access$setServiceMessenger$p(Lorg/godotengine/godot/service/RemoteGodotFragment;Landroid/os/Messenger;)V

    .line 99
    return-void
.end method
