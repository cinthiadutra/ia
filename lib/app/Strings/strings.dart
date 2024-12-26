// ignore_for_file: constant_identifier_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:intl/intl.dart';

class Strings {
  static const validationAmountEmpty = 'Valor está vazio.';
  static const validationBankAccountDigitEmpty = 'Preencha.';
  static const validationBankAccountNumberEmpty = 'Número da conta está vazio.';
  static const validationBankAccountAgencyEmpty = 'Preencha.';
  static const validationEmailEmpty = 'E-mail está vazio.';
  static const hint_email = 'E-mail';
  static const validationEmailInvalid = 'Insira um e-mail válido.';
  static const validationPasswordEmpty = 'Senha está vazia.';
  static const validationCpfEmpty = 'Por favor, preencha esse campo.';
  static const validationErrorCpf = 'CPF Inválido, digite novamente.';
  static const validationPhoneEmpty = 'Preencha número de telefone.';
  static const String label_confirm_account_deletion = 'SIM, EXCLUIR CONTA';
  static const String label_keep_account = 'NÃO, CONTINUAR COM A CONTA';
  static const String info_account_deletion_warning =
      '<center>Ao excluir a sua conta, suas informações de conta são removidas do app Mangos. Desta forma, você perde imediatamente o acesso ao aplicativo e o direito ao acúmulo e resgate de Mangos. ESTA OPERAÇÃO NÃO PODE SER DESFEITA.</center>';
  static const String title_are_you_sure = 'Tem certeza?';
  static const String label_delete_account = 'EXCLUIR CONTA MANGOS';
  static const String label_save = 'SALVAR';
  static const String html_withdrawal_cpf_info =
      'Obs: Para a realização de resgates no aplicativo, será necessário ter uma conta bancária. <a href="mangos://faq?id=360044561951">Saiba mais</a>.';
  static const String info_accept_contact =
      'Sim, quero receber informações e novidades via e-mail, telefone ou endereço.';
  static const String hint_phone_number = 'Número do telefone celular';
  static const String label_phone = 'TELEFONE CELULAR *';
  static const String hint_complement = 'Digite complemento';
  static const String label_complement = 'COMPLEMENTO';
  static const String hint_number = 'Digite o n°';
  static const String label_number = 'NÚMERO *';
  static const String hint_address_registration = 'Digite seu endereço';
  static const String label_address_registration = 'ENDEREÇO *';
  static const String hint_city = 'Cidade';
  static const String label_city = 'CIDADE *';
  static const String label_uf = 'UF *';
  static const String hint_uf = 'UF';
  static const String hint_cep = 'Números';
  static const String label_cep = 'CEP *';
  static const String contact = 'Contato';
  static const String hint_gender = 'Gênero';
  static const String label_gender = 'GÊNERO';
  static const String label_birthday = 'DATA DE NASCIMENTO';
  static const String label_birthday_required = 'DATA DE NASCIMENTO *';
  static const String hint_birthday = 'dd/mm/aaaa';
  static const String hint_type_your_cpf = 'Digite seu CPF';
  static const String label_cpf = 'CPF *';
  static const String label_email_required = 'E-MAIL *';
  static const String hint_type_your_name = 'Nome completo';
  static const String info_required_fields = '*Campos obrigatórios';
  static const String info_required_fields_attacks =
      '*Para finalizar o cadastro você precisa anexar os seguintes documentos';
  static const String title_personal_data = 'Dados pessoais';
  static const String title_register_vehicle = 'Dados do veículo ';

  static const String info_verify_profile_for_sms_validation =
      'Para que a validação seja feita, confira se seu telefone está cadastrado corretamente.';
  static const String error_address = 'Endereço obrigatório';
  static const String error_empty_uf = 'Estado é obrigatório';
  static const String error_empty_city = 'Cidade é obrigatória';
  static const String error_city_not_included =
      'Selecione uma das cidades sugeridas';
  static const String title_profile = 'Cadastro';
  static const String title_register_account_bank = 'Cadastro conta bancária ';

