# Home "Unblock apps" flow: wait screen, duration picker, running badge.
# Columns: en, ur, ar, hi, es, fr, de, pt, id, ru, ja, ko, tr, it, zh
S = {
 "homeWaitFor": ["Wait for {s}s", "{s} سیکنڈ انتظار کریں", "انتظر {s} ث", "{s} सेकंड रुकें", "Espera {s} s", "Patientez {s} s", "Warte {s} s", "Aguarde {s} s", "Tunggu {s} dtk", "Подождите {s} с", "{s}秒待って", "{s}초 기다리세요", "{s} sn bekle", "Attendi {s} s", "等待 {s} 秒"],
 "homeWaitHint": ["Take a breath. Do you really need it now?", "ایک سانس لیں۔ کیا ابھی واقعی ضرورت ہے؟", "خذ نفسًا. هل تحتاجه الآن حقًا؟", "एक साँस लें। क्या अभी सच में ज़रूरत है?", "Respira. ¿De verdad lo necesitas ahora?", "Respirez. En avez-vous vraiment besoin ?", "Atme durch. Brauchst du es wirklich jetzt?", "Respire. Você precisa mesmo agora?", "Tarik napas. Benar-benar perlu sekarang?", "Вдохните. Это правда нужно сейчас?", "ひと呼吸。本当に今必要？", "숨 한번 쉬어요. 지금 꼭 필요한가요?", "Bir nefes al. Şimdi gerçekten gerekli mi?", "Respira. Ti serve davvero adesso?", "深呼吸。现在真的需要吗？"],
 "homeUnblockAllFor": ["Unblock all apps for…", "تمام ایپس کتنی دیر کے لیے کھولیں…", "إلغاء حظر كل التطبيقات لمدة…", "सभी ऐप्स कितनी देर के लिए खोलें…", "Desbloquear todas las apps durante…", "Débloquer toutes les apps pendant…", "Alle Apps freigeben für…", "Desbloquear todos os apps por…", "Buka semua aplikasi selama…", "Разблокировать все приложения на…", "すべてのアプリを解除する時間…", "모든 앱 차단 해제 시간…", "Tüm uygulamaların kilidini aç…", "Sblocca tutte le app per…", "解除所有应用的时长…"],
 "homeUnblock": ["Unblock", "کھولیں", "إلغاء الحظر", "अनब्लॉक करें", "Desbloquear", "Débloquer", "Freigeben", "Desbloquear", "Buka blokir", "Разблокировать", "解除する", "차단 해제", "Kilidi aç", "Sblocca", "解除"],
 "homeNevermind": ["Nevermind", "رہنے دیں", "لا بأس", "रहने दें", "Mejor no", "Laisser tomber", "Doch nicht", "Deixa pra lá", "Tidak jadi", "Не надо", "やめておく", "그만둘게요", "Vazgeç", "Lascia stare", "算了"],
 "homeMinutesN": ["{n, plural, =1{1 minute} other{{n} minutes}}", "{n} منٹ", "{n, plural, =1{دقيقة واحدة} =2{دقيقتان} few{{n} دقائق} other{{n} دقيقة}}", "{n} मिनट", "{n, plural, =1{1 minuto} other{{n} minutos}}", "{n, plural, =1{1 minute} other{{n} minutes}}", "{n, plural, =1{1 Minute} other{{n} Minuten}}", "{n, plural, =1{1 minuto} other{{n} minutos}}", "{n} menit", "{n, plural, one{{n} минута} few{{n} минуты} other{{n} минут}}", "{n}分", "{n}분", "{n} dakika", "{n, plural, =1{1 minuto} other{{n} minuti}}", "{n} 分钟"],
 "homeUnblockedLeft": ["Unblocked · {time} left", "کھلی ہیں · {time} باقی", "غير محظورة · متبقٍ {time}", "अनब्लॉक · {time} बाकी", "Desbloqueadas · quedan {time}", "Débloquées · encore {time}", "Frei · noch {time}", "Liberados · faltam {time}", "Terbuka · sisa {time}", "Открыты · осталось {time}", "解除中・残り{time}", "해제됨 · {time} 남음", "Açık · {time} kaldı", "Sbloccate · mancano {time}", "已解除 · 剩余 {time}"],
}
META = {
 "homeWaitFor": {"placeholders": {"s": {"type": "int"}}},
 "homeMinutesN": {"placeholders": {"n": {"type": "int"}}},
 "homeUnblockedLeft": {"placeholders": {"time": {"type": "String"}}},
}
