.class final Lkotlin/time/UnboundLocalDateTime;
.super Ljava/lang/Object;
.source "Instant.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/time/UnboundLocalDateTime$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0003\u0018\u0000 \u00192\u00020\u0001:\u0001\u0019B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000e\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0003J\u0008\u0010\u0017\u001a\u00020\u0018H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\rR\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\rR\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\rR\u0011\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\r\u00a8\u0006\u001a"
    }
    d2 = {
        "Lkotlin/time/UnboundLocalDateTime;",
        "",
        "year",
        "",
        "month",
        "day",
        "hour",
        "minute",
        "second",
        "nanosecond",
        "<init>",
        "(IIIIIII)V",
        "getYear",
        "()I",
        "getMonth",
        "getDay",
        "getHour",
        "getMinute",
        "getSecond",
        "getNanosecond",
        "toInstant",
        "Lkotlin/time/Instant;",
        "offsetSeconds",
        "toString",
        "",
        "Companion",
        "kotlin-stdlib"
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
.field public static final Companion:Lkotlin/time/UnboundLocalDateTime$Companion;


# instance fields
.field private final day:I

.field private final hour:I

.field private final minute:I

.field private final month:I

.field private final nanosecond:I

.field private final second:I

.field private final year:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lkotlin/time/UnboundLocalDateTime$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/time/UnboundLocalDateTime$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/time/UnboundLocalDateTime;->Companion:Lkotlin/time/UnboundLocalDateTime$Companion;

    return-void
.end method

.method public constructor <init>(IIIIIII)V
    .locals 0
    .param p1, "year"    # I
    .param p2, "month"    # I
    .param p3, "day"    # I
    .param p4, "hour"    # I
    .param p5, "minute"    # I
    .param p6, "second"    # I
    .param p7, "nanosecond"    # I

    .line 434
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 435
    iput p1, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    .line 436
    iput p2, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    .line 437
    iput p3, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    .line 438
    iput p4, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    .line 439
    iput p5, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    .line 440
    iput p6, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    .line 441
    iput p7, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    .line 434
    return-void
.end method


# virtual methods
.method public final getDay()I
    .locals 1

    .line 437
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    return v0
.end method

.method public final getHour()I
    .locals 1

    .line 438
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    return v0
.end method

.method public final getMinute()I
    .locals 1

    .line 439
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    return v0
.end method

.method public final getMonth()I
    .locals 1

    .line 436
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    return v0
.end method

.method public final getNanosecond()I
    .locals 1

    .line 441
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    return v0
.end method

.method public final getSecond()I
    .locals 1

    .line 440
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    return v0
.end method

.method public final getYear()I
    .locals 1

    .line 435
    iget v0, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    return v0
.end method

.method public final toInstant(I)Lkotlin/time/Instant;
    .locals 14
    .param p1, "offsetSeconds"    # I

    .line 444
    move-object v0, p0

    check-cast v0, Lkotlin/time/UnboundLocalDateTime;

    .local v0, "$this$toInstant_u24lambda_u241":Lkotlin/time/UnboundLocalDateTime;
    const/4 v1, 0x0

    .line 446
    .local v1, "$i$a$-run-UnboundLocalDateTime$toInstant$epochSeconds$1":I
    move-object v2, v0

    .local v2, "$this$toInstant_u24lambda_u241_u24lambda_u240":Lkotlin/time/UnboundLocalDateTime;
    const/4 v3, 0x0

    .line 447
    .local v3, "$i$a$-run-UnboundLocalDateTime$toInstant$epochSeconds$1$epochDays$1":I
    iget v4, v2, Lkotlin/time/UnboundLocalDateTime;->year:I

    int-to-long v4, v4

    .line 448
    .local v4, "y":J
    const/16 v6, 0x16d

    int-to-long v6, v6

    mul-long/2addr v6, v4

    .line 449
    .local v6, "total":J
    const-wide/16 v8, 0x0

    cmp-long v8, v4, v8

    if-ltz v8, :cond_0

    .line 451
    const/4 v8, 0x3

    int-to-long v8, v8

    add-long/2addr v8, v4

    const/4 v10, 0x4

    int-to-long v10, v10

    div-long/2addr v8, v10

    const/16 v10, 0x63

    int-to-long v10, v10

    add-long/2addr v10, v4

    const/16 v12, 0x64

    int-to-long v12, v12

    div-long/2addr v10, v12

    sub-long/2addr v8, v10

    const/16 v10, 0x18f

    int-to-long v10, v10

    add-long/2addr v10, v4

    const/16 v12, 0x190

    int-to-long v12, v12

    div-long/2addr v10, v12

    add-long/2addr v8, v10

    add-long/2addr v6, v8

    goto :goto_0

    .line 454
    :cond_0
    const/4 v8, -0x4

    int-to-long v8, v8

    div-long v8, v4, v8

    const/16 v10, -0x64

    int-to-long v10, v10

    div-long v10, v4, v10

    sub-long/2addr v8, v10

    const/16 v10, -0x190

    int-to-long v10, v10

    div-long v10, v4, v10

    add-long/2addr v8, v10

    sub-long/2addr v6, v8

    .line 458
    :goto_0
    iget v8, v2, Lkotlin/time/UnboundLocalDateTime;->month:I

    mul-int/lit16 v8, v8, 0x16f

    add-int/lit16 v8, v8, -0x16a

    div-int/lit8 v8, v8, 0xc

    int-to-long v8, v8

    add-long/2addr v6, v8

    .line 459
    iget v8, v2, Lkotlin/time/UnboundLocalDateTime;->day:I

    add-int/lit8 v8, v8, -0x1

    int-to-long v8, v8

    add-long/2addr v6, v8

    .line 460
    iget v8, v2, Lkotlin/time/UnboundLocalDateTime;->month:I

    const/4 v9, 0x2

    if-le v8, v9, :cond_1

    .line 461
    const-wide/16 v8, -0x1

    add-long/2addr v6, v8

    .line 462
    iget v10, v2, Lkotlin/time/UnboundLocalDateTime;->year:I

    invoke-static {v10}, Lkotlin/time/InstantKt;->isLeapYear(I)Z

    move-result v10

    if-nez v10, :cond_1

    .line 463
    add-long/2addr v6, v8

    .line 466
    :cond_1
    const v8, 0xafaa8

    int-to-long v8, v8

    sub-long/2addr v6, v8

    .line 446
    .end local v2    # "$this$toInstant_u24lambda_u241_u24lambda_u240":Lkotlin/time/UnboundLocalDateTime;
    .end local v3    # "$i$a$-run-UnboundLocalDateTime$toInstant$epochSeconds$1$epochDays$1":I
    .end local v4    # "y":J
    .end local v6    # "total":J
    move-wide v2, v6

    .line 468
    .local v2, "epochDays":J
    iget v4, v0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    mul-int/lit16 v4, v4, 0xe10

    iget v5, v0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    mul-int/lit8 v5, v5, 0x3c

    add-int/2addr v4, v5

    iget v5, v0, Lkotlin/time/UnboundLocalDateTime;->second:I

    add-int/2addr v4, v5

    .line 469
    .local v4, "daySeconds":I
    const v5, 0x15180

    int-to-long v5, v5

    mul-long/2addr v5, v2

    int-to-long v7, v4

    add-long/2addr v5, v7

    int-to-long v7, p1

    sub-long/2addr v5, v7

    .line 444
    .end local v0    # "$this$toInstant_u24lambda_u241":Lkotlin/time/UnboundLocalDateTime;
    .end local v1    # "$i$a$-run-UnboundLocalDateTime$toInstant$epochSeconds$1":I
    .end local v2    # "epochDays":J
    .end local v4    # "daySeconds":I
    move-wide v0, v5

    .line 471
    .local v0, "epochSeconds":J
    sget-object v2, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-virtual {v2}, Lkotlin/time/Instant$Companion;->getMIN$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/time/Instant;->getEpochSeconds()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_2

    sget-object v2, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    invoke-virtual {v2}, Lkotlin/time/Instant$Companion;->getMAX$kotlin_stdlib()Lkotlin/time/Instant;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/time/Instant;->getEpochSeconds()J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-gtz v2, :cond_2

    .line 475
    sget-object v2, Lkotlin/time/Instant;->Companion:Lkotlin/time/Instant$Companion;

    iget v3, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    invoke-virtual {v2, v0, v1, v3}, Lkotlin/time/Instant$Companion;->fromEpochSeconds(JI)Lkotlin/time/Instant;

    move-result-object v2

    return-object v2

    .line 472
    :cond_2
    new-instance v2, Lkotlin/time/InstantFormatException;

    .line 473
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The parsed date is outside the range representable by Instant (Unix epoch second "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 472
    invoke-direct {v2, v3}, Lkotlin/time/InstantFormatException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 478
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UnboundLocalDateTime("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->year:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lkotlin/time/UnboundLocalDateTime;->month:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->day:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->hour:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, p0, Lkotlin/time/UnboundLocalDateTime;->minute:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->second:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lkotlin/time/UnboundLocalDateTime;->nanosecond:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