  static const String title_profile_edit = 'Perfil';
  static const String gender_choose = 'Gênero';
  static const String gender_female = 'Feminino';
  static const String gender_male = 'Masculino';
  static const String re_email =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String re_phone = r'^\(\d{2}\)\d{4,5}-\d{4}$';
  static const String re_password = r'(?:\d.*[a-zA-Z]|[a-zA-Z].*\d)';
  static const String re_name =
      r"[A-Za-zÀ-ÖØ-öø-ÿ0-9']+\s+[A-Za-zÀ-ÖØ-öø-ÿ0-9']+";
  static const String re_date = r'(\d{2})/(\d{2})/(\d{4})';
  static const String re_cpf = r'^\d{11}$';
  static const String re_cnpj = r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$';
  static const String label_cancel = 'CANCELAR';
  static const String label_force_reset = 'DEFINIR SENHA';
  static const String info_login_reset_force =
      'Este email foi utilizado para criar uma conta com %s. Ao definir uma senha, não será mais possível fazer auth com esse método. Deseja prosseguir?';
  static const String message_reset_email_sent =
      'Enviamos um e-mail com o link para alteração de senha. Siga o link para cadastrar uma nova senha.';
  static const String title_attention = 'Atenção';
  static const String title_attention_bang = 'Atenção!';
  static const String label_submit = 'ENVIAR';
  static const String info_password_reset_instructions =
      'Digite seu e-mail para que possamos enviar um link para alteração de sua senha';
  static const String title_reset_password = 'Redefinir sua senha';
  static const String label_sign_up_with_facebook =
      'Registre-se com o Facebook';
  static const String label_sign_up_with_google = 'Registre-se com o Google';
  static const String title_register_with =
      'AGILIZE O SEU CADASTRO USANDO OS SERVIÇOS ABAIXO:';
  static const String hint_confirm_your_password = 'Confirme sua senha';
  static const String hint_type_your_password = 'Digite sua senha';
  static const String label_email_confirmation = 'CONFIRME SEU E-MAIL';
  static const String title_create_account = 'Crie sua conta';
  static const String html_app_bar_help = '<a href="#">Ajuda</a>';
  static const String label_name = 'NOME *';
  static const String re_not_number = r'[^\d]';
  static NumberFormat formatTwoDecimals = NumberFormat('0.00');
  static const String title_log_in = 'Acesse sua conta';
  static const String label_password = 'SENHA';
  static const String label_confirm_password = 'CONFIRME SUA SENHA';
  static const String label_change_password = 'ALTERAR SENHA';
  static const String label_new_password = 'NOVA SENHA';
  static const String label_current_password = 'SENHA ATUAL';
  static const String label_continue = 'CONTINUAR';
  static const String label_ok = 'OK';

  static const String label_enter = 'ENTRAR';
  static const String hint_type_your_email = 'Informe seu e-mail';
  static const String hint_confirm_your_email = 'Confirme seu e-mail';
  static const String label_email = 'E-MAIL';
  static const String label_login_with_facebook = 'Continuar com o Facebook';
  static const String label_login_with_google = 'Continuar com o Google';
  static const String hint_password = 'Senha';
  static const String hint_recovery_password = 'Esqueci minha senha';
  static const String error_password_too_weak =
      'Ops! sua senha precisa de força (Números, letras maiusculas e minusculas \ne Carácteres especiais: "! @ # \$ % ^ & *")';

