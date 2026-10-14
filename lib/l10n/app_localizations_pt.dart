// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get ob1Title => 'Reduza o vício em telas';

  @override
  String get ob1Body =>
      'Assuma o controle dos seus hábitos digitais e passe menos tempo em apps que distraem.';

  @override
  String get ob1StatAvg => 'Tempo de tela diário médio';

  @override
  String get ob1StatSocial => 'Gasto em redes sociais';

  @override
  String get ob2SelectApps => 'Selecionar apps';

  @override
  String get ob2Title => 'Bloqueie apps que distraem';

  @override
  String get ob2Body =>
      'Bloqueie redes sociais, jogos e outras distrações com ferramentas poderosas de bloqueio.';

  @override
  String get ob2Feature1 => 'Bloqueie qualquer app com um toque';

  @override
  String get ob2Feature2 => 'Agende horários de bloqueio e foco';

  @override
  String get ob2Feature3 => 'Proteja bloqueios com senha para manter o foco';

  @override
  String get sheetTitle => 'Selecionar apps';

  @override
  String get sheetTotalLocked => 'Total bloqueado';

  @override
  String get sheetAppsSelected => 'apps selecionados';

  @override
  String get sheetTimeSaved => 'Tempo economizado';

  @override
  String get sheetPerDayAvg => 'média por dia';

  @override
  String sheetHoursValue(String h) {
    return '$h h';
  }

  @override
  String get sheetSearchHint => 'Buscar apps...';

  @override
  String get sheetCatAll => 'Todos';

  @override
  String get sheetCatSocial => 'Social';

  @override
  String get sheetCatEntertainment => 'Entretenimento';

  @override
  String get sheetCatGames => 'Jogos';

  @override
  String get sheetAppsHeader => 'APPS';

  @override
  String sheetSelectedCount(int count) {
    return '$count selecionados';
  }

  @override
  String get sheetNoApps => 'Nenhum app encontrado';

  @override
  String get sheetLockSchedule => 'AGENDA DE BLOQUEIO';

  @override
  String get sheetAddCustomSemantic => 'Adicionar um horário personalizado';

  @override
  String get sheetCustomBadge => '+ Personalizado';

  @override
  String get sheetSchedMorning => 'Manhã';

  @override
  String get sheetSchedWork => 'Trabalho';

  @override
  String get sheetSchedEvening => 'Noite';

  @override
  String get sheetEveryDay => 'Todos os dias';

  @override
  String get sheetWeekdays => 'Dias úteis';

  @override
  String get sheetWeekends => 'Fins de semana';

  @override
  String get sheetUnlockMethod => 'MÉTODO DE DESBLOQUEIO';

  @override
  String get sheetPin => 'Código PIN';

  @override
  String get sheetPinSub => 'PIN de 4 dígitos';

  @override
  String get sheetFaceId => 'Face ID';

  @override
  String get sheetFaceIdSub => 'Biometria';

  @override
  String get sheetTouchId => 'Touch ID';

  @override
  String get sheetTouchIdSub => 'Impressão digital';

  @override
  String get sheetFooter => 'Você pode mudar isso depois quando quiser';

  @override
  String get sheetConfirmLock => 'Confirmar bloqueio';

  @override
  String sheetRemove(String name) {
    return 'Remover $name';
  }

  @override
  String get sheetCustomTitle => 'Horário personalizado';

  @override
  String get sheetCustomBody =>
      'Os apps selecionados ficam bloqueados durante esse período.';

  @override
  String get sheetNameLabel => 'NOME';

  @override
  String get sheetNameHint => 'ex.: Hora de estudar';

  @override
  String get sheetStarts => 'Início';

  @override
  String get sheetEnds => 'Fim';

  @override
  String get sheetSameTime => 'O início e o fim são iguais';

  @override
  String sheetLockedFor(String duration) {
    return 'Bloqueado por $duration';
  }

  @override
  String sheetLockedForOvernight(String duration) {
    return 'Bloqueado por $duration (durante a noite)';
  }

  @override
  String sheetDurH(int h) {
    return '$h h';
  }

  @override
  String sheetDurM(int m) {
    return '$m min';
  }

  @override
  String sheetDurHM(int h, int m) {
    return '$h h $m min';
  }

  @override
  String get sheetLockStartsAt => 'O BLOQUEIO COMEÇA ÀS';

  @override
  String get sheetLockEndsAt => 'O BLOQUEIO TERMINA ÀS';

  @override
  String get sheetRepeatOn => 'REPETIR EM';

  @override
  String get sheetAddSchedule => 'Adicionar horário';

  @override
  String get sheetCustomDefaultName => 'Personalizado';

  @override
  String sheetChangeTime(String label, String time) {
    return '$label $time. Alterar horário';
  }

  @override
  String get ob3Title => 'Mantenha o foco todo dia';

  @override
  String get ob3Body =>
      'Use sessões Pomodoro e Foco profundo para aumentar a produtividade e conquistar mais.';

  @override
  String get ob3Pomodoro => 'Pomodoro';

  @override
  String ob3PomodoroSub(int min) {
    return 'Sessões de $min min';
  }

  @override
  String get ob3DeepFocus => 'Foco profundo';

  @override
  String ob3DeepFocusSub(int min) {
    return 'Fluxo de $min min';
  }

  @override
  String get ob3StatBoost => 'mais produtividade';

  @override
  String ob3StatStreakValue(int days) {
    return '$days dias';
  }

  @override
  String get ob3StatStreak => 'sequência em alta';

  @override
  String get ob3StatGoal => 'metas concluídas';

  @override
  String get ob3StartTimer => 'Iniciar timer';

  @override
  String get ob3PauseTimer => 'Pausar timer';

  @override
  String get ob4Title => 'Acompanhe seu progresso';

  @override
  String get ob4Body =>
      'Acompanhe tempo de tela, horas de foco, metas e produtividade com análises lindas.';

  @override
  String get ob4Weekly => 'Semanal';

  @override
  String get ob4WeeklySub => 'relatórios';

  @override
  String get ob4Goals => 'Metas';

  @override
  String get ob4GoalsSub => 'acompanhamento';

  @override
  String get ob4Insights => 'Insights';

  @override
  String get ob4InsightsSub => 'coach IA';

  @override
  String get ob4Streaks => 'Sequências';

  @override
  String get ob4StreaksSub => 'e medalhas';

  @override
  String get ob5Title => 'Qual é seu tempo de tela médio por dia?';

  @override
  String get ob5Subtitle => 'Só no seu celular. Um palpite já serve.';

  @override
  String get ob5More7 => 'Mais de 7 horas';

  @override
  String get ob5H5to7 => '5-7 horas';

  @override
  String get ob5H4to5 => '4-5 horas';

  @override
  String get ob5H3to4 => '3-4 horas';

  @override
  String get ob5H1to3 => '1-3 horas';

  @override
  String get ob5Under1 => 'Menos de 1 hora';

  @override
  String get ob6Title => 'Qual é a sua profissão?';

  @override
  String get ob6Subtitle =>
      'Vamos personalizar seu plano de foco conforme seu estilo de trabalho.';

  @override
  String get ob6Software => 'Desenvolvimento de software';

  @override
  String get ob6Founder => 'CEO / Fundador';

  @override
  String get ob6Remote => 'Trabalho remoto';

  @override
  String get ob6Finance => 'Finanças / Operações / Consultoria';

  @override
  String get ob6Art => 'Arte / Conteúdo';

  @override
  String get ob6Education => 'Educação';

  @override
  String get ob6Others => 'Outros';

  @override
  String get ob7Title => 'Defina sua meta diária de tempo de tela';

  @override
  String get ob7Subtitle =>
      'Você pode mudar isso quando quiser. Avisaremos quando estiver perto.';

  @override
  String ob7Hours(String hours) {
    return '$hours h';
  }

  @override
  String get ob7PerDay => 'por dia';

  @override
  String ob7HoursPerDay(String hours) {
    return '$hours por dia';
  }

  @override
  String get ob7DialLabel => 'Meta diária de tempo de tela';

  @override
  String get ob7InfoNote =>
      'Em média, as pessoas passam mais de 4 h por dia no celular. Definir uma meta é o primeiro passo para recuperar seu tempo.';

  @override
  String get ob8Title => 'Ative as permissões essenciais';

  @override
  String get ob8Subtitle =>
      'Conceda acesso para aproveitar o Pausey por completo.';

  @override
  String get ob8UsageTitle => 'Acesso ao uso';

  @override
  String get ob8UsageSub => 'Monitore o uso de apps e aplique sessões de foco.';

  @override
  String get ob8NotifTitle => 'Notificações';

  @override
  String get ob8NotifSub => 'Lembretes na hora certa e alertas de progresso.';

  @override
  String get ob8TrackTitle => 'Acompanhe o uso de apps';

  @override
  String get ob8TrackSub => 'Resumos diários e semanais.';

  @override
  String get ob9Title => 'Tudo pronto!';

  @override
  String get ob9Subtitle => 'Seu ambiente de foco está pronto.';

  @override
  String get ob9Enter => 'Entrar no Pausey';

  @override
  String get ob9Replay => 'Rever a introdução';

  @override
  String get ob9ScreenTime => 'Tempo de tela';

  @override
  String get ob9AppsLocked => 'Apps bloqueados';

  @override
  String get ob9Permissions => 'Permissões';

  @override
  String get ob9FocusMode => 'Modo foco';

  @override
  String get ob9AllOk => 'Tudo OK';

  @override
  String get ob9On => 'ATIVO';

  @override
  String get ob9Done => 'FEITO';

  @override
  String get ob9StreakTitle => 'Sua sequência do dia 1 começa agora';

  @override
  String get ob9StreakSub => 'Conclua uma sessão para manter';

  @override
  String get blockTitle => 'Bloqueio de apps';

  @override
  String blockSubtitle(int locked, int total) {
    return '$locked de $total apps bloqueados';
  }

  @override
  String get blockAddApp => 'Adicionar app';

  @override
  String blockLockedChip(int n) {
    return '$n bloqueados';
  }

  @override
  String blockUnlockedChip(int n) {
    return '$n livres';
  }

  @override
  String blockScheduledChip(int n) {
    return '$n agendados';
  }

  @override
  String get blockFaceIdTitle => 'Proteção Face ID';

  @override
  String get blockFaceIdSub => 'Exigir Face ID para desbloquear';

  @override
  String get blockFaceIdUnavailable =>
      'Biometria indisponível neste dispositivo';

  @override
  String get blockFaceIdReason => 'Confirme que é você para ativar';

  @override
  String get blockFaceIdFailed => 'Não verificado; proteção desligada';

  @override
  String get blockScheduleTitle => 'Bloqueio agendado';

  @override
  String get blockStart => 'Início';

  @override
  String get blockEnd => 'Fim';

  @override
  String get blockNeedOneDay => 'Mantenha pelo menos um dia';

  @override
  String get blockManagedApps => 'Apps gerenciados';

  @override
  String get blockLockAll => 'Bloquear tudo';

  @override
  String get blockAllLocked => 'Todos os apps bloqueados';

  @override
  String get blockSched => 'Agend.';

  @override
  String get blockOnlySchedule => 'Bloquear só no horário';

  @override
  String get blockOnlyScheduleSub => 'Senão fica bloqueado o dia todo';

  @override
  String get blockLockedLabel => 'Bloqueado';

  @override
  String get blockRemove => 'Remover da lista';

  @override
  String blockRemoved(String app) {
    return '$app removido';
  }

  @override
  String get blockUndo => 'Desfazer';

  @override
  String get blockAppsUpdated => 'Apps atualizados';

  @override
  String get blockCatSocial => 'Social';

  @override
  String get blockCatVideo => 'Vídeo';

  @override
  String get blockCatGames => 'Jogos';

  @override
  String get blockCatShopping => 'Compras';

  @override
  String get blockCatCommunity => 'Comunidade';

  @override
  String get blockCatOther => 'Outros';

  @override
  String get blockEmptyBadge => 'Nada bloqueado';

  @override
  String get blockEmptyTitle => 'Nenhum app ainda';

  @override
  String get blockEmptyMsg =>
      'Adicione os apps que mais distraem e o Pausey os bloqueia.';

  @override
  String get blockEmergencyTitle => 'Desbloqueio de emergência';

  @override
  String blockEmergencySub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'restam $n hoje',
      one: 'resta 1 hoje',
    );
    return 'Desbloquear tudo temporariamente · $_temp0';
  }

  @override
  String get blockEmergencyOff => 'Desativado nos Ajustes';

  @override
  String get blockEmergencyUse => 'Usar';

  @override
  String get blockEmergencyConfirmTitle => 'Usar desbloqueio de emergência?';

  @override
  String blockEmergencyConfirmMsg(int n) {
    return 'Isso usa um dos $n restantes hoje. Use só quando realmente precisar.';
  }

  @override
  String get blockEmergencyUsed => 'Desbloqueio usado: apps liberados';

  @override
  String get blockEmergencyNone => 'Nenhum restante hoje';

  @override
  String get appName => 'Pausey';

  @override
  String get tagline => 'Recupere seu tempo';

  @override
  String get versionLabel => 'Versão 2.0 · Edição App Store';

  @override
  String get skip => 'Pular';

  @override
  String get continueLabel => 'Continuar';

  @override
  String get back => 'Voltar';

  @override
  String get freeToStart => 'Comece grátis · Sem cartão de crédito';

  @override
  String get dataStaysOnDevice => 'Seus dados nunca saem do seu dispositivo.';

  @override
  String get switchToLight => 'Mudar para modo claro';

  @override
  String get switchToDark => 'Mudar para modo escuro';

  @override
  String get language => 'Idioma';

  @override
  String get phoneLanguage => 'Idioma do celular';

  @override
  String get authTitle => 'Pause a rolagem.\nDomine seu dia.';

  @override
  String get authSubtitle =>
      'Crie uma conta para sincronizar suas metas e sequências, ou experimente o Pausey como convidado.';

  @override
  String get continueWithApple => 'Continuar com a Apple';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get signUpWithEmail => 'Cadastrar com e-mail';

  @override
  String get continueAsGuest => 'Continuar como convidado';

  @override
  String get guestNote =>
      'Os dados de convidado ficam salvos só neste celular.';

  @override
  String get or => 'ou';

  @override
  String get haveAccount => 'Já tem uma conta?';

  @override
  String get noAccount => 'Novo no Pausey?';

  @override
  String get logIn => 'Entrar';

  @override
  String get signUp => 'Cadastrar';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get signUpTitle => 'Crie sua conta';

  @override
  String get signUpSubtitle =>
      'Comece a criar hábitos de tela mais tranquilos.';

  @override
  String get logInTitle => 'Bem-vindo de volta';

  @override
  String get logInSubtitle => 'Entre para continuar sua sequência.';

  @override
  String get fullName => 'Nome completo';

  @override
  String get email => 'E-mail';

  @override
  String get password => 'Senha';

  @override
  String get confirmPassword => 'Confirmar senha';

  @override
  String get showPassword => 'Mostrar senha';

  @override
  String get hidePassword => 'Ocultar senha';

  @override
  String get forgotPassword => 'Esqueceu a senha?';

  @override
  String get resetTitle => 'Redefinir senha';

  @override
  String get resetSubtitle =>
      'Digite seu e-mail e enviaremos um link de redefinição.';

  @override
  String get sendLink => 'Enviar link';

  @override
  String get resetSent =>
      'Confira sua caixa de entrada para o link de redefinição.';

  @override
  String get agreeTerms => 'Concordo com os Termos e a Política de Privacidade';

  @override
  String get passwordStrength => 'Força da senha';

  @override
  String get strengthWeak => 'Fraca';

  @override
  String get strengthOk => 'Razoável';

  @override
  String get strengthStrong => 'Forte';

  @override
  String get errNameRequired => 'Digite seu nome';

  @override
  String get errEmailInvalid => 'Digite um e-mail válido';

  @override
  String get errPasswordShort => 'Use pelo menos 8 caracteres';

  @override
  String get errPasswordMismatch => 'As senhas não coincidem';

  @override
  String get errTerms => 'Aceite os termos para continuar';

  @override
  String get authErr_not_configured =>
      'O login ainda não está configurado. Você pode continuar como convidado.';

  @override
  String get authErr_cancelled => 'O login foi cancelado.';

  @override
  String get authErr_invalid_email => 'Esse e-mail não parece certo.';

  @override
  String get authErr_wrong_password => 'E-mail ou senha incorretos.';

  @override
  String get authErr_user_not_found =>
      'Não há conta com este e-mail. Quer se cadastrar?';

  @override
  String get authErr_email_in_use =>
      'Já existe uma conta com este e-mail. Entre nela.';

  @override
  String get authErr_weak_password => 'Escolha uma senha mais forte.';

  @override
  String get authErr_network => 'Sem conexão com a internet. Tente novamente.';

  @override
  String get authErr_too_many =>
      'Muitas tentativas. Aguarde um minuto e tente novamente.';

  @override
  String get authErr_unknown => 'Algo deu errado. Tente novamente.';

  @override
  String homeHello(String name) {
    return 'Oi, $name';
  }

  @override
  String get homeHelloGuest => 'Olá';

  @override
  String get homeGuestBadge => 'Modo convidado · salvo neste celular';

  @override
  String get homeSubtitle => 'Seu plano está pronto. Veja o que você escolheu.';

  @override
  String get homeDailyGoal => 'Meta diária';

  @override
  String get homeLockedApps => 'Apps bloqueados';

  @override
  String get homeScreenTime => 'Tempo de tela atual';

  @override
  String get homeNotSet => 'Não definido';

  @override
  String get homeCreateAccount => 'Crie uma conta para fazer backup';

  @override
  String get signOut => 'Sair';

  @override
  String get signOutGuestWarn =>
      'Sair apaga os dados de convidado deste celular.';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ob6OtherHint => 'Digite sua ocupação';

  @override
  String get timeSecondLabel => 'Segundo';

  @override
  String get focusModePomodoro => 'Pomodoro';

  @override
  String get focusModeDeep => 'Foco profundo';

  @override
  String get focusModeCustom => 'Personal';

  @override
  String get focusRemaining => 'RESTANTE';

  @override
  String get focusBreakLabel => 'PAUSA';

  @override
  String get focusReadyLabel => 'PRONTO';

  @override
  String get focusInSession => 'Em sessão';

  @override
  String get focusPausedState => 'Pausado';

  @override
  String get focusOnBreak => 'Em pausa';

  @override
  String get focusIdleState => 'Toque em play';

  @override
  String get focusSessionsDone => 'Sessões feitas';

  @override
  String get focusProgress => 'Progresso';

  @override
  String get focusBreakAfter => 'Pausa depois';

  @override
  String get focusFocusedToday => 'Hoje';

  @override
  String focusAppsBlocked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count apps bloqueados',
      one: '1 app bloqueado',
    );
    return '$_temp0';
  }

  @override
  String get focusAppsBlockedSub => 'Distrações bloqueadas nesta sessão.';

  @override
  String get focusNoApps => 'Nenhum app bloqueado';

  @override
  String get focusNoAppsSub => 'Escolha apps para bloquear no foco.';

  @override
  String get focusEdit => 'Editar';

  @override
  String get focusAdd => 'Adicionar';

  @override
  String get focusAmbient => 'Som ambiente';

  @override
  String get focusSoundOff => 'Desligado';

  @override
  String get focusSoundRain => 'Chuva';

  @override
  String get focusSoundForest => 'Floresta';

  @override
  String get focusSoundWaves => 'Ondas do mar';

  @override
  String get focusSoundWhite => 'Ruído branco';

  @override
  String get focusVolume => 'Volume';

  @override
  String get focusStart => 'Iniciar';

  @override
  String get focusPause => 'Pausar';

  @override
  String get focusResume => 'Retomar';

  @override
  String get focusStop => 'Parar';

  @override
  String get focusRestart => 'Reiniciar';

  @override
  String get focusSkipBreak => 'Pular pausa';

  @override
  String get focusDurations => 'Duração das sessões';

  @override
  String focusMinutesN(int n) {
    return '$n min';
  }

  @override
  String get focusBreakLength => 'Pausa';

  @override
  String get focusCustomTitle => 'Duração personalizada';

  @override
  String get focusSet => 'Definir';

  @override
  String get focusStopTitle => 'Encerrar antes?';

  @override
  String get focusStopBody => 'O tempo focado até agora será salvo.';

  @override
  String get focusEndSession => 'Encerrar';

  @override
  String get focusKeepGoing => 'Continuar';

  @override
  String get focusTooShort => 'Menos de um minuto — não salvo.';

  @override
  String get focusBreakOver => 'Pausa encerrada — pronto para a próxima?';

  @override
  String get focusBusy => 'Encerre a sessão para mudar o modo.';

  @override
  String get focusFirstHint =>
      'Sua primeira sessão começa aqui — toque em play.';

  @override
  String get focusCompleteA => 'Sessão';

  @override
  String get focusCompleteB => 'concluída!';

  @override
  String get focusEndedTitle => 'Sessão encerrada';

  @override
  String focusCompleteMsg(String mode) {
    return 'Ótimo trabalho! Você concluiu sua sessão $mode sem distrações.';
  }

  @override
  String get focusEndedMsg => 'Cada minuto conta. Tente uma sessão completa.';

  @override
  String get focusDurationLabel => 'DURAÇÃO DO FOCO';

  @override
  String get focusMinUnit => 'min';

  @override
  String get focusDayStreak => 'Sequência';

  @override
  String get focusAppsLabel => 'Apps bloqueados';

  @override
  String get focusTodayGoal => 'Meta de hoje';

  @override
  String focusPctCompleted(int pct) {
    return '$pct% concluído';
  }

  @override
  String focusPlusPct(int pct) {
    return '+$pct% nesta sessão';
  }

  @override
  String get focusMomentum => 'Mantenha o ritmo!';

  @override
  String get focusQuote1 => 'Constância vence intensidade. Cada sessão soma.';

  @override
  String get focusQuote2 => 'Pequenos blocos de foco geram grandes resultados.';

  @override
  String get focusQuote3 => 'Você não rolou o feed — construiu. Repita.';

  @override
  String get focusStartNext => 'Próxima sessão';

  @override
  String get focusBackHome => 'Voltar ao início';

  @override
  String get goalsTitle => 'Minhas metas';

  @override
  String goalsSubtitle(int active, int done) {
    return '$active ativas · $done concluídas';
  }

  @override
  String get goalsAdd => 'Adicionar meta';

  @override
  String get goalsCompleted => 'Concluídas';

  @override
  String get goalsActive => 'Ativas';

  @override
  String get goalsStreak => 'Sequência';

  @override
  String get goalsOverall => 'Progresso geral';

  @override
  String goalsWeeklyHit(int hit, int total) {
    return '$hit de $total metas semanais';
  }

  @override
  String goalsVsLastWeek(String delta) {
    return '$delta vs semana passada';
  }

  @override
  String get goalsFilterAll => 'Todas';

  @override
  String get goalsDone => 'Feito';

  @override
  String get goalsCatFocus => 'Foco';

  @override
  String get goalsCatDiscipline => 'Disciplina';

  @override
  String get goalsCatWellness => 'Bem-estar';

  @override
  String goalsTitleFocusHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Foco diário: $n horas',
      one: 'Foco diário: 1 hora',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleFocusDur(String duration) {
    return 'Foco diário: $duration';
  }

  @override
  String get goalsTitleBlock => 'Bloquear redes sociais';

  @override
  String goalsTitleSessions(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n Pomodoros por dia',
      one: '1 Pomodoro por dia',
    );
    return '$_temp0';
  }

  @override
  String goalsTitleScreen(String duration) {
    return 'Menos de $duration de tela';
  }

  @override
  String get goalsTitlePhoneFree => 'Tempo sem celular';

  @override
  String goalsDescFocus(String duration) {
    return 'Alcance $duration de foco profundo todo dia';
  }

  @override
  String goalsDescBlock(int n) {
    return 'Mantenha os apps bloqueados $n dias por semana';
  }

  @override
  String goalsDescSessions(int n) {
    return 'Conclua pelo menos $n sessões por dia';
  }

  @override
  String goalsDescScreen(String duration) {
    return 'Use o celular menos de $duration por dia';
  }

  @override
  String goalsDescPhoneFree(int n) {
    return '$n dias sem celular por semana — marque cada um';
  }

  @override
  String goalsProgressDays(int done, int total) {
    return '$done / $total dias';
  }

  @override
  String goalsProgressSessions(int done, int total) {
    return '$done / $total sessões';
  }

  @override
  String goalsStreakShort(int n) {
    return '$n d';
  }

  @override
  String goalsStreakN(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Sequência de $n dias',
      one: 'Sequência de 1 dia',
    );
    return '$_temp0';
  }

  @override
  String get goalsCheckIn => 'Marcar hoje como feito';

  @override
  String get goalsCheckedIn => 'Feito hoje';

  @override
  String get goalsCheckedSnack => 'Boa! Hoje foi marcado como feito.';

  @override
  String get goalsUncheckedSnack => 'Hoje não está mais marcado.';

  @override
  String get goalsCreateNew => 'Criar nova meta';

  @override
  String get goalsEmptyBadge => 'Comece';

  @override
  String get goalsEmptyTitle => 'Nenhuma meta ainda';

  @override
  String get goalsEmptyMsg =>
      'Defina uma pequena meta diária e o Pausey acompanha para você.';

  @override
  String get goalsFilterEmpty => 'Nenhuma meta neste filtro.';

  @override
  String get goalsNewGoal => 'Nova meta';

  @override
  String get goalsEditGoal => 'Editar meta';

  @override
  String get goalsType => 'Tipo de meta';

  @override
  String get goalsTypeFocus => 'Tempo de foco';

  @override
  String get goalsTypeSessions => 'Sessões';

  @override
  String get goalsTypeBlock => 'Bloquear apps';

  @override
  String get goalsTypePhoneFree => 'Dias sem celular';

  @override
  String get goalsTypeScreen => 'Limite de tela';

  @override
  String get goalsCategory => 'Categoria';

  @override
  String get goalsTarget => 'Alvo';

  @override
  String get goalsPerDay => 'por dia';

  @override
  String get goalsPerWeek => 'dias por semana';

  @override
  String get goalsMaxPerDay => 'máximo por dia';

  @override
  String get goalsTitleOptional => 'Título (opcional)';

  @override
  String get goalsSave => 'Salvar meta';

  @override
  String get goalsCreate => 'Criar meta';

  @override
  String get goalsSavedSnack => 'Meta salva';

  @override
  String get goalsCreatedSnack => 'Meta criada';

  @override
  String get goalsEdit => 'Editar';

  @override
  String get goalsDelete => 'Excluir meta';

  @override
  String get goalsDeleteQ => 'Excluir esta meta?';

  @override
  String get goalsDeleteMsg =>
      'Os registros serão removidos. Não dá para desfazer.';

  @override
  String get goalsDeletedSnack => 'Meta excluída';

  @override
  String get goalsComplete => 'concluído';

  @override
  String get goalsDaysActive => 'Dias ativos';

  @override
  String get goalsTotalTime => 'Tempo total';

  @override
  String get goalsSessionsLabel => 'Sessões';

  @override
  String get goals7Day => 'Progresso de 7 dias';

  @override
  String get goals7DaysAgo => '7 dias atrás';

  @override
  String get goalsToday => 'Hoje';

  @override
  String goalsTodayDate(String date) {
    return 'Hoje, $date';
  }

  @override
  String goalsYesterdayDate(String date) {
    return 'Ontem, $date';
  }

  @override
  String get goalsMilestones => 'Marcos';

  @override
  String get goalsMsFirst => 'Primeiro dia concluído';

  @override
  String get goalsMs3 => 'Sequência de 3 dias';

  @override
  String get goalsMsHalf => '50% da meta semanal';

  @override
  String get goalsMs5 => 'Sequência de 5 dias';

  @override
  String get goalsMsWeek => 'Semana completa';

  @override
  String get goalsMsLocked => 'Ainda não';

  @override
  String get goalsHistory => 'Histórico';

  @override
  String get goalsShowLess => 'Ver menos';

  @override
  String get goalsStartSession => 'Iniciar sessão de foco';

  @override
  String get goalsManageApps => 'Gerenciar apps bloqueados';

  @override
  String get goalsBlockHint =>
      'Conta sozinho enquanto o bloqueio programado estiver ativo.';

  @override
  String goalsScreenToday(String used) {
    return 'Tela hoje: $used';
  }

  @override
  String get goalsNotFound => 'Esta meta não existe mais.';

  @override
  String get goalsMore => 'Mais opções';

  @override
  String goalsFreeLimit(int n) {
    return 'Plano grátis: até $n metas';
  }

  @override
  String get homeGoodMorning => 'Bom dia';

  @override
  String get homeGoodAfternoon => 'Boa tarde';

  @override
  String get homeGoodEvening => 'Boa noite';

  @override
  String get homeFriend => 'Amigo';

  @override
  String get homeTodayFocus => 'Foco de hoje';

  @override
  String homeVsYesterday(String pct) {
    return '$pct% vs ontem';
  }

  @override
  String get homeStartToday => 'Ainda sem foco hoje';

  @override
  String get homeDayStreak => 'Dias seguidos';

  @override
  String get homeTodayGoal => 'Meta de hoje';

  @override
  String homePctCompleted(int pct) {
    return '$pct% concluído';
  }

  @override
  String get homeOnTrack => 'No caminho!';

  @override
  String get homeKeepGoing => 'Continue';

  @override
  String get homeGoalMet => 'Meta batida!';

  @override
  String get homeScreenTimeTitle => 'Tempo de tela';

  @override
  String get homeToday => 'Hoje';

  @override
  String homeVsAvg(String pct) {
    return '$pct% vs média';
  }

  @override
  String get homeQuickStart => 'Iniciar sessão de foco';

  @override
  String get homeManage => 'Gerenciar';

  @override
  String get homeNoApps =>
      'Escolha os apps que mais distraem e bloqueie-os aqui.';

  @override
  String get homeAddApps => 'Adicionar apps';

  @override
  String homeAppLocked(String app) {
    return '$app bloqueado';
  }

  @override
  String homeAppUnlocked(String app) {
    return '$app desbloqueado';
  }

  @override
  String homeLockApp(String app) {
    return 'Bloquear ou desbloquear $app';
  }

  @override
  String get homeUpgradeTitle => 'Seja Premium';

  @override
  String get homeUpgradeBody => 'Bloqueios, metas e análises ilimitados.';

  @override
  String get homeTryFree => 'Teste grátis';

  @override
  String get homePro => 'PRO';

  @override
  String get homeProActive => 'Pausey Pro está ativo';

  @override
  String get homeProActiveBody => 'Tudo liberado. Obrigado pelo apoio!';

  @override
  String get homeNotifications => 'Notificações';

  @override
  String get homeNoNotifications => 'Tudo em dia.';

  @override
  String get homePushLabel => 'Notificações push';

  @override
  String get homeFocusReminder => 'Lembrete diário';

  @override
  String get homeStreakAlerts => 'Alertas de sequência';

  @override
  String get homePwTitle => 'Desbloqueie o Pausey Pro';

  @override
  String get homePwSubtitle => 'Recupere seu foco e vença o vício no celular.';

  @override
  String get homePwMonthly => 'Mensal';

  @override
  String get homePwBilledMonthly => 'Cobrado mensalmente';

  @override
  String get homePwYearly => 'Anual';

  @override
  String get homePwPopular => 'Mais popular';

  @override
  String homePwSave(int pct) {
    return 'Economize $pct%';
  }

  @override
  String homePwBilledYearly(String price) {
    return '$price cobrado por ano';
  }

  @override
  String get homePwLifetime => 'Vitalício';

  @override
  String get homePwBestValue => 'Melhor valor';

  @override
  String get homePwPayOnce => 'Pague uma vez, para sempre';

  @override
  String get homePwPerMonth => '/ mês';

  @override
  String get homePwOnce => 'único';

  @override
  String get homePwStartTrial => 'Teste grátis por 7 dias';

  @override
  String get homePwBuyLifetime => 'Obter acesso vitalício';

  @override
  String get homePwNoCharge => 'Sem cobrança hoje · Cancele quando quiser';

  @override
  String get homePwOneTime => 'Pagamento único · Sem assinatura';

  @override
  String get homePwFree => 'Grátis';

  @override
  String get homePwProCol => 'Pro';

  @override
  String get homePwFeatBlocking => 'Bloqueio ilimitado de apps';

  @override
  String get homePwFeatSessions => 'Todos os modos de foco';

  @override
  String get homePwFeatGoals => 'Metas ilimitadas';

  @override
  String get homePwFeatAnalytics => 'Análises avançadas';

  @override
  String get homePwFeatStreak => 'Proteção de sequência';

  @override
  String get homePwFeatSchedule => 'Agendamento de foco';

  @override
  String get homePwFeatFaceId => 'Bloqueio com Face ID';

  @override
  String get homePwFeatNotif => 'Notificações inteligentes';

  @override
  String homePwMax(int n) {
    return 'máx. $n';
  }

  @override
  String get homePwSecure => 'Pagamento seguro';

  @override
  String get homePwCancelAnytime => 'Cancele quando quiser';

  @override
  String get homePwPrivacyFirst => 'Privacidade primeiro';

  @override
  String get homePwRestore => 'Restaurar compras';

  @override
  String get homePwTerms => 'Termos de serviço';

  @override
  String get homePwPrivacyPolicy => 'Política de privacidade';

  @override
  String get homePwWelcome => 'Bem-vindo ao Pausey Pro!';

  @override
  String get homePwNothingToRestore => 'Nenhuma compra anterior encontrada.';

  @override
  String get homePwRestored => 'Seu acesso Pro está ativo.';

  @override
  String get homePwLinkSoon => 'Esta página abrirá em breve no nosso site.';

  @override
  String get homePwYouArePro => 'Você é Pro — aproveite!';

  @override
  String get homePwClose => 'Fechar';

  @override
  String get homeAvgLegend => 'Média de 7 dias';

  @override
  String homeGoalOf(String done, String goal) {
    return '$done de $goal';
  }

  @override
  String get homeBest => 'Melhor:';

  @override
  String get insightsAnalytics => 'Análises';

  @override
  String get insightsScreenTime => 'Tempo de tela';

  @override
  String get insightsToday => 'Hoje';

  @override
  String get insightsWeek => 'Semana';

  @override
  String get insightsMonth => 'Mês';

  @override
  String get insightsProductivity => 'Pontuação de produtividade';

  @override
  String insightsPts(String delta) {
    return '$delta pts';
  }

  @override
  String get insightsVsLastWeek => 'vs. semana passada';

  @override
  String get insightsVsLastMonth => 'vs. mês passado';

  @override
  String insightsScoreDays(int n) {
    return 'Pontuação de $n dias';
  }

  @override
  String get insightsFocusHours => 'Horas de foco';

  @override
  String get insightsThisWeek => 'esta semana';

  @override
  String get insightsThisMonth => 'este mês';

  @override
  String insightsGoalOf(String done, String goal) {
    return '$done / $goal meta';
  }

  @override
  String get insightsFocusScore => 'Foco';

  @override
  String get insightsGoals => 'Metas';

  @override
  String get insightsConsistency => 'Constância';

  @override
  String get insightsWeeklyFocus => 'Horas de foco semanais';

  @override
  String insightsDailyFocus(int n) {
    return 'Foco diário, últimos $n dias';
  }

  @override
  String insightsBestDay(String day, String time) {
    return 'Melhor dia: $day · $time';
  }

  @override
  String insightsAvgDay(String time) {
    return 'Média $time / dia';
  }

  @override
  String get insightsMonthlyTrends => 'Tendências do mês';

  @override
  String get insightsActual => 'Real';

  @override
  String get insightsGoal => 'Meta';

  @override
  String insightsWk(int n) {
    return 'Sem $n';
  }

  @override
  String insightsWeekBeat(int n, String time) {
    return 'A semana $n superou a meta em $time';
  }

  @override
  String insightsWeekShort(int n, String time) {
    return 'A melhor foi a semana $n, $time abaixo da meta';
  }

  @override
  String get insightsGoalCompletion => 'Metas concluídas';

  @override
  String insightsDaysOf(int done, int total) {
    return '$done/$total dias';
  }

  @override
  String get insightsNoGoals =>
      'Nenhuma meta ainda. Adicione uma para ver seu progresso aqui.';

  @override
  String get insightsManageGoals => 'Gerenciar';

  @override
  String insightsGoalFocus(String hours) {
    return 'Foco diário: $hours horas';
  }

  @override
  String get insightsGoalBlock => 'Bloquear redes sociais';

  @override
  String insightsGoalPomo(int n) {
    return '$n pomodoros por dia';
  }

  @override
  String insightsGoalScreen(String time) {
    return 'Menos de $time de tela';
  }

  @override
  String get insightsGoalPhoneFree => 'Tempo sem celular';

  @override
  String get insightsEmptyBadge => 'Nenhuma sessão ainda';

  @override
  String get insightsEmptyTitle => 'Suas estatísticas começam com uma sessão';

  @override
  String get insightsEmptyBody =>
      'Conclua uma sessão de foco e suas pontuações, gráficos e metas aparecerão aqui.';

  @override
  String get insightsEmptyCta => 'Iniciar sessão de foco';

  @override
  String get insightsDailyUsage => 'Uso diário';

  @override
  String get insightsFocusTime => 'Tempo de foco';

  @override
  String get insightsVsAvg => 'vs. média';

  @override
  String get insightsUsageByDay => 'Uso por dia';

  @override
  String get insightsUsageByWeek => 'Uso por semana';

  @override
  String get insightsUsage => 'Uso';

  @override
  String insightsTrend(int n) {
    return 'Tendência de $n dias';
  }

  @override
  String get insightsImproving => 'Melhorando';

  @override
  String get insightsRising => 'Aumentando';

  @override
  String insightsDaysAgo(int n) {
    return '$n dias atrás';
  }

  @override
  String get insightsMostUsed => 'Apps mais usados';

  @override
  String get insightsAllApps => 'Todos os apps';

  @override
  String get insightsBreakdown => 'Distribuição de uso';

  @override
  String get insightsTotal => 'total';

  @override
  String get insightsNoUsage => 'Nenhum tempo de tela neste período.';

  @override
  String get insightsLockApp => 'Bloquear este app';

  @override
  String insightsLocked(String app) {
    return '$app está bloqueado';
  }

  @override
  String get insightsCatSocial => 'Social';

  @override
  String get insightsCatVideo => 'Vídeo';

  @override
  String get insightsCatGames => 'Jogos';

  @override
  String get insightsCatShopping => 'Compras';

  @override
  String get insightsCatCommunity => 'Comunidade';

  @override
  String get insightsCatOther => 'Outros';

  @override
  String get profileSettings => 'Configurações';

  @override
  String get profileGuestName => 'Convidado';

  @override
  String get profileGuestBadge => 'Convidado · salvo neste celular';

  @override
  String get profileEditName => 'Editar nome';

  @override
  String get profileNameHint => 'Seu nome';

  @override
  String get profileSave => 'Salvar';

  @override
  String profileMemberSince(String date) {
    return 'Membro desde $date';
  }

  @override
  String get profileProActive => 'Pro · Ativo';

  @override
  String get profileFree => 'Plano grátis';

  @override
  String get profileUpgrade => 'Fazer upgrade';

  @override
  String get profileBadges => 'Medalhas';

  @override
  String get profileNoBadges => 'Conclua sessões para ganhar medalhas';

  @override
  String get profileFocusTime => 'Tempo de foco';

  @override
  String get profileGoalsDone => 'Metas cumpridas';

  @override
  String get profileDayStreak => 'Dias seguidos';

  @override
  String get profileAppsBlocked => 'Apps bloqueados';

  @override
  String get profileFocusActivity => 'Atividade de foco';

  @override
  String get profileLast4Weeks => 'Últimas 4 semanas';

  @override
  String get profileRecentActivity => 'Atividade recente';

  @override
  String get profileSessionDone => 'Sessão concluída';

  @override
  String get profileSessionStopped => 'Sessão encerrada antes';

  @override
  String get profileModePomodoro => 'Pomodoro';

  @override
  String get profileModeDeep => 'Trabalho profundo';

  @override
  String get profileModeCustom => 'Personalizado';

  @override
  String get profileJustNow => 'Agora';

  @override
  String profileAgoMinutes(int n) {
    return 'há $n min';
  }

  @override
  String profileAgoHours(int n) {
    return 'há $n h';
  }

  @override
  String get profileYesterday => 'Ontem';

  @override
  String get profileEmptyTitle => 'Nenhuma sessão ainda';

  @override
  String get profileEmptyBody =>
      'Comece sua primeira sessão — atividade, sequência e medalhas aparecem aqui.';

  @override
  String get profileStartFocus => 'Começar';

  @override
  String get profileMyGoals => 'Minhas metas';

  @override
  String get profileStreaks => 'Sequências e medalhas';

  @override
  String get profileSubscription => 'Assinatura';

  @override
  String get profileSignOutTitle => 'Sair?';

  @override
  String get profileSignOutBody => 'Você pode entrar de novo quando quiser.';

  @override
  String get profileSecNotifications => 'Notificações';

  @override
  String get profileSecAppearance => 'Aparência';

  @override
  String get profileSecFocus => 'Foco e bloqueio';

  @override
  String get profileSecPrivacy => 'Privacidade e segurança';

  @override
  String get profileSecAccount => 'Conta';

  @override
  String get profilePush => 'Notificações push';

  @override
  String get profilePushSub => 'Lembretes e alertas';

  @override
  String get profileReminder => 'Lembrete para começar';

  @override
  String profileReminderSub(String time) {
    return 'Todo dia às $time';
  }

  @override
  String get profileStreakAlerts => 'Alertas de sequência';

  @override
  String get profileStreakAlertsSub => 'Antes de perder a sequência';

  @override
  String get profileGoalMilestones => 'Marcos de metas';

  @override
  String get profileGoalMilestonesSub => 'Quando você cumprir uma meta';

  @override
  String get profileDarkMode => 'Modo escuro';

  @override
  String get profileOn => 'Ativado';

  @override
  String get profileOff => 'Desativado';

  @override
  String get profileTextSize => 'Tamanho do texto';

  @override
  String get profileTextSmall => 'Pequeno';

  @override
  String get profileTextMedium => 'Médio';

  @override
  String get profileTextLarge => 'Grande';

  @override
  String get profileTextHuge => 'Muito grande';

  @override
  String get profilePomodoroLen => 'Duração do pomodoro';

  @override
  String get profileBreakLen => 'Duração da pausa';

  @override
  String profileMinutes(int n) {
    return '$n min';
  }

  @override
  String get profileFaceIdUnlock => 'Face ID para desbloquear';

  @override
  String get profileFaceIdUnlockSub => 'Confirmar antes de desbloquear';

  @override
  String get profileBypass => 'Desbloqueio de emergência';

  @override
  String profileBypassSub(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n desbloqueios por dia',
      one: '1 desbloqueio por dia',
    );
    return '$_temp0';
  }

  @override
  String get profileAppLock => 'Bloquear o Pausey com Face ID';

  @override
  String get profileAppLockSub => 'Pedir ao abrir o app';

  @override
  String get profileHideUsage => 'Ocultar dados de uso';

  @override
  String get profileHideUsageSub => 'Ocultar o tempo de tela';

  @override
  String get profileClearData => 'Apagar atividade';

  @override
  String get profileClearDataSub => 'Remove sessões e histórico';

  @override
  String get profileClearTitle => 'Apagar a atividade?';

  @override
  String get profileClearBody =>
      'Todas as sessões e registros de metas deste celular serão apagados. Não dá para desfazer.';

  @override
  String get profileClear => 'Apagar';

  @override
  String get profileCleared => 'Atividade apagada';

  @override
  String get profileExport => 'Exportar meus dados';

  @override
  String get profileExportSub => 'Copiar como JSON';

  @override
  String get profileExported => 'Seus dados foram copiados';

  @override
  String get profileStreaksTitle => 'Sequências';

  @override
  String get profileShare => 'Compartilhar';

  @override
  String profileShareText(int n) {
    return 'Estou há $n dias seguidos focando com o Pausey!';
  }

  @override
  String get profileCopied => 'Copiado';

  @override
  String profileNextMilestone(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n dias',
      one: '1 dia',
    );
    return 'Continue – faltam $_temp0 para o próximo marco!';
  }

  @override
  String get profileAllMilestones => 'Todos os marcos alcançados. Lendário!';

  @override
  String get profileStartStreak =>
      'Conclua uma sessão hoje para começar uma sequência.';

  @override
  String get profileBest => 'Recorde';

  @override
  String get profileThisWeek => 'Esta semana';

  @override
  String profileDaysCompleted(int n) {
    return '$n/7 dias concluídos';
  }

  @override
  String get profileCompleted => 'Concluído';

  @override
  String get profilePartial => 'Parcial';

  @override
  String get profileMissed => 'Perdido';

  @override
  String get profilePrevMonth => 'Mês anterior';

  @override
  String get profileNextMonth => 'Próximo mês';

  @override
  String get profileMilestones => 'Marcos de sequência';

  @override
  String get profileAchievements => 'Conquistas';

  @override
  String get profileAchOnFire => 'Pegando fogo';

  @override
  String get profileAchIronWill => 'Força de vontade';

  @override
  String get profileAchFocusMaster => 'Mestre do foco';

  @override
  String get profileAchMonk => 'Monge digital';

  @override
  String get profileAchLegend => 'Lendário';

  @override
  String get profileAchSpeed => 'Imparável';

  @override
  String profileAchStreakDesc(int n) {
    return '$n dias seguidos';
  }

  @override
  String profileAchSessionsDesc(int n) {
    return '$n sessões concluídas';
  }

  @override
  String profileAchHoursDesc(int n) {
    return '$n h de foco';
  }

  @override
  String profileAchDayDesc(int n) {
    return '$n sessões em um dia';
  }

  @override
  String get navHome => 'Início';

  @override
  String get navBlock => 'Bloquear';

  @override
  String get navFocus => 'Foco';

  @override
  String get navInsights => 'Estatísticas';

  @override
  String get navProfile => 'Perfil';

  @override
  String get unitH => 'h';

  @override
  String get unitM => 'min';

  @override
  String get sampleData => 'Dados de exemplo';

  @override
  String get seeAll => 'Ver tudo';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dias',
      one: '1 dia',
    );
    return '$_temp0';
  }

  @override
  String get statesTitle => 'Estados';

  @override
  String get statesSubtitle => 'Telas de erro, vazias e de carregamento';

  @override
  String get statesNoInternet => 'Sem internet';

  @override
  String get statesConnectionLost => 'Conexão perdida';

  @override
  String get statesOfflineTitle => 'Você está offline';

  @override
  String get statesOfflineMsg =>
      'O Pausey não consegue acessar o servidor agora. Verifique o Wi-Fi ou os dados móveis e tente de novo – seus dados locais estão seguros.';

  @override
  String get statesTryAgain => 'Tentar de novo';

  @override
  String get statesOpenSettings => 'Abrir ajustes';

  @override
  String get statesOfflineMode => 'Modo offline ativo';

  @override
  String get statesLimited => 'Limitado';

  @override
  String get statesAvailable => 'Disponível';

  @override
  String get statesUnavailable => 'Indisponível';

  @override
  String get statesCapSessions => 'Ver sessões anteriores';

  @override
  String get statesCapApps => 'Lista de apps bloqueados';

  @override
  String get statesCapTimer => 'Timer de foco local';

  @override
  String get statesCapSync => 'Sincronizar sequência e metas';

  @override
  String get statesCapAnalytics => 'Atualizar estatísticas';

  @override
  String get statesOfflineNote =>
      'Seus dados de foco ficam no aparelho. Nada se perde offline.';

  @override
  String get statesBackOnline => 'Online de novo – tudo sincronizado';

  @override
  String get statesShowAgain => 'Mostrar de novo';

  @override
  String get statesPermDenied => 'Permissão negada';

  @override
  String get statesPermRequired => 'Permissão necessária';

  @override
  String get statesPermTitle => 'Acesso bloqueado';

  @override
  String get statesPermMsg =>
      'O Pausey precisa de acesso ao Tempo de Uso para bloquear apps. Sem ele, o bloqueio não funciona.';

  @override
  String get statesGrant => 'Permitir acesso';

  @override
  String get statesLearnMore => 'Saiba mais';

  @override
  String get statesLearnMoreMsg =>
      'Com o Tempo de Uso, o Pausey pausa apps que distraem. Seus dados não saem do celular.';

  @override
  String get statesRequiredPerms => 'Permissões necessárias';

  @override
  String get statesPermNotif => 'Notificações';

  @override
  String get statesPermScreenTime => 'Acesso ao Tempo de Uso';

  @override
  String get statesPermUsage => 'Estatísticas de uso';

  @override
  String get statesPermBio => 'Face ID / biometria';

  @override
  String get statesGranted => 'Concedida';

  @override
  String get statesDenied => 'Negada';

  @override
  String get statesPermNote =>
      'Sem Tempo de Uso, o timer funciona, mas não bloqueia apps.';

  @override
  String get statesAccessGranted => 'Acesso concedido – bloqueio pronto';

  @override
  String get statesDataNA => 'Dados indisponíveis';

  @override
  String get statesSyncFailed => 'Falha na sincronização';

  @override
  String get statesLoadTitle => 'Não foi possível carregar';

  @override
  String get statesLoadMsg =>
      'Algo deu errado ao buscar suas estatísticas. Pode ser uma falha temporária – seus dados locais estão intactos.';

  @override
  String get statesRetrySync => 'Sincronizar de novo';

  @override
  String get statesUseCached => 'Usar cache';

  @override
  String get statesErrorDetails => 'Detalhes do erro';

  @override
  String get statesErrorCode => 'Código';

  @override
  String get statesTimestamp => 'Hora';

  @override
  String get statesRetryCount => 'Tentativas';

  @override
  String statesAttempts(int n) {
    return '$n / 3 tentativas';
  }

  @override
  String get statesReport => 'Informar ao suporte';

  @override
  String get statesReported => 'Obrigado – relatório enviado';

  @override
  String get statesCachedNote =>
      'Enquanto isso, os dados da última sincronização estão disponíveis.';

  @override
  String get statesDataLoaded => 'Estatísticas carregadas';

  @override
  String get statesCachedShown => 'Exibindo dados em cache';

  @override
  String statesWeekFocus(String time) {
    return 'Foco nesta semana: $time';
  }

  @override
  String get statesEmpty => 'Estado vazio';

  @override
  String get statesNothingYet => 'Nada ainda';

  @override
  String get statesEmptyTitle => 'Nenhuma sessão ainda';

  @override
  String get statesEmptyMsg =>
      'Comece sua primeira sessão e seu progresso aparecerá aqui.';

  @override
  String get statesStartFocus => 'Começar a focar';

  @override
  String get statesLoadingSection => 'Carregamento';

  @override
  String get statesDashLoading => 'Painel';

  @override
  String get statesAnalyticsLoading => 'Estatísticas';

  @override
  String get statesGoalsLoading => 'Metas';

  @override
  String get statesProfileLoading => 'Perfil';

  @override
  String get statesCrunching => 'Processando seus dados…';

  @override
  String get statesLoadingGoals => 'Carregando suas metas…';

  @override
  String get statesLoadingProfile => 'Carregando seu perfil…';

  @override
  String get statesReplay => 'Repetir';
}
