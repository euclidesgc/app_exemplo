# Arquitetura do App

Este documento apresenta uma visão geral da arquitetura utilizada neste aplicativo e oferece um tutorial passo a passo para que novos desenvolvedores possam dar manutenção no sistema facilmente.

## Visão Geral

O app segue uma arquitetura modular inspirada na Clean Architecture, integrando o padrão Bloc/Cubit para o gerenciamento de estado. Essa abordagem permite que cada módulo opere de forma independente, promovendo escalabilidade, manutenção facilitada e testes mais robustos. As rotas são gerenciadas centralmente, garantindo uma navegação organizada em toda a aplicação.

## Estrutura do Projeto

A estrutura do projeto é a seguinte:

├── app_providers.dart
├── app_router.dart
├── app_widget.dart
├── main.dart
└── modules
    └── featurexpt_module
        ├── featurexpt_module.dart
        ├── data
        │   └── featurexpt_repository.dart
        ├── domain
        │   ├── entities
        │   │   └── featurexpt_entity.dart
        │   └── use_cases
        │       └── get_featurexpt_use_case.dart
        └── presentation
            ├── featurexpt_details
            │   ├── cubit
            │   │   ├── featurexpt_details_cubit.dart
            │   │   └── featurexpt_details_state.dart
            │   └── featurexpt_details_page.dart
            └── featurexpt_list_page
                ├── cubit
                │   ├── featurexpt_list_cubit.dart
                │   └── featurexpt_list_state.dart
                └── featurexpt_list_page.dart

## Requisitos para Execução

Antes de executar este projeto localmente, certifique-se de que você possui os seguintes requisitos instalados:

1. **Flutter SDK**:
   - Certifique-se de que o Flutter está instalado e configurado corretamente.
   - Versão mínima recomendada: `3.7.2`.
   - [Guia de instalação do Flutter](https://docs.flutter.dev/get-started/install).

2. **Dart SDK**:
   - Incluído com o Flutter, mas certifique-se de que está atualizado.

3. **Editor de Código**:
   - Recomendado: [Visual Studio Code](https://code.visualstudio.com/) com as extensões:
     - Flutter
     - Dart

4. **Dispositivo para Execução**:
   - Emulador Android/iOS configurado ou dispositivo físico conectado.
   - Certifique-se de que o dispositivo tem as permissões necessárias para depuração.

5. **Dependências do Projeto**:
   - Execute o comando abaixo para instalar as dependências do projeto:
     ```bash
     flutter pub get
     ```

6. **Outros Requisitos**:
   - Certifique-se de que o ambiente de desenvolvimento possui as ferramentas necessárias para compilar o código, como:
     - Android Studio (para configurar o SDK do Android e emuladores).
     - Xcode (para desenvolvimento em iOS, apenas em macOS).

Após garantir que todos os requisitos estão atendidos, siga as instruções abaixo para executar o projeto.

## Como Incluir um Novo Módulo

1. Crie uma nova pasta dentro de `/modules` com o nome do módulo desejado. No exemplo acima, featurexpt.
2. Dentro da nova pasta, crie as seguintes subpastas e arquivos conforme necessário:
   - Módulo principal: {nome_module}.dart
   - data: para repositórios e fontes de dados.
   - domain:
     - entities: para as entidades do módulo.
     - use_cases: para as regras de negócio e lógica.
   - presentation: para telas e gerenciamento de estado.
     - Se a página necessitar de Cubit/Bloc, crie uma subpasta (ex.: "home_details") com os arquivos do Cubit/Bloc e a página.
3. Utilize os módulos existentes (fruit_module, animals_module e home_module) como referência.

## Como Adicionar uma Nova Rota

1. Abra o arquivo `app_router.dart`.
2. Adicione a nova rota no mapeamento, definindo o caminho (ex.: `/novoModulo`) e associando-a à página principal do módulo.
3. Certifique-se de que a nova rota esteja registrada e importada corretamente em todas as configurações necessárias.

## Como Criar Novas Páginas e Widgets

1. Crie a nova página na pasta apropriada dentro de `presentation` do módulo em questão.
2. Para componentes reutilizáveis que não pertencem a um módulo específico, crie-os em uma pasta compartilhada (ou em uma nova pasta, se aplicável) e importe onde necessário.
3. Se a página requer gerenciamento de estado, crie um novo Cubit/Bloc e vincule-o à página existente.

## Como Implementar Use Cases, Entidades e Repositórios

1. Use Cases:
   - Tem o objetivo principal de centralizar as regras de negócio.
     Crie os arquivos de lógica de negócio na subpasta `use_cases` do módulo correspondente.
   - Siga a estrutura e o padrão dos casos de uso já existentes, garantindo que cada use case encapsule uma ação específica do domínio.
2. Entidades:
   - Adicione ou modifique os modelos de dados na pasta `entities` do módulo.
   - As entidades devem representar os objetos centrais do domínio e serem simples, seguindo o conceito de "Plain Old Dart Objects" (PODO) ou Classes anêmicas.
3. Repositórios:
   - Implemente a comunicação com fontes de dados na pasta `data`.
   - Garanta que os repositórios sigam a abstração dos demais módulos, facilitando a troca ou modificação da fonte de dados com mínimo impacto.
   - Evite colocar regras de negócio nesta camada, faça com que o único objetivo de cada método do repositório seja obter dados e repassá-los.