  static const String error_email = 'Digite um e-mail válido';
  static const String error_email_confirmation =
      'E-mails digitados não são iguais.';
  static const String error_password_too_short =
      'A senha deve ter pelo menos 8 caracteres';
  static const String error_password_format =
      'A senha deve conter letras e números';
  static const String error_empty_password = 'Digite sua senha';
  static const String error_password_mismatch =
      'A confirmação da senha é diferente da senha';
  static const String error_product_scanned =
      'Você deve ler o CUPOM FISCAL ou NOTA FISCAL da compra!';
  static const String error_name = 'Digite seu nome completo';
  static const String error_birthday = 'Data inválida';
  static const String error_under18 = 'Menor de 18 anos';
  static const String error_over118 = 'Mais de 118 anos';
  static const String error_cpf = 'CPF inválido';
  static const String error_phone = 'Número de telefone inválido';
  static const String error_gender = 'Selecione um gênero';
  static const String error_cep = 'Digite um cep válido';
  static const String error_empty_number = 'Número obrigatório';
  static const String error_invalid_number = 'Número inválido';
  static const String error_select_state_first = 'Selecione um estado';
  static const String error_cpf_already_used =
      'O CPF informado já está vinculado a outra conta Mangos. Se você cadastrou seu CPF em outra conta, deverá utilizá-la no lugar desta.';
  static const String error_cpf_already_used_pt1 =
      'O CPF que informou para nós já está cadastrado em outra conta,';
  static const String error_cpf_already_used_pt2 =
      ' por favor, tente entrar no aplicativo usando a conta já cadastrada ou recupere a senha.';
  static const String error_cpf_already_used_pt3 =
      '\n\nCaso tenha esquecido a senha,';
  static const String error_cpf_already_used_pt4 =
      ' clique aqui para alterar a senha.';
  static const String error_cpf_already_used_pt5 =
      'Opa, esse CPF já foi cadastrado!';
  static const String error_cpf_already_used_short =
      'CPF vinculado a outra conta.';
  static const String error_profile_not_found = 'Perfil não encontrado';
  static const String error_daily_receipts_exceeded =
      'Você pode enviar no máximo %d cupons por dia e %d por semana. Aguarde até amanhã para enviar mais cupons.';
  static const String error_weekly_receipts_exceeded =
      'Você pode enviar no máximo %d cupons por semana. Aguarde até a próxima segunda-feira para enviar mais cupons.';
  static const String error_sending_receipt =
      'Um erro ocorreu ao enviar o cupom. Tente novamente.';
  static const String error_receipt_already_sent =
      'Este cupom fiscal já foi enviado.';
  static const String error_cnpj_invalid =
      'O CNPJ que está no cupom fiscal não é válido. Por favor, verifique e tente novamente.';
  static const String error_access_key_invalid =
      'O número da nota fiscal (chave numérica) não é válido. Por favor, verifique e tente novamente.';
  static const String error_detected_access_key_invalid =
      'A chave de acesso detectada é inválida.';
  static const String error_invalid_barcode =
      'O código escaneado não parece ser de um cupom fiscal válido';
  static const String error_invalid_barcode_new =
      'O código de barras que foi escaneado não é válido. Por favor, tente outro cupom fiscal ou escaneie novamente seguindo as dicas abaixo: \n\n Os cupons não podem estar amassados, rasgados ou em mau-estado e devem ser escaneados em um ambiente claro. ';
  static const String error_unsupported_state =
      'Ainda não estamos aceitando cupons fiscais desse estado. Mas fique atento, pois estamos trabalhando para ampliar nossa cobertura!';
  static const String error_no_geocode_results =
      'O endereço informado não foi encontrado.';
  static const String error_device_location_not_found =
      'Não foi possível determinar sua localização.';
  static const String error_account_not_found =
      'A conta não foi encontrada. Entre em contato com o suporte.';
  static const String error_insufficient_funds = 'Saldo insuficiente.';
  static const String error_unknown_error = 'Erro desconhecido.';
  static const String error_withdrawal_account_not_selected =
      'Selecione uma conta para saque.';
  static const String error_bank = 'Selecione o banco';
  static const String error_branch =
      'Preencha o número da agência corretamente';
  static const String error_account = 'Preencha o número da conta corretamente';
  static const String error_account_type = 'Selecione o tipo de conta.';
  static const String error_same_cpf =
      'Confirme que a conta pertence ao mesmo CPF desta conta Mangos.';
  static const String error_choose_subject =
      'Selecione o assunto do seu contato';
  static const String error_type_message = 'Digite sua mensagem';
  static const String error_type_message_device_old =
      'Informe o modelo do celular anterior';
  static const String error_type_message_device_new =
      'Informe o modelo do novo celular';

  static const String error_type_message_cpf = "Informe o CPF.";
  static const String error_type_message_birthday =
      "Informe á data de nascimento";

