.class public final Lorg/godotengine/godot/input/GodotGestureHandler;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "GodotGestureHandler.kt"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/godotengine/godot/input/GodotGestureHandler$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0010\n\u0002\u0010\u0007\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u000f\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0000\u0018\u0000 32\u00020\u00012\u00020\u0002:\u00013B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0010\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010\u001e\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010\u001f\u001a\u00020 2\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010!\u001a\u00020 2\u0006\u0010\u001c\u001a\u00020\u001dH\u0002J\u000e\u0010\"\u001a\u00020 2\u0006\u0010#\u001a\u00020\u0008J\u000e\u0010$\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dJ\u0010\u0010%\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0002J\u0010\u0010&\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0002J\u0010\u0010\'\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0010\u0010(\u001a\u00020\u00082\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J*\u0010)\u001a\u00020\u00082\u0008\u0010*\u001a\u0004\u0018\u00010\u001d2\u0006\u0010+\u001a\u00020\u001d2\u0006\u0010,\u001a\u00020\u00192\u0006\u0010-\u001a\u00020\u0019H\u0016J\u0010\u0010.\u001a\u00020\u00082\u0006\u0010/\u001a\u000200H\u0016J\u0010\u00101\u001a\u00020\u00082\u0006\u0010/\u001a\u000200H\u0016J\u0010\u00102\u001a\u00020 2\u0006\u0010/\u001a\u000200H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u0007\u001a\u00020\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\r\u001a\u00020\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\n\"\u0004\u0008\u000f\u0010\u000cR\u001a\u0010\u0010\u001a\u00020\u0008X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\n\"\u0004\u0008\u0012\u0010\u000cR\u000e\u0010\u0013\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0008X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u00064"
    }
    d2 = {
        "Lorg/godotengine/godot/input/GodotGestureHandler;",
        "Landroid/view/GestureDetector$SimpleOnGestureListener;",
        "Landroid/view/ScaleGestureDetector$OnScaleGestureListener;",
        "inputHandler",
        "Lorg/godotengine/godot/input/GodotInputHandler;",
        "<init>",
        "(Lorg/godotengine/godot/input/GodotInputHandler;)V",
        "panningAndScalingEnabled",
        "",
        "getPanningAndScalingEnabled",
        "()Z",
        "setPanningAndScalingEnabled",
        "(Z)V",
        "scrollDeadzoneDisabled",
        "getScrollDeadzoneDisabled",
        "setScrollDeadzoneDisabled",
        "hapticFeedbackEnabled",
        "getHapticFeedbackEnabled",
        "setHapticFeedbackEnabled",
        "nextDownIsDoubleTap",
        "dragInProgress",
        "scaleInProgress",
        "contextClickInProgress",
        "pointerCaptureInProgress",
        "lastDragX",
        "",
        "lastDragY",
        "onDown",
        "event",
        "Landroid/view/MotionEvent;",
        "onSingleTapUp",
        "onLongPress",
        "",
        "contextClickRouter",
        "onPointerCaptureChange",
        "hasCapture",
        "onMotionEvent",
        "onActionUp",
        "onActionMove",
        "onDoubleTapEvent",
        "onDoubleTap",
        "onScroll",
        "originEvent",
        "terminusEvent",
        "distanceX",
        "distanceY",
        "onScale",
        "detector",
        "Landroid/view/ScaleGestureDetector;",
        "onScaleBegin",
        "onScaleEnd",
        "Companion",
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
.field public static final Companion:Lorg/godotengine/godot/input/GodotGestureHandler$Companion;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private contextClickInProgress:Z

.field private dragInProgress:Z

.field private hapticFeedbackEnabled:Z

.field private final inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

.field private lastDragX:F

.field private lastDragY:F

.field private nextDownIsDoubleTap:Z

.field private panningAndScalingEnabled:Z

.field private pointerCaptureInProgress:Z

.field private scaleInProgress:Z

.field private scrollDeadzoneDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/godotengine/godot/input/GodotGestureHandler$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/godotengine/godot/input/GodotGestureHandler$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lorg/godotengine/godot/input/GodotGestureHandler;->Companion:Lorg/godotengine/godot/input/GodotGestureHandler$Companion;

    .line 50
    const-class v0, Lorg/godotengine/godot/input/GodotGestureHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/godotengine/godot/input/GodotGestureHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/godotengine/godot/input/GodotInputHandler;)V
    .locals 1
    .param p1, "inputHandler"    # Lorg/godotengine/godot/input/GodotInputHandler;

    const-string v0, "inputHandler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 47
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    iput-object p1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    return-void
.end method

