.class public Lorg/godotengine/godot/tts/GodotTTS;
.super Landroid/speech/tts/UtteranceProgressListener;
.source "GodotTTS.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# static fields
.field private static final EVENT_BOUNDARY:I = 0x3

.field private static final EVENT_CANCEL:I = 0x2

.field private static final EVENT_END:I = 0x1

.field private static final EVENT_START:I = 0x0

.field private static final INIT_STATE_FAIL:I = -0x1

.field private static final INIT_STATE_SUCCESS:I = 0x1

.field private static final INIT_STATE_UNKNOWN:I


# instance fields
.field private final context:Landroid/content/Context;

.field private lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

.field private final lock:Ljava/lang/Object;

.field private paused:Z

.field private queue:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lorg/godotengine/godot/tts/GodotUtterance;",
            ">;"
        }
    .end annotation
.end field

.field private speaking:Z

.field private state:I

.field private synth:Landroid/speech/tts/TextToSpeech;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 81
    invoke-direct {p0}, Landroid/speech/tts/UtteranceProgressListener;-><init>()V

    .line 75
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    .line 82
    iput-object p1, p0, Lorg/godotengine/godot/tts/GodotTTS;->context:Landroid/content/Context;

    .line 83
    return-void
.end method

.method private updateTTS()V
    .locals 8

    .line 86
    iget-boolean v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_3

    .line 87
    const/4 v0, 0x0

    .line 88
    .local v0, "mode":I
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/godotengine/godot/tts/GodotUtterance;

    .line 90
    .local v1, "message":Lorg/godotengine/godot/tts/GodotUtterance;
    iget-object v2, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v2}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v2

    .line 91
    .local v2, "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    if-nez v2, :cond_0

    .line 92
    return-void

    .line 94
    :cond_0
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/speech/tts/Voice;

    .line 95
    .local v4, "v":Landroid/speech/tts/Voice;
    invoke-virtual {v4}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v1, Lorg/godotengine/godot/tts/GodotUtterance;->voice:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 96
    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v3, v4}, Landroid/speech/tts/TextToSpeech;->setVoice(Landroid/speech/tts/Voice;)I

    .line 97
    goto :goto_1

    .line 99
    .end local v4    # "v":Landroid/speech/tts/Voice;
    :cond_1
    goto :goto_0

    .line 100
    :cond_2
    :goto_1
    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget v4, v1, Lorg/godotengine/godot/tts/GodotUtterance;->pitch:F

    invoke-virtual {v3, v4}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    .line 101
    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget v4, v1, Lorg/godotengine/godot/tts/GodotUtterance;->rate:F

    invoke-virtual {v3, v4}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 103
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 104
    .local v3, "params":Landroid/os/Bundle;
    iget v4, v1, Lorg/godotengine/godot/tts/GodotUtterance;->volume:I

    int-to-float v4, v4

    const/high16 v5, 0x42c80000    # 100.0f

    div-float/2addr v4, v5

    const-string v5, "volume"

    invoke-virtual {v3, v5, v4}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 106
    iput-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    .line 107
    iget-object v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    const/4 v5, 0x0

    iput v5, v4, Lorg/godotengine/godot/tts/GodotUtterance;->start:I

    .line 108
    iget-object v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iput v5, v4, Lorg/godotengine/godot/tts/GodotUtterance;->offset:I

    .line 109
    iput-boolean v5, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    .line 111
    iget-object v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget-object v5, v1, Lorg/godotengine/godot/tts/GodotUtterance;->text:Ljava/lang/String;

    iget-wide v6, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v0, v3, v6}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    .line 112
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 114
    .end local v0    # "mode":I
    .end local v1    # "message":Lorg/godotengine/godot/tts/GodotUtterance;
    .end local v2    # "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    .end local v3    # "params":Landroid/os/Bundle;
    :cond_3
    return-void
.end method