  static const String error_withdrawal_generic =
      'Tivemos um problema com a sua transferência! Verifique o nome, CPF, números e dígitos da agência e conta e tente novamente.';
  static const String error_camera_path_not_found =
      'Erro ao determinar caminho do diretório temporário.';
  static const String error_could_not_launch_rating_url =
      'Não foi possível acessar a loja de aplicativos.';
  static const String error_must_acknowledge_expiring_points =
      'Confirme que você está ciente sobre a validade dos mangos.';
  static const String error_no_password_for_user =
      'O email informado não possui uma senha cadastrada. É possível que você tenha feito auth com sua conta do Google ou Facebook.';
  static const String error_unknown_datasource = 'Tipo de query desconhecido.';
  static const String error_version_deprecated =
      'Esta versão do Mangos não é mais suportada. Atualize seu app para continuar aproveitando nossos cashbacks!';
  static const String error_version_warning =
      'Esta versão do Mangos deixará de funcionar em breve. Atualize seu app para continuar aproveitando nossos cashbacks!';
  static const String error_apple_sign_in_ios_version =
      'Para entrar no aplicativo com uma conta Apple, é necessário ter um iPhone com iOS versão 13 ou superior, e seu iPhone parece ter uma versão de iOS inferior. Por favor, tente entrar no aplicativo através de outra opção.';
  static const String error_email_verification_request =
      'Detectamos um erro no envio do email de confirmação. Tente novamente em alguns minutos.';
  static const String error_facebook_login =
      'Erro ao realizar auth com Facebook.';
  static const String error_no_items_found = 'Nenhum item encontrado';
  static const String error_invalid_amount = 'Valor não aceito';
  static const String error_amount_exceed_balance =
      'Valor superior ao seu saldo';
  static const String error_amount_less_than_required =
      'Valor menor que o mínimo necessário para esse tipo de saque';
  static const String error_amount_more_than_allowed =
      'Valor superior ao máximo permitido para esse tipo de saque';
  static const String error_create_zendesk_request =
      'Erro ao criar o seu chamado, por favor tente mais tarde!';

  static const String message_lavagem_cesto =
      'Somos uma lavanderia de Self-Service onde você mesmo(a) pode lavar e secar suas roupas. Basta adquirir as fichas e em cerca de 70 minutos você terá roupas limpas e prontas para serem usadas.';
  static const String title_lavagem_cesto = "Lavagem por Cesto";

  static const String title_lavagem_peca = "Lavagem por Peça ";
  static const String message_lavagem_peca =
      'A lavagem por peça é ideal para itens maiores como edredons, cortinas, tapetes, etc. Você pode deixar sua peça para ser lavada em nosso estabelecimento e buscar no prazo combinado.';

  static const String label_validate = "REGISTRAR";

  static const String label_cnpj = "MEI";
  static const String hint_type_your_cnpj = "Digite seu MEI";

  static const String label_cnh = "CNH";
  static const String hint_type_your_cnh = "Digite sua CNH";
  static const String register_vehicle = "Cadastrar Veículo";
  static const String label_marca = "Marca";
  static const String hint_type_your_marca = "Qual á marca?";
  static const String label_your_model = "Modelo";
  static const String hint_type_your_model = "Qual o modelo?";

  static const String label_placa = "Placa";

  static const String hint_type_your_placa = "Informe á placa";

  static const String hint_type_your_cor = "Informe á cor";

  static const String label_cor = "Cor";

  static const String label_name_property = "Nome do propiretário";
  static const String hint_type_name_property = "Nome do proprietário";

  static const String label_cpf_property = "CPF do propiretário";
  static const String hint_type_your_cpf_property = "CPF do proprietaário ";

  static const String next = "PROXIMO";

  static const String title_register_attacks = "Anexe os documentos";

  static const String finish_register = "Finalizar Cadastro";

  static const String finish_register_button = "FINALIZAR CADASTRO";

  static var menu_settings;
  static const String hint_type_number_renavan = "Qual o número do renavan?";
  static const String label_number_renavan = "Renavan";
  static const String vehicles_registered = "Veículos cadastrados";
  static const String register_account_bank = "REGISTAR CONTA BANCÁRIA";
  static const String title_account_data = "Dados da conta";
  static const String label_name_bank = "Nome do banco";
  static const String hint_type_your_name_bank = "Nome do banco";
  static const String label_number_bank = "Número da conta";
  static const String hint_type_your_number_bank = "Número da conta";
  static const String label_agency_bank = "Agência";
  static const String hint_type_your_agency_bank = "Agência";
  static const String hint_type_your_account = "Tipo da conta";
  static const String label_type_account = "Tipo da conta";
  static const String label_type_title_account = "Titular da conta";
  static const String hint_type_your_title_account = "Titular da conta";
  static const String account_registered = "Conta bancária registrada";

  static const String neighborhood = "bairro";
  static const String city = "cidade";
  static const String state = "estado";
  static const String zip_code = 'cep';

  static const String number = "numero";

  static const String complement = 'complemento';

  static const String street = 'rua';

  static const String residence_url = 'url';
  static const String label_neighboard = 'BAIRRO*';

  static const String label_key_pix = 'Cole sua chave*';
  static const String hint_type_key_pix = 'chave pix';

  static const String login = 'Login';
  static const String hint_repeat_password = 'Repetir senha';