.method private final contextClickRouter(Landroid/view/MotionEvent;)V
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 96
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->nextDownIsDoubleTap:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 101
    :cond_0
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x3

    invoke-virtual {v0, p1, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;I)Z

    .line 104
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    .line 105
    nop

    .line 106
    nop

    .line 107
    nop

    .line 108
    nop

    .line 104
    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-virtual {v0, p1, v1, v2, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMouseEvent(Landroid/view/MotionEvent;IIZ)Z

    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickInProgress:Z

    .line 111
    return-void

    .line 97
    :cond_1
    :goto_0
    return-void
.end method

.method private final onActionMove(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 163
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickInProgress:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 164
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x2

    invoke-virtual {v0, p1, v3, v4, v2}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMouseEvent(Landroid/view/MotionEvent;IIZ)Z

    .line 165
    return v1

    .line 166
    :cond_0
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scrollDeadzoneDisabled:Z

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    if-nez v0, :cond_4

    .line 171
    iget v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    cmpg-float v0, v0, v3

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_0

    :cond_1
    move v0, v2

    :goto_0
    if-eqz v0, :cond_3

    iget v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v3

    cmpg-float v0, v0, v3

    if-nez v0, :cond_2

    move v0, v1

    goto :goto_1

    :cond_2
    move v0, v2

    :goto_1
    if-nez v0, :cond_4

    .line 172
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    iput v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    .line 173
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iput v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    .line 174
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    .line 175
    return v1

    .line 178
    :cond_4
    return v2
.end method

.method private final onActionUp(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 138
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    if-eqz v0, :cond_0

    .line 140
    return v2

    .line 143
    :cond_0
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickInProgress:Z

    if-eqz v0, :cond_1

    goto :goto_0

    .line 159
    :cond_1
    return v1

    .line 144
    :cond_2
    :goto_0
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickInProgress:Z

    if-nez v0, :cond_4

    invoke-static {p1}, Lorg/godotengine/godot/input/GodotInputHandler;->isMouseEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_3

    goto :goto_1

    .line 149
    :cond_3
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    .line 147
    :cond_4
    :goto_1
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1, v2}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMouseEvent(Landroid/view/MotionEvent;I)Z

    .line 151
    :goto_2
    iput-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    .line 152
    iput-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    .line 153
    iput-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickInProgress:Z

    .line 154
    const/4 v0, 0x0

    iput v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    .line 155
    iput v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    .line 156
    return v2
.end method


# virtual methods
.method public final getHapticFeedbackEnabled()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->hapticFeedbackEnabled:Z

    return v0
.end method

.method public final getPanningAndScalingEnabled()Z
    .locals 1

    .line 56
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    return v0
.end method

.method public final getScrollDeadzoneDisabled()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scrollDeadzoneDisabled:Z

    return v0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 193
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->nextDownIsDoubleTap:Z

    .line 194
    return v0
.end method

.method public onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 182
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 183
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->nextDownIsDoubleTap:Z

    .line 184
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    .line 185
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    if-nez v0, :cond_1

    .line 186
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    .line 189
    :cond_1
    :goto_0
    return v1
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    iget-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->nextDownIsDoubleTap:Z

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v2, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;IZ)Z

    .line 76
    iput-boolean v2, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->nextDownIsDoubleTap:Z

    .line 77
    const/4 v0, 0x1

    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-static {p1}, Lorg/godotengine/godot/input/GodotInputHandler;->getEventToolType(Landroid/view/MotionEvent;)I

    move-result v0

    .line 87
    .local v0, "toolType":I
    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    .line 88
    iget-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->hapticFeedbackEnabled:Z

    if-eqz v1, :cond_0

    .line 89
    iget-object v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v1}, Lorg/godotengine/godot/input/GodotInputHandler;->performHapticFeedback()V

    .line 91
    :cond_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/input/GodotGestureHandler;->contextClickRouter(Landroid/view/MotionEvent;)V

    .line 93
    :cond_1
    return-void
.end method