# virtual methods
.method public getState()I
    .locals 2

    .line 359
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 360
    :try_start_0
    iget v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    monitor-exit v0

    return v1

    .line 361
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getVoices()[Ljava/lang/String;
    .locals 9

    .line 324
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 325
    :try_start_0
    iget v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v1, v3, :cond_0

    .line 326
    new-array v1, v2, [Ljava/lang/String;

    monitor-exit v0

    return-object v1

    .line 328
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v1

    .line 329
    .local v1, "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    if-nez v1, :cond_1

    .line 330
    new-array v2, v2, [Ljava/lang/String;

    monitor-exit v0

    return-object v2

    .line 332
    :cond_1
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    .line 333
    .local v2, "list":[Ljava/lang/String;
    const/4 v3, 0x0

    .line 334
    .local v3, "i":I
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/speech/tts/Voice;

    .line 335
    .local v5, "v":Landroid/speech/tts/Voice;
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "i":I
    .local v6, "i":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Landroid/speech/tts/Voice;->getLocale()Ljava/util/Locale;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ";"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v3

    .line 336
    .end local v5    # "v":Landroid/speech/tts/Voice;
    move v3, v6

    goto :goto_0

    .line 337
    .end local v6    # "i":I
    .restart local v3    # "i":I
    :cond_2
    monitor-exit v0

    return-object v2

    .line 338
    .end local v1    # "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    .end local v2    # "list":[Ljava/lang/String;
    .end local v3    # "i":I
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public init()V
    .locals 2

    .line 201
    const/4 v0, 0x0

    iput v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    .line 202
    new-instance v0, Landroid/speech/tts/TextToSpeech;

    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    .line 203
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    .line 205
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0, p0}, Landroid/speech/tts/TextToSpeech;->setOnUtteranceProgressListener(Landroid/speech/tts/UtteranceProgressListener;)I

    .line 206
    return-void
.end method

.method public isPaused()Z
    .locals 1

    .line 352
    iget-boolean v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    return v0
.end method

.method public isSpeaking()Z
    .locals 1

    .line 345
    iget-boolean v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    return v0
.end method

.method public onDone(Ljava/lang/String;)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 160
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 161
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-nez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 162
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v4, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 163
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 164
    invoke-direct {p0}, Lorg/godotengine/godot/tts/GodotTTS;->updateTTS()V

    .line 166
    :cond_0
    monitor-exit v0

    .line 167
    return-void

    .line 166
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/String;)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 188
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 189
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-nez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 190
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v4, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 191
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 192
    invoke-direct {p0}, Lorg/godotengine/godot/tts/GodotTTS;->updateTTS()V

    .line 194
    :cond_0
    monitor-exit v0

    .line 195
    return-void

    .line 194
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onError(Ljava/lang/String;I)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;
    .param p2, "errorCode"    # I

    .line 174
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 175
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-nez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 176
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v4, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 177
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 178
    invoke-direct {p0}, Lorg/godotengine/godot/tts/GodotTTS;->updateTTS()V

    .line 180
    :cond_0
    monitor-exit v0

    .line 181
    return-void

    .line 180
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onInit(I)V
    .locals 2
    .param p1, "status"    # I

    .line 213
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 214
    if-nez p1, :cond_0

    .line 215
    const/4 v1, 0x1

    :try_start_0
    iput v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    goto :goto_0

    .line 217
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    .line 219
    :goto_0
    monitor-exit v0

    .line 220
    return-void

    .line 219
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onRangeStart(Ljava/lang/String;III)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "frame"    # I

    .line 121
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 122
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 123
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iput p2, v1, Lorg/godotengine/godot/tts/GodotUtterance;->offset:I

    .line 124
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->start:I

    add-int/2addr v3, p2

    const/4 v4, 0x3

    invoke-static {v4, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 126
    :cond_0
    monitor-exit v0

    .line 127
    return-void

    .line 126
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onStart(Ljava/lang/String;)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;

    .line 148
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 149
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->start:I

    if-nez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 150
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    const/4 v3, 0x0

    invoke-static {v3, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 152
    :cond_0
    monitor-exit v0

    .line 153
    return-void

    .line 152
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onStop(Ljava/lang/String;Z)V
    .locals 5
    .param p1, "utteranceId"    # Ljava/lang/String;
    .param p2, "interrupted"    # Z

    .line 134
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 135
    :try_start_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-nez v1, :cond_0

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v3, v3, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 136
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-static {v4, v1, v2, v3}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 137
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 138
    invoke-direct {p0}, Lorg/godotengine/godot/tts/GodotTTS;->updateTTS()V

    .line 140
    :cond_0
    monitor-exit v0

    .line 141
    return-void

    .line 140
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public pauseSpeaking()V
    .locals 3

    .line 245
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 246
    :try_start_0
    iget v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 247
    monitor-exit v0

    return-void

    .line 249
    :cond_0
    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-nez v1, :cond_1

    .line 250
    iput-boolean v2, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    .line 251
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->stop()I

    .line 253
    :cond_1
    monitor-exit v0

    .line 254
    return-void

    .line 253
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public resumeSpeaking()V
    .locals 9

    .line 260
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 261
    :try_start_0
    iget v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 262
    monitor-exit v0

    return-void

    .line 264
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    const/4 v3, 0x0

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    if-eqz v1, :cond_4

    .line 265
    const/4 v1, 0x0

    .line 267
    .local v1, "mode":I
    iget-object v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v4}, Landroid/speech/tts/TextToSpeech;->getVoices()Ljava/util/Set;

    move-result-object v4

    .line 268
    .local v4, "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    if-nez v4, :cond_1

    .line 269
    monitor-exit v0

    return-void

    .line 271
    :cond_1
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/speech/tts/Voice;

    .line 272
    .local v6, "v":Landroid/speech/tts/Voice;
    invoke-virtual {v6}, Landroid/speech/tts/Voice;->getName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-object v8, v8, Lorg/godotengine/godot/tts/GodotUtterance;->voice:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 273
    iget-object v5, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v5, v6}, Landroid/speech/tts/TextToSpeech;->setVoice(Landroid/speech/tts/Voice;)I

    .line 274
    goto :goto_1

    .line 276
    .end local v6    # "v":Landroid/speech/tts/Voice;
    :cond_2
    goto :goto_0

    .line 277
    :cond_3
    :goto_1
    iget-object v5, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget-object v6, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v6, v6, Lorg/godotengine/godot/tts/GodotUtterance;->pitch:F

    invoke-virtual {v5, v6}, Landroid/speech/tts/TextToSpeech;->setPitch(F)I

    .line 278
    iget-object v5, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget-object v6, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v6, v6, Lorg/godotengine/godot/tts/GodotUtterance;->rate:F

    invoke-virtual {v5, v6}, Landroid/speech/tts/TextToSpeech;->setSpeechRate(F)I

    .line 280
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    .line 281
    .local v5, "params":Landroid/os/Bundle;
    const-string v6, "volume"

    iget-object v7, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v7, v7, Lorg/godotengine/godot/tts/GodotUtterance;->volume:I

    int-to-float v7, v7

    const/high16 v8, 0x42c80000    # 100.0f

    div-float/2addr v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 283
    iget-object v6, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-object v7, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v7, v7, Lorg/godotengine/godot/tts/GodotUtterance;->offset:I

    iput v7, v6, Lorg/godotengine/godot/tts/GodotUtterance;->start:I

    .line 284
    iget-object v6, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iput v3, v6, Lorg/godotengine/godot/tts/GodotUtterance;->offset:I

    .line 285
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    .line 287
    iget-object v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    iget-object v6, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-object v6, v6, Lorg/godotengine/godot/tts/GodotUtterance;->text:Ljava/lang/String;

    iget-object v7, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget v7, v7, Lorg/godotengine/godot/tts/GodotUtterance;->start:I

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v7, v7, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v6, v1, v5, v7}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/CharSequence;ILandroid/os/Bundle;Ljava/lang/String;)I

    .line 288
    iput-boolean v2, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 289
    .end local v1    # "mode":I
    .end local v4    # "voices":Ljava/util/Set;, "Ljava/util/Set<Landroid/speech/tts/Voice;>;"
    .end local v5    # "params":Landroid/os/Bundle;
    goto :goto_2

    .line 290
    :cond_4
    iput-boolean v3, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    .line 292
    :goto_2
    monitor-exit v0

    .line 293
    return-void

    .line 292
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public speak(Ljava/lang/String;Ljava/lang/String;IFFJZ)V
    .locals 12
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "voice"    # Ljava/lang/String;
    .param p3, "volume"    # I
    .param p4, "pitch"    # F
    .param p5, "rate"    # F
    .param p6, "utterance_id"    # J
    .param p8, "interrupt"    # Z

    .line 226
    move-object v1, p0

    iget-object v2, v1, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v2

    .line 227
    :try_start_0
    iget v0, v1, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    const/4 v3, 0x1

    if-eq v0, v3, :cond_0

    .line 228
    monitor-exit v2

    return-void

    .line 230
    :cond_0
    new-instance v0, Lorg/godotengine/godot/tts/GodotUtterance;

    move-object v4, v0

    move-object v5, p1

    move-object v6, p2

    move v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move-wide/from16 v10, p6

    invoke-direct/range {v4 .. v11}, Lorg/godotengine/godot/tts/GodotUtterance;-><init>(Ljava/lang/String;Ljava/lang/String;IFFJ)V

    .line 231
    .local v0, "message":Lorg/godotengine/godot/tts/GodotUtterance;
    iget-object v3, v1, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    invoke-virtual {v3, v0}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 233
    invoke-virtual {p0}, Lorg/godotengine/godot/tts/GodotTTS;->isPaused()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 234
    invoke-virtual {p0}, Lorg/godotengine/godot/tts/GodotTTS;->resumeSpeaking()V

    goto :goto_0

    .line 236
    :cond_1
    invoke-direct {p0}, Lorg/godotengine/godot/tts/GodotTTS;->updateTTS()V

    .line 238
    .end local v0    # "message":Lorg/godotengine/godot/tts/GodotUtterance;
    :goto_0
    monitor-exit v2

    .line 239
    return-void

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public stopSpeaking()V
    .locals 7

    .line 299
    iget-object v0, p0, Lorg/godotengine/godot/tts/GodotTTS;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 300
    :try_start_0
    iget v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->state:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 301
    monitor-exit v0

    return-void

    .line 303
    :cond_0
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/godotengine/godot/tts/GodotUtterance;

    .line 304
    .local v2, "u":Lorg/godotengine/godot/tts/GodotUtterance;
    iget-wide v5, v2, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    invoke-static {v3, v5, v6, v4}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 305
    .end local v2    # "u":Lorg/godotengine/godot/tts/GodotUtterance;
    goto :goto_0

    .line 306
    :cond_1
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->queue:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 308
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    if-eqz v1, :cond_2

    .line 309
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    iget-wide v1, v1, Lorg/godotengine/godot/tts/GodotUtterance;->id:J

    invoke-static {v3, v1, v2, v4}, Lorg/godotengine/godot/GodotLib;->ttsCallback(IJI)V

    .line 311
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->lastUtterance:Lorg/godotengine/godot/tts/GodotUtterance;

    .line 313
    iput-boolean v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->paused:Z

    .line 314
    iput-boolean v4, p0, Lorg/godotengine/godot/tts/GodotTTS;->speaking:Z

    .line 316
    iget-object v1, p0, Lorg/godotengine/godot/tts/GodotTTS;->synth:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v1}, Landroid/speech/tts/TextToSpeech;->stop()I

    .line 317
    monitor-exit v0

    .line 318
    return-void

    .line 317
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