  static String alert_register =
      'Sua senha deverá conter pelo menos 6 dígitos, uma letra maiúscula, um símbolo e um número.';
  static String alert_register2 =
      'Trata-se apenas de uma Simulação produzida com as informações médias repassadas reais, assim como a aprovação do empréstimo, estão sujeitos aos critérios e à análise de crédito de cada organização.';
  static String alert_body_register =
      'Suas informações são necessárias pra criar a conta e estão seguros com a gente.';

  static String alert_register_example = 'Exemplo: Abc#13';

  static String label_register = 'Nova conta';
  static String title_lorem = 'Lorem Ipsum dolor';
  static String t_lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.';
  static String body_lorem =
      'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.';
  static String label_authentication = 'Autenticação';
  static String label_instruction_authenticating =
      'Um código de números foi enviado para o seu email, insira o código no campo abaixo.';
  static String hint_code_authentication = 'Código de autenticação';
  static String hint_resend_code = 'Reenviar código';
  static String hint_value_solicited = 'Insira o valor pretendido';
  static String hint_value_enable = 'Informe o saldo disponível';
  static String hint_value_data = 'DD/MM/AAAA';

  static String instruction_authentication =
      'Você poderá pedir outro código em';
  static String hint_new_password = 'Nova senha';
  static String hint_new__repeat_password = 'Repetir nova senha';
  static String title_init =
      "Rorem ipsum dolor sit,amet,consectetur adipiscing elit.";
  static const String error_password_confirmation =
      'As senhas digitadas não são iguais.';
  static const String welcome = 'Seja bem-vindo(a)';
  static const String whats_number = 'Qual é seu numero';
  static const String confirm_number = 'Confirme seu numero';
  static const String read_terms_of_user = 'Leia os nossos Termos de Uso';
  static const String need_your_doc = 'Precisamos do seu\ndocumento';
  static const String need_your_doc_body =
      'Para concluir a validação, por favor, informe seu número de CPF';

  static const String phone_onboarding =
      'Precisamos do seu número de celular para garantir sua segurança e privacidade .';
  static const String terms_accepted =
      "Eu estou ciente e aceito os termos acima";

  static const String insert_doc = "Insira o numero do seu documento";
  static const String number_cel = "Número do seu celular";
  static const String insert_email = "Redefinir senha";
  static const String video_view = "Eu não desejo ver o video novamente";
  static const String insert_email_renew =
      "Por favor, insira o email associado á sua conta para receber as instruções de redefinição de senha";

  static const String body_onboarding =
      'Bem-vindo(a) ao BKOPEN MARKETPLACE! Para garantir sua segurança e uma experiência personalizada, precisamos validar algumas informações básicas. Confirme seu número de telefone e CPF para acessar todos os recursos do nosso aplicativo. É rápido e simples!';

  static String title_init1 =
      "Um hub com um mundo de produtos e serviços financeiros.";
  static String title_init2 = "Acompanhamento e contratação sem burocracia.";
  static String title_init3 =
      "Agilidade no fluxo de informações entre os atores do nosso ecossistema.";
  static String title_init4 =
      "Independência na escolha da instituição preferida.";
  static String title_init5 =
      "Ação de especialistas quando surgirem impedimentos.";

