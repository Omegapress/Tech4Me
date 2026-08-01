# 🏦 Sistema de Conta Bancária em Delphi (VCL)

Um sistema simples de gerenciamento de conta bancária desenvolvido em **Delphi** utilizando **Windows VCL Application**. O projeto exemplifica conceitos de **Programação Orientada a Objetos (POO)**, validações de entrada e gerenciamento de cadastro/operações financeiras.

---

## 📌 Requisitos do Projeto vs. Funcionalidades Implementadas

O projeto atende integralmente e expande os requisitos solicitados:

### ⚙️ Regras de Negócio e POO
* **Classe `TContaBancaria`:**
  * Atributos privados: `NumeroConta`, `Titular` e `Saldo`.
  * Propriedades públicas com encapsulamento (saldo somente leitura).
  * Métodos `Depositar(Valor)` e `Sacar(Valor)`.
  * Validação de saldo suficiente para saques e impedimento de valores zerados/negativos.

### 🖥️ Interface e Telas
* **Tela Principal (`Tela.Principal`):**
  * Busca e seleção de contas existentes.
  * Operações rápidas de **Depósito** e **Saque**.
  * Exibição de titular e saldo formatado (`R$ #,##0.00`).
  * Atalhos para telas de gerenciamento e exibição de extrato.
* **Tela de Cadastro e Edição (`Tela.NovaConta`):**
  * **Modo Inclusão:** Criação de novas contas bancárias.
  * **Modo Edição:** Preenchimento automático ao selecionar uma conta na tela principal, permitindo alterar o titular sem modificar o número da conta.
  * **Exclusão:** Botão dinâmico `btnExcluir` para remoção de contas com confirmação do usuário.

### ✅ Validações Implementadas
* **Validação de Campos Vazios:** Impede o envio de formulários com informações em branco (utilizando `Trim`).
* **Trava de Limpeza no Modo Edição:** A função de limpar campos preserva o número da conta quando em modo de edição, apagando apenas o nome do titular.
* **Entrada Numérica:** Restrição para aceitar apenas valores numéricos nos campos necessários.
* **Checagem de Seleção:** Garante que uma conta válida foi selecionada antes de permitir saques, depósitos ou consultas de saldo.

---

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Object Pascal (Delphi)
* **Framework GUI:** VCL (Visual Component Library)
* **Arquitetura:** Separação entre Modelos (`Modelo.ContaBancaria`), Repositório (`Repositorio`) e Views (`Tela.*`).

---

## 📁 Estrutura do Projeto

```text
├── Modelo.ContaBancaria.pas   # Classe TContaBancaria e regras de negócio
├── Repositorio.pas            # Gerenciamento/Armazenamento das contas em memória
├── Tela.Principal.pas         # Tela principal do sistema (Busca, Depósito, Saque)
├── Tela.NovaConta.pas         # Tela de Cadastro, Edição e Exclusão de Contas
├── Tela.ExibirConta.pas       # Tela para listagem de contas
└── Tela.ExtratoConta.pas      # Tela para exibição detalhada do extrato