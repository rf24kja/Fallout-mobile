.class public final Lorg/godotengine/godot/utils/PermissionsUtil;
.super Ljava/lang/Object;
.source "PermissionsUtil.java"


# static fields
.field public static final REQUEST_ALL_PERMISSION_REQ_CODE:I = 0x3e9

.field public static final REQUEST_CAMERA_PERMISSION:I = 0x2

.field public static final REQUEST_INSTALL_PACKAGES_REQ_CODE:I = 0xbba

.field public static final REQUEST_MANAGE_EXTERNAL_STORAGE_REQ_CODE:I = 0x7d2

.field public static final REQUEST_RECORD_AUDIO_PERMISSION:I = 0x1

.field public static final REQUEST_SINGLE_PERMISSION_REQ_CODE:I = 0x3ea

.field public static final REQUEST_VIBRATE_PERMISSION:I = 0x3

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    const-class v0, Lorg/godotengine/godot/utils/PermissionsUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    return-void
.end method

.method public static getGrantedPermissions(Landroid/content/Context;)[Ljava/lang/String;
    .locals 9
    .param p0, "context"    # Landroid/content/Context;

    .line 234
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Lorg/godotengine/godot/utils/PermissionsUtil;->getManifestPermissions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 238
    .local v1, "manifestPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 239
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 240
    new-array v0, v0, [Ljava/lang/String;

    return-object v0

    .line 243
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v2, "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 246
    .local v4, "manifestPermission":Ljava/lang/String;
    :try_start_1
    const-string v5, "android.permission.MANAGE_EXTERNAL_STORAGE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 247
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x1e

    if-lt v5, v6, :cond_3

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 248
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 251
    :cond_1
    invoke-static {p0, v4}, Lorg/godotengine/godot/utils/PermissionsUtil;->getPermissionInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PermissionInfo;

    move-result-object v5

    .line 252
    .local v5, "permissionInfo":Landroid/content/pm/PermissionInfo;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1c

    if-lt v6, v7, :cond_2

    invoke-virtual {v5}, Landroid/content/pm/PermissionInfo;->getProtection()I

    move-result v6

    goto :goto_1

    :cond_2
    iget v6, v5, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    .line 253
    .local v6, "protectionLevel":I
    :goto_1
    and-int/lit8 v7, v6, 0x1

    const/4 v8, 0x1

    if-ne v7, v8, :cond_3

    invoke-static {p0, v4}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v7

    if-nez v7, :cond_3

    .line 254
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 260
    .end local v5    # "permissionInfo":Landroid/content/pm/PermissionInfo;
    .end local v6    # "protectionLevel":I
    :cond_3
    :goto_2
    goto :goto_3

    .line 257
    :catch_0
    move-exception v5

    .line 259
    .local v5, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v6, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to identify permission "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 261
    .end local v4    # "manifestPermission":Ljava/lang/String;
    .end local v5    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_3
    goto :goto_0

    .line 263
    :cond_4
    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    .line 235
    .end local v1    # "manifestPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "grantedPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_1
    move-exception v1

    .line 236
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v2, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    const-string v3, "Unable to retrieve manifest permissions"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 237
    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method public static getManifestPermissions(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 292
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 293
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 294
    .local v1, "packageInfo":Landroid/content/pm/PackageInfo;
    iget-object v2, v1, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    if-nez v2, :cond_0

    .line 295
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    return-object v2

    .line 297
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, v1, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v2
.end method

.method private static getPermissionInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PermissionInfo;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .line 308
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 309
    .local v0, "packageManager":Landroid/content/pm/PackageManager;
    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;

    move-result-object v1

    return-object v1
.end method

.method public static hasManifestPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "permission"    # Ljava/lang/String;

    .line 274
    :try_start_0
    invoke-static {p0}, Lorg/godotengine/godot/utils/PermissionsUtil;->getManifestPermissions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 275
    .local v1, "p":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v2, :cond_0

    .line 276
    const/4 v0, 0x1

    return v0

    .line 278
    .end local v1    # "p":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 280
    :cond_1
    goto :goto_1

    .line 279
    :catch_0
    move-exception v0

    .line 282
    :goto_1
    const/4 v0, 0x0

    return v0
.end method

.method public static requestManifestPermissions(Landroid/app/Activity;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;

    .line 191
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestManifestPermissions(Landroid/app/Activity;Ljava/util/Set;)Z

    move-result v0

    return v0
.end method

.method public static requestManifestPermissions(Landroid/app/Activity;Ljava/util/Set;)Z
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 201
    .local p1, "excludes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 202
    return v0

    .line 207
    :cond_0
    :try_start_0
    invoke-static {p0}, Lorg/godotengine/godot/utils/PermissionsUtil;->getManifestPermissions(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 211
    .local v0, "manifestPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    nop

    .line 213
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 214
    const/4 v1, 0x1

    return v1

    .line 217
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 218
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 219
    .local v2, "excludedPermission":Ljava/lang/String;
    invoke-interface {v0, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 220
    .end local v2    # "excludedPermission":Ljava/lang/String;
    goto :goto_0

    .line 223
    :cond_2
    invoke-static {p0, v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestPermissions(Landroid/app/Activity;Ljava/util/List;)Z

    move-result v1

    return v1

    .line 208
    .end local v0    # "manifestPermissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 209
    .local v1, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v2, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    const-string v3, "Unable to retrieve manifest permissions"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 210
    return v0
.end method

.method public static requestPermission(Ljava/lang/String;Landroid/app/Activity;)Z
    .locals 3
    .param p0, "permissionName"    # Ljava/lang/String;
    .param p1, "activity"    # Landroid/app/Activity;

    .line 148
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 149
    return v1

    .line 152
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 155
    .local v0, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_1
    goto :goto_0

    :sswitch_0
    const-string v2, "CAMERA"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :sswitch_1
    const-string v1, "VIBRATE"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_2
    const-string v1, "RECORD_AUDIO"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :goto_0
    const/4 v1, -0x1

    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 177
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    const/16 v1, 0x3ea

    .local v1, "requestCode":I
    goto :goto_2

    .line 172
    .end local v1    # "requestCode":I
    :pswitch_0
    const-string v1, "android.permission.VIBRATE"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    const/4 v1, 0x3

    .line 174
    .restart local v1    # "requestCode":I
    goto :goto_2

    .line 162
    .end local v1    # "requestCode":I
    :pswitch_1
    const-string v1, "android.permission.CAMERA"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    invoke-static {p1}, Lorg/godotengine/godot/Godot;->getInstance(Landroid/content/Context;)Lorg/godotengine/godot/Godot;

    move-result-object v1

    const-string v2, "horizonos"

    invoke-virtual {v1, v2}, Lorg/godotengine/godot/Godot;->hasFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 165
    const-string v1, "horizonos.permission.AVATAR_CAMERA"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    const-string v1, "horizonos.permission.HEADSET_CAMERA"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_2
    const/4 v1, 0x2

    .line 169
    .restart local v1    # "requestCode":I
    goto :goto_2

    .line 157
    .end local v1    # "requestCode":I
    :pswitch_2
    const-string v1, "android.permission.RECORD_AUDIO"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 158
    const/4 v1, 0x1

    .line 159
    .restart local v1    # "requestCode":I
    nop

    .line 182
    :goto_2
    invoke-static {p1, v0, v1}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestPermissions(Landroid/app/Activity;Ljava/util/List;I)Z

    move-result v2

    return v2

    :sswitch_data_0
    .sparse-switch
        0x42022648 -> :sswitch_2
        0x45b2014f -> :sswitch_1
        0x760cb725 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static requestPermissions(Landroid/app/Activity;Ljava/util/List;)Z
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 83
    .local p1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/16 v0, 0x3e9

    invoke-static {p0, p1, v0}, Lorg/godotengine/godot/utils/PermissionsUtil;->requestPermissions(Landroid/app/Activity;Ljava/util/List;I)Z

    move-result v0

    return v0
.end method

.method private static requestPermissions(Landroid/app/Activity;Ljava/util/List;I)Z
    .locals 10
    .param p0, "activity"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)Z"
        }
    .end annotation

    .line 87
    .local p1, "permissions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    if-eqz p1, :cond_7

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_5

    .line 91
    :cond_0
    const/4 v1, 0x0

    .line 92
    .local v1, "dispatchedPermissionsRequest":Z
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 93
    .local v2, "requestedPermissions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 95
    .local v4, "permission":Ljava/lang/String;
    :try_start_0
    const-string v5, "android.permission.MANAGE_EXTERNAL_STORAGE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    const-string v6, "package:%s"

    const-string v7, "Requesting permission "

    if-eqz v5, :cond_1

    .line 96
    :try_start_1
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1e

    if-lt v5, v8, :cond_4

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v5

    if-nez v5, :cond_4

    .line 97
    sget-object v5, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 99
    const/16 v5, 0x7d2

    :try_start_2
    new-instance v7, Landroid/content/Intent;

    const-string v8, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 100
    .local v7, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v8

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-static {v6, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 101
    invoke-virtual {p0, v7, v5}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    .line 105
    .end local v7    # "intent":Landroid/content/Intent;
    goto :goto_1

    .line 102
    :catch_0
    move-exception v6

    .line 103
    .local v6, "ignored":Ljava/lang/Exception;
    :try_start_3
    new-instance v7, Landroid/content/Intent;

    const-string v8, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 104
    .restart local v7    # "intent":Landroid/content/Intent;
    invoke-virtual {p0, v7, v5}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 106
    .end local v6    # "ignored":Ljava/lang/Exception;
    .end local v7    # "intent":Landroid/content/Intent;
    :goto_1
    const/4 v1, 0x1

    goto/16 :goto_3

    .line 108
    :cond_1
    const-string v5, "android.permission.REQUEST_INSTALL_PACKAGES"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 109
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1a

    if-lt v5, v7, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result v5
    :try_end_3
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    if-nez v5, :cond_4

    .line 111
    :try_start_4
    new-instance v5, Landroid/content/Intent;

    const-string v7, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    .local v5, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 113
    const/16 v6, 0xbba

    invoke-virtual {p0, v5, v6}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_4} :catch_2

    .line 114
    const/4 v1, 0x1

    .line 117
    .end local v5    # "intent":Landroid/content/Intent;
    goto :goto_3

    .line 115
    :catch_1
    move-exception v5

    .line 116
    .local v5, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v6, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    const-string v7, "Unable to request permission android.permission.REQUEST_INSTALL_PACKAGES"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    nop

    .end local v5    # "e":Ljava/lang/Exception;
    goto :goto_3

    .line 120
    :cond_2
    invoke-static {p0, v4}, Lorg/godotengine/godot/utils/PermissionsUtil;->getPermissionInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/PermissionInfo;

    move-result-object v5

    .line 121
    .local v5, "permissionInfo":Landroid/content/pm/PermissionInfo;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1c

    if-lt v6, v8, :cond_3

    invoke-virtual {v5}, Landroid/content/pm/PermissionInfo;->getProtection()I

    move-result v6

    goto :goto_2

    :cond_3
    iget v6, v5, Landroid/content/pm/PermissionInfo;->protectionLevel:I

    .line 122
    .local v6, "protectionLevel":I
    :goto_2
    and-int/lit8 v8, v6, 0x1

    if-ne v8, v0, :cond_4

    invoke-static {p0, v4}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_4

    .line 123
    sget-object v8, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v8, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_5 .. :try_end_5} :catch_2

    .line 130
    .end local v5    # "permissionInfo":Landroid/content/pm/PermissionInfo;
    .end local v6    # "protectionLevel":I
    :cond_4
    :goto_3
    goto :goto_4

    .line 127
    :catch_2
    move-exception v5

    .line 129
    .local v5, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    sget-object v6, Lorg/godotengine/godot/utils/PermissionsUtil;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to identify permission "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 131
    .end local v4    # "permission":Ljava/lang/String;
    .end local v5    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_4
    goto/16 :goto_0

    .line 133
    :cond_5
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 134
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {v2, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p0, v0, p2}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V

    .line 135
    const/4 v1, 0x1

    .line 138
    :cond_6
    xor-int/lit8 v0, v1, 0x1

    return v0

    .line 88
    .end local v1    # "dispatchedPermissionsRequest":Z
    .end local v2    # "requestedPermissions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_7
    :goto_5
    return v0
.end method
