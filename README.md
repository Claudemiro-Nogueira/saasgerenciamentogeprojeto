
# SaaS Gerenciamento de Projetos


Um aplicativo SaaS (Software como Serviço) para gerenciamento de projetos, desenvolvido em Flutter. O aplicativo permite a criação, organização e acompanhamento de tarefas e projetos em um quadro Kanban, com suporte para autenticação via Firebase, armazenamento de tokens JWT e integração com GraphQL para consultas e mutações.

Link do video: https://youtu.be/JVyG61e28t4
---

## Funcionalidades

- **Quadro Kanban**: Organize tarefas em colunas personalizáveis usando o pacote `appflowy_board` e `flutter_boardview`.
- **Autenticação**: Autenticação de usuários com Firebase Auth (`firebase_auth` e `firebase_core`).

---

## Pacotes Utilizados

- **cupertino_icons: ^1.0.8**: Ícones no estilo Cupertino (iOS).
- **appflowy_board: ^0.1.2**: Para criar quadros Kanban personalizáveis.
- **flutter_boardview: ^0.2.1**: Para visualização de quadros Kanban.
- **flutter_staggered_grid_view: ^0.6.0**: Para exibir tarefas em uma grade dinâmica.
- **flutter_reorderable_list: ^1.2.0**: Para reordenar itens em listas.
- **graphql_flutter: ^5.0.0**: Para integração com APIs GraphQL.
- **provider: ^6.0.0**: Para gerenciamento de estado.
- **shared_preferences: ^2.0.6**: Para armazenamento local de tokens JWT.
- **firebase_auth: ^5.5.0**: Para autenticação de usuários.
- **firebase_core: ^3.12.0**: Para inicialização do Firebase.
- **drag_and_drop_lists: ^0.4.2**: Para funcionalidade de arrastar e soltar.

---

## Como Executar o Projeto

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/Claudemiro-Nogueira/saasgerenciamentogeprojeto.git
   ```

2. **Navegue até o diretório do projeto**:
   ```bash
   cd saasgerenciamentogeprojeto
   ```

3. **Instale as dependências**:
   ```bash
   flutter pub get
   ```

4. **Configure o Firebase**:
   - Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
   - Baixe o arquivo `google-services.json` (para Android) ou `GoogleService-Info.plist` (para iOS) e coloque na pasta correta do projeto.
   - Siga as instruções de configuração do Firebase no [site oficial](https://firebase.flutter.dev/docs/overview).

5. **Execute o aplicativo**:
   ```bash
   flutter run
   ```