  static String terms_bk =
      "A PLATAFORMA BKOPEN MARKETPLACE é propriedade da BKOPEN MARKETPLACE S.A., inscrita no CNPJ/MF sob o nº 01.121.495/0001-70.\n\nNeste Termo de Uso, as referências a “PLATAFORMA”, “COMPANHIA” e “BKOPENMARKETPLACE” se referem a PLATAFORMA BKOPENMARKETPLACE e visitante ou “USUÁRIO” se referem a qualquer pessoa (física ou jurídica) que acesse e/ou use esta PLATAFORMA.\n\nEste Termo de Uso define os direitos e obrigações tanto da PLATAFORMA como do visitante ou USUÁRIO, envolvidos durante o acesso e uso da PLATAFORMA e dos serviços oferecidos.\nO acesso e o uso da PLATAFORMA estão sujeitos a este Termo de Uso e da respectiva Política de Privacidade; por isso, o visitante ou USUÁRIO deve lê-los previamente na sua íntegra.\n\nAo acessar e usar a PLATAFORMA, o visitante ou USUÁRIO aceita todas as condições deste Termo de Uso e da Política de Privacidade. Caso o visitante ou USUÁRIO não concorde com alguma condição desses documentos, o acesso e o uso da PLATAFORMA devem ser interrompidos imediatamente. A COMPANHIA se reserva o direito de alterar esses documentos a qualquer momento, sem aviso prévio, sendo que as novas versões passarão a vigorar a partir do momento em que forem postadas na PLATAFORMA. Assim, o visitante ou USUÁRIO deve ler esses documentos sempre que entrar na PLATAFORMA.\n\nA PLATAFORMA tem como objetivo informar condições e permitir a simulação, cotação e contratação de serviços e produtos das Instituições Financeiras parceiras para os nossos USUÁRIOS./n A BKOPENMARKETPLACE somente recebe ou coleta os seguintes tipos de informações relacionadas ao visitante ou USUÁRIO: \n\n(1) informações de navegação; \n\n(2) informações de cadastro; \n\n(3) informações bancárias conforme descrito na sua Política de Privacidade.\n\n O nosso principal objetivo é gerar conveniência ao nosso USUÁRIO no seu processo de avaliação e contratação desses serviços e produtos.\n Com o preenchimento de apenas um cadastro ou proposta o USUÁRIO poderá receber respostas de uma ou mais instituições financeiras seguradoras ou empresas de consórcio parceiras da BKOPENMARKETPLACE podendo comparar as respostas recebidas e contratar aquela que apresentar a condição que ache mais conveniente restando certo que a PLATAFORMA não garante ao USUÁRIO sucesso de aprovação ou contratação e também que a BKOPEN não coparticipa junto com as instituições financeiras da análise e da decisão de contratação não tendo qualquer responsabilidade portanto sobre tal contratação seja durante a análise seja após ela ser efetivada.Ao preencher os dados e anexar os documentos solicitados pela PLATAFORMA, o USUÁRIO sempre deverá prezar pela veracidade e exatidão dos mesmos, sabendo que poderá responder civil ou criminalmente por informações indevidas ou equivocadas.\n\n O USUÁRIO autoriza a PLATAFORMA e seus parceiros a consultar informações adicionais sobre o próprio em fontes de natureza diversa e a realizar contatos telefônicos com o próprio ou com terceiros por ele indicados.\n O USUÁRIO autoriza a COMPANHIA a usar estes dados e documentos para realizar avaliação do Perfil de Crédito, confirmar a veracidade das informações prestadas e para outros usos necessários à prestação dos produtos e serviços oferecidos. O USUÁRIO autoriza a COMPANHIA a compartilhar os dados e documentos necessários para realizar o serviço oferecido com seus parceiros (Instituições Financeiras e parceiros operacionais).\nA COMPANHIA não é responsável por acesso e uso de informações fraudulentas por parte de terceiros em seu nome, tais como, mas não somente, falsidade ideológica.\n\nA COMPANHIA poderá colher e armazenar informações de IP, site de origem, data e hora da visita, atividade, navegador e sistema operacional.\n\n A COMPANHIA não vende, cede, comunica ou transmite os dados e documentos dos visitantes ou USUÁRIOS para qualquer terceiro que não seja envolvido diretamente com a prestação do serviço oferecido.\n\nA COMPANHIA administra e guarda as suas informações de forma segura e sigilosa. Entretanto, em casos excepcionais, como para cumprimento de determinações judiciais dentro da lei em vigor, por solicitação de autoridades públicas ou em situação potencial de venda parcial ou total da empresa poderemos vir a ser obrigados a disponibilizar essas informações.\n\nA COMPANHIA poderá realizar com critério próprio e de forma isenta uma avaliação das informações, documentos e referências prestadas pelo USUÁRIO ou obtidas adicionalmente para definição do “Perfil do USUÁRIO” que corresponde a uma qualificação da PLATAFORMA quanto ao seu perfil de risco.\n\n Neste caso a PLATAFORMA associará o Perfil do USUÁRIO a uma faixa de taxas de juros praticadas nos empréstimos oferecidos pelas instituições financeiras para ampliar a probabilidade do USUÁRIO ter sua solicitação aprovada. \nEsse critério de avaliação poderá ser revisto a qualquer momento o que poderá implicar em alteração do Perfil do USUÁRIO sem aviso prévio.\n\n A COMPANHIA não é obrigada a divulgar nenhum detalhe do seu critério de avaliação. Pela avaliação e uso do Perfil a COMPANHIA não poderá ser responsabilizada civil ou criminalmente nem tampouco estar sujeita a indenização ou ressarcimento por solicitação do USUÁRIO ou terceiro.\n O Perfil corresponde apenas a uma estimativa sobre a faixa mais provável de ofertas de taxas de juros ou outros parâmetros que o USUÁRIO receberá das Instituições Financeiras parceiras e por ser uma estimativa não garante que o USUÁRIO terá sua demanda aprovada tampouco nas condições estimadas pela PLATAFORMA.Para efeito de avaliação da qualidade da PLATAFORMA e do serviço prestado o USUÁRIO nos autoriza a contatá-lo diretamente.\n\nO conteúdo da PLATAFORMA (códigos fonte, base de dados, processos, domínios, marcas, logotipos etc.) envolvido na funcionalidade e na prestação de serviço é de propriedade da BKOPENMARKETPLACE e é protegido por leis nacionais e internacionais de propriedade.\n A reprodução total ou parcial deste conteúdo e o uso sem autorização da BKOPENMARKETPLACE são expressamente proibidos e sujeitos a penalidades nos termos da Lei. É permitida entretanto a colocação do link para a nossa PLATAFORMA em outros sites de internet.\nO nosso objetivo é proporcionar um acesso ininterrupto à PLATAFORMA mas não damos garantia quanto a essa disponibilidade e nos reservamos o direito de suspender, restringir ou cancelar o acesso à PLATAFORMA a qualquer momento.O USUÁRIO não poderá usar a PLATAFORMA através de qualquer recurso não humano como software automatizado, processo, programa, robô, entre outros.Não nos responsabilizamos pelos serviços prestados por terceiros, incluindo as Instituições Financeiras parceiras, após o USUÁRIO ser a eles direcionado através dos links contidos na PLATAFORMA o que ocorrerá por conta e risco do USUÁRIO, ciente inclusive que os sites direcionados serão regidos pelos próprios Termos de Uso e Políticas de Privacidade destes sites, os quais deverão ser lidos pelo USUÁRIO. \nO USUÁRIO será o único responsável por entender os termos e condições de contratação dos produtos e serviços que serão ofertados a partir das simulações realizadas na PLATAFORMA.\n\n A BKOPENMARKETPLACE não poderá ser responsabilizada por qualquer perda ou dano que o USUÁRIO possa incorrer com essas contratações.\nEste Termo de Uso foi definido de acordo com o Código Civil Brasileiro e a Lei nº 13.709/2018 (Lei Geral de Proteção de Dados – LGPD).\nA relação entre a BKOPEN e as Instituições Financeiras, seus parceiros e usuários será regida pelo Código Civil, sob a forma de contrato atípico, cabendo ao agente bancário aderir ao contrato por esta estipulado e, em especial, a Lei Complementar nº 105, de 10/01/2001, que impõe o sigilo de todas as informações de natureza bancária, devendo, entrementes, ser observado o disposto no artigo 1º, parágrafo 3º, inciso V desse diploma legal, que dispõe não constituir violação do dever de sigilo a revelação de informações sigilosas com o consentimento expresso dos interessados.\n\nFica eleito o foro Comarca da Capital do Estado do Rio de Janeiro para dirimir e julgar qualquer questão relativa a este Termo de Uso e sobre a relação entre a COMPANHIA e o USUÁRIO, excluído qualquer outro, por mais privilegiado que seja.";