.method public final onMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 126
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 133
    const/4 v0, 0x0

    goto :goto_0

    .line 131
    :sswitch_0
    invoke-direct {p0, p1}, Lorg/godotengine/godot/input/GodotGestureHandler;->onActionMove(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_0

    .line 128
    :sswitch_1
    invoke-direct {p0, p1}, Lorg/godotengine/godot/input/GodotGestureHandler;->onActionUp(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 126
    :goto_0
    return v0

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x2 -> :sswitch_0
        0x3 -> :sswitch_1
        0xc -> :sswitch_1
    .end sparse-switch
.end method

.method public final onPointerCaptureChange(Z)V
    .locals 2
    .param p1, "hasCapture"    # Z

    .line 114
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    if-ne v0, p1, :cond_0

    .line 115
    return-void

    .line 118
    :cond_0
    if-nez p1, :cond_1

    .line 120
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMouseEvent(IZ)Z

    .line 122
    :cond_1
    iput-boolean p1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    .line 123
    return-void
.end method

.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 5
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 229
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    const v2, 0x3f4ccccd    # 0.8f

    cmpl-float v0, v0, v2

    const/4 v2, 0x1

    if-ltz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v3

    if-nez v0, :cond_1

    move v1, v2

    :cond_1
    if-nez v1, :cond_2

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v0

    const v1, 0x3f99999a    # 1.2f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_2

    .line 234
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    move-result v4

    invoke-virtual {v0, v1, v3, v4}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMagnifyEvent(FFF)V

    .line 236
    :cond_2
    return v2

    .line 230
    :cond_3
    :goto_0
    return v1
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 240
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 243
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    .line 244
    return v0

    .line 241
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 1
    .param p1, "detector"    # Landroid/view/ScaleGestureDetector;

    const-string v0, "detector"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 248
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    .line 249
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 6
    .param p1, "originEvent"    # Landroid/view/MotionEvent;
    .param p2, "terminusEvent"    # Landroid/view/MotionEvent;
    .param p3, "distanceX"    # F
    .param p4, "distanceY"    # F

    const-string v0, "terminusEvent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 203
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 204
    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    const/4 v3, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scrollDeadzoneDisabled:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    cmpg-float v0, v0, v3

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    if-eqz v0, :cond_2

    iget v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    cmpg-float v0, v0, v3

    if-nez v0, :cond_1

    move v0, v1

    goto :goto_1

    :cond_1
    move v0, v2

    :goto_1
    if-nez v0, :cond_4

    .line 205
    :cond_2
    if-eqz p1, :cond_3

    .line 207
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/4 v4, 0x3

    invoke-virtual {v0, p1, v4}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;I)Z

    .line 209
    :cond_3
    iput-boolean v2, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    .line 210
    iput v3, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    .line 211
    iput v3, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    .line 215
    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 216
    .local v0, "x":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    .line 217
    .local v3, "y":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v4

    const/4 v5, 0x2

    if-lt v4, v5, :cond_5

    iget-boolean v4, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    if-eqz v4, :cond_5

    iget-boolean v4, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->pointerCaptureInProgress:Z

    if-nez v4, :cond_5

    iget-boolean v4, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    if-nez v4, :cond_5

    .line 218
    iget-object v2, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    const/high16 v4, 0x40a00000    # 5.0f

    div-float v5, p3, v4

    div-float v4, p4, v4

    invoke-virtual {v2, v0, v3, v5, v4}, Lorg/godotengine/godot/input/GodotInputHandler;->handlePanEvent(FFFF)V

    goto :goto_2

    .line 219
    :cond_5
    iget-boolean v4, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scaleInProgress:Z

    if-nez v4, :cond_6

    .line 220
    iput-boolean v1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->dragInProgress:Z

    .line 221
    invoke-virtual {p2, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    iput v4, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragX:F

    .line 222
    invoke-virtual {p2, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v2, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->lastDragY:F

    .line 223
    iget-object v2, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v2, p2}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    .line 225
    :cond_6
    :goto_2
    return v1
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    const-string v0, "event"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    iget-object v0, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->inputHandler:Lorg/godotengine/godot/input/GodotInputHandler;

    invoke-virtual {v0, p1}, Lorg/godotengine/godot/input/GodotInputHandler;->handleMotionEvent(Landroid/view/MotionEvent;)Z

    .line 82
    const/4 v0, 0x1

    return v0
.end method

.method public final setHapticFeedbackEnabled(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 63
    iput-boolean p1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->hapticFeedbackEnabled:Z

    return-void
.end method

.method public final setPanningAndScalingEnabled(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 56
    iput-boolean p1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->panningAndScalingEnabled:Z

    return-void
.end method

.method public final setScrollDeadzoneDisabled(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 58
    iput-boolean p1, p0, Lorg/godotengine/godot/input/GodotGestureHandler;->scrollDeadzoneDisabled:Z

    return-void
.end method
