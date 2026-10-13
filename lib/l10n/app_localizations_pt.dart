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
}