  static String politica_bk =
      'A PLATAFORMA BKOPEN MARKETPLACE, de propriedade da BKOPEN MARKETPLACE S/A, inscrita no CNPJ/MF sob o nº 52.729.887/0001-57, respeita a privacidade dos visitantes e usuários ("USUÁRIOS") e está comprometida com a proteção dos dados pessoais coletados. Esta Política de Privacidade descreve como coletamos, utilizamos, compartilhamos, protegemos e gerenciamos suas informações.\n\n 1. Coleta de Informações\n\nColetamos informações para fornecer e melhorar nossos serviços, incluindo:\nA. Informações de Navegação:\n*    Dados de IP\n*    Site de origem\n    * Data e hora da visita\n    * Atividade na plataforma\n    * Navegador e sistema operacional\n\nB. Informações de Navegação:\n    * Nome completo\n    * Endereço de e-mail\n    * Número de telefone\n    * Dados pessoais fornecidos no processo de cadastro\n\nC. Informações Bancárias:\n    * Dados de conta bancária\n    * Informações financeiras necessárias para simulações e cotações\n\n1. Uso das Informações\n    Utilizamos suas informações para:\n    * Prestar Serviços: Gerar simulações, cotações e permitir a contratação de produtos financeiros.\n    * Melhorar a Plataforma: Analisar como você utiliza a PLATAFORMA para aprimorar nossos serviços.\n    * Comunicação: Enviar atualizações, notificações e responder a consultas.\n    * Segurança: Proteger nossos usuários e a PLATAFORMA contra fraudes e atividades maliciosas.\n    * Perfil de Crédito: Realizar avaliações de crédito e confirmar a veracidade das informações fornecidas.\n\n 1. Compartilhamento de Informações\n    Compartilhamos suas informações somente com:\n    * Parceiros Financeiros: Instituições financeiras, seguradoras e empresas de consórcio para oferecer os serviços solicitados.\n    * Prestadores de Serviços: Terceiros contratados para apoiar a operação da PLATAFORMA (e.g., hospedagem de dados, análise de dados).\n    * Autoridades Legais: Em cumprimento a determinações judiciais ou solicitações de autoridades competentes.\n\n 1. Proteção das Informações\n    Adotamos medidas de segurança para proteger suas informações, incluindo:\n    * Criptografia: Uso de tecnologia SSL para transmissão de dados.\n    * Controle de Acesso: Restrições de acesso a dados pessoais apenas a funcionários autorizados.\n* Armazenamento Seguro: Hospedagem em servidores seguros com monitoramento constante.\n\n 1. Quem Terá Acesso\n    Acesso às suas informações será restrito a:\n    * Funcionários Autorizados: Somente funcionários da BKOPEN FINANCIAL INTELLIGENCE com necessidade operacional terão acesso aos seus dados.\n    * Parceiros e Prestadores de Serviços: Terceiros que necessitam dos dados para fornecer os serviços contratados, sob acordos de confidencialidade e conforme as diretrizes da LGPD.\n\n 1. Hierarquia de Acesso: Implementamos uma hierarquia de acessos baseada em níveis de necessidade operacional. Cada grupo de funcionários tem acesso apenas às informações necessárias para o desempenho de suas funções. Esse acesso é regularmente auditado para garantir conformidade e segurança.\n\n2. Tempo de Armazenamento\n    Reteremos suas informações pessoais apenas pelo tempo necessário para cumprir os propósitos descritos nesta Política de Privacidade, ou conforme exigido por lei, incluindo:\n    * Dados de Cadastro e Navegação: Mantidos enquanto você for um usuário ativo e por até 5 anos após o encerramento da conta, conforme exigências legais para resolução de disputas e cumprimento de auditorias.\n    * Informações Bancárias: Mantidas pelo período necessário para a realização das simulações e contratações, e posteriormente armazenadas de forma segura pelo período exigido por leis financeiras e fiscais.\n\n 1. Gestão de Exclusão: Implementamos alertas automáticos para notificar quando os dados atingem o prazo de retenção predefinido. Esses alertas garantem que as informações sejam revisadas e excluídas conforme necessário, em conformidade com a LGPD.\n\n2. Direitos dos Usuários\n    Os USUÁRIOS têm o direito de:\n    * Acesso: Solicitar uma cópia dos dados pessoais que possuímos.\n    * Correção: Solicitar a correção de dados pessoais incorretos ou incompletos.\n    * Exclusão: Solicitar a exclusão dos dados pessoais, sujeitos a obrigações legais de retenção.\n    * Restrição de Processamento: Solicitar restrições ao processamento de seus dados pessoais.\n\n1. Transferência Internacional de Dados: Seus dados podem ser transferidos e armazenados fora do Brasil, em países que possuam leis de proteção de dados adequadas.\n\n2. Alterações nesta Política de Privacidade: Podemos atualizar esta Política de Privacidade periodicamente. Notificaremos sobre quaisquer mudanças significativas através da PLATAFORMA ou por outros meios apropriados.\n\n3. Contato: Para questões ou solicitações relacionadas à privacidade de dados, entre em contato conosco através do e-mail: contato@bkopen.com\n\n4. Disposições Gerais: Esta Política de Privacidade está em conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/2018) e outras legislações aplicáveis. Fica eleito o foro da Comarca da Capital do Estado do Rio de Janeiro para dirimir quaisquer questões relacionadas a esta Política de Privacidade.\n';
}
