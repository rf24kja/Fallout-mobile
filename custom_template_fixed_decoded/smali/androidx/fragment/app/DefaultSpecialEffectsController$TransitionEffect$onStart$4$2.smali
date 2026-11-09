.class final Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;
.super Lkotlin/jvm/internal/Lambda;
.source "DefaultSpecialEffectsController.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4;->invoke()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDefaultSpecialEffectsController.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DefaultSpecialEffectsController.kt\nandroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,1151:1\n1726#2,3:1152\n1855#2,2:1155\n1855#2,2:1157\n*S KotlinDebug\n*F\n+ 1 DefaultSpecialEffectsController.kt\nandroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2\n*L\n795#1:1152,3\n800#1:1155,2\n825#1:1157,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $container:Landroid/view/ViewGroup;

.field final synthetic $mergedTransition:Ljava/lang/Object;

.field final synthetic this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;


# direct methods
.method public static synthetic $r8$lambda$A1DVanST4FhSFdeNdLu3_mrvHzE(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;Landroid/view/ViewGroup;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->invoke$lambda$2(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic $r8$lambda$V_4AUGyDqWV3M_f_h-7hDilEf0U(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;)V
    .locals 0

    invoke-static {p0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->invoke$lambda$4(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;)V

    return-void
.end method

.method constructor <init>(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;Ljava/lang/Object;Landroid/view/ViewGroup;)V
    .locals 1

    iput-object p1, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    iput-object p2, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->$mergedTransition:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->$container:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method private static final invoke$lambda$2(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;Landroid/view/ViewGroup;)V
    .locals 9
    .param p0, "this$0"    # Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;
    .param p1, "$container"    # Landroid/view/ViewGroup;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$container"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 800
    invoke-virtual {p0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionInfos()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 1155
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .local v4, "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    const/4 v5, 0x0

    .line 801
    .local v5, "$i$a$-forEach-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$2$1":I
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v6

    .line 802
    .local v6, "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    invoke-virtual {v6}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v7

    invoke-virtual {v7}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v7

    .line 803
    .local v7, "view":Landroid/view/View;
    if-eqz v7, :cond_0

    .line 804
    invoke-virtual {v6}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFinalState()Landroidx/fragment/app/SpecialEffectsController$Operation$State;

    move-result-object v8

    invoke-virtual {v8, v7, p1}, Landroidx/fragment/app/SpecialEffectsController$Operation$State;->applyState(Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 806
    :cond_0
    nop

    .line 1155
    .end local v4    # "transitionInfo":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v5    # "$i$a$-forEach-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$2$1":I
    .end local v6    # "operation":Landroidx/fragment/app/SpecialEffectsController$Operation;
    .end local v7    # "view":Landroid/view/View;
    nop

    .end local v3    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 1156
    :cond_1
    nop

    .line 807
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    return-void
.end method

.method private static final invoke$lambda$4(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;)V
    .locals 8
    .param p0, "this$0"    # Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 819
    const/4 v0, 0x2

    invoke-static {v0}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 821
    nop

    .line 822
    nop

    .line 820
    const-string v0, "FragmentManager"

    const-string v1, "Transition for all operations has completed"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 825
    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionInfos()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 1157
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .local v3, "element$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .local v4, "it":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    const/4 v5, 0x0

    .line 825
    .local v5, "$i$a$-forEach-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$3$1":I
    invoke-virtual {v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v6

    move-object v7, p0

    check-cast v7, Landroidx/fragment/app/SpecialEffectsController$Effect;

    invoke-virtual {v6, v7}, Landroidx/fragment/app/SpecialEffectsController$Operation;->completeEffect(Landroidx/fragment/app/SpecialEffectsController$Effect;)V

    .line 1157
    .end local v4    # "it":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v5    # "$i$a$-forEach-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$3$1":I
    nop

    .end local v3    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 1158
    :cond_1
    nop

    .line 826
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 794
    invoke-virtual {p0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 9

    .line 795
    iget-object v0, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionInfos()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$all$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 1152
    .local v1, "$i$f$all":I
    instance-of v2, v0, Ljava/util/Collection;

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_0

    move-object v2, v0

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 1153
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    .local v6, "it":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    const/4 v7, 0x0

    .line 795
    .local v7, "$i$a$-all-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$1":I
    invoke-virtual {v6}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v8

    invoke-virtual {v8}, Landroidx/fragment/app/SpecialEffectsController$Operation;->isSeeking()Z

    move-result v6

    .line 1153
    .end local v6    # "it":Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;
    .end local v7    # "$i$a$-all-DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$1":I
    if-nez v6, :cond_1

    move v4, v3

    goto :goto_0

    .line 1154
    .end local v5    # "element$iv":Ljava/lang/Object;
    :cond_2
    nop

    .line 795
    .end local v0    # "$this$all$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$all":I
    :goto_0
    const-string v0, "FragmentManager"

    const/4 v1, 0x2

    if-eqz v4, :cond_4

    .line 796
    invoke-static {v1}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 797
    const-string v1, "Animating to start"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 799
    :cond_3
    iget-object v0, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    invoke-virtual {v0}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionImpl()Landroidx/fragment/app/FragmentTransitionImpl;

    move-result-object v0

    iget-object v1, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getController()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v2, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    iget-object v3, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->$container:Landroid/view/ViewGroup;

    new-instance v4, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$$ExternalSyntheticLambda0;

    invoke-direct {v4, v2, v3}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$$ExternalSyntheticLambda0;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;Landroid/view/ViewGroup;)V

    invoke-virtual {v0, v1, v4}, Landroidx/fragment/app/FragmentTransitionImpl;->animateToStart(Ljava/lang/Object;Ljava/lang/Runnable;)V

    goto :goto_1

    .line 809
    :cond_4
    invoke-static {v1}, Landroidx/fragment/app/FragmentManager;->isLoggingEnabled(I)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 810
    const-string v1, "Completing animating immediately"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 813
    :cond_5
    new-instance v0, Landroidx/core/os/CancellationSignal;

    invoke-direct {v0}, Landroidx/core/os/CancellationSignal;-><init>()V

    .line 814
    .local v0, "cancelSignal":Landroidx/core/os/CancellationSignal;
    iget-object v1, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    invoke-virtual {v1}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionImpl()Landroidx/fragment/app/FragmentTransitionImpl;

    move-result-object v1

    .line 815
    iget-object v2, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    invoke-virtual {v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;->getTransitionInfos()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;

    invoke-virtual {v2}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionInfo;->getOperation()Landroidx/fragment/app/SpecialEffectsController$Operation;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/SpecialEffectsController$Operation;->getFragment()Landroidx/fragment/app/Fragment;

    move-result-object v2

    .line 816
    iget-object v3, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->$mergedTransition:Ljava/lang/Object;

    .line 817
    nop

    .line 814
    iget-object v4, p0, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2;->this$0:Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;

    new-instance v5, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$$ExternalSyntheticLambda1;

    invoke-direct {v5, v4}, Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect$onStart$4$2$$ExternalSyntheticLambda1;-><init>(Landroidx/fragment/app/DefaultSpecialEffectsController$TransitionEffect;)V

    invoke-virtual {v1, v2, v3, v0, v5}, Landroidx/fragment/app/FragmentTransitionImpl;->setListenerForTransitionEnd(Landroidx/fragment/app/Fragment;Ljava/lang/Object;Landroidx/core/os/CancellationSignal;Ljava/lang/Runnable;)V

    .line 827
    invoke-virtual {v0}, Landroidx/core/os/CancellationSignal;->cancel()V

    .line 829
    .end local v0    # "cancelSignal":Landroidx/core/os/CancellationSignal;
    :goto_1
    return-void
.end method
