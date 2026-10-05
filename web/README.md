# 🌐 Unnamed World Project — Official Web Architecture & Documentation

> **Status:** Active / Open Foundation  
> **Engine:** Vanilla Modern Web (HTML5, Modern CSS Design Tokens, Vanilla ES6+ JavaScript)  
> **Repository Integration:** Real-Time GitHub REST API Synchronization  
> **Production Target:** Vercel / GitHub Pages

---

## 📖 1. Visão Geral da Arquitetura

O site oficial do projeto foi projetado com uma filosofia de **Zero Dependências Pesadas** (sem React, sem Vue, sem bundlers lentos). Isso garante:
1. **Carregamento Instantâneo (Ultra Fast):** Desempenho 99+ no Google Lighthouse.
2. **Facilidade Total de Continuidade:** Qualquer desenvolvedor web (iniciante ou sênior) pode clonar e editar imediatamente sem precisar rodar `npm install` gigante ou lidar com quebras de pacotes npm.
3. **Sincronização em Tempo Real com o GitHub:** O site consome dados da API pública do GitHub para refletir commits, métricas e discussões instantaneamente.

---

## 📁 2. Estrutura de Diretórios

```text
web/
├── assets/                  # Mídias visuais e identidades
│   ├── concept/            # Artes conceituais fotorrealistas e panorâmicas
│   └── showcase/           # Infográficos e diagramas de apoio
├── css/
│   └── style.css           # Sistema de Design Completo (Cores HSL, Tipografia Cinzel/Jakarta, Glassmorphism)
├── js/
│   └── main.js             # Módulos: GitHub API Sync, Sistema i18n Multilíngue, Interatividade e UI
├── index.html              # Estrutura Semântica da Landing Page
├── vercel.json             # Configuração para Deploy na Vercel
└── README.md               # Esta documentação
```

---

## ⚡ 3. Integração com GitHub em Tempo Real (`js/main.js`)

O site sincroniza dados diretamente com o repositório oficial:
- **Repositório Conectado:** `Bieuulls/unnamed-world-project`
- **Endpoints Utilizados:**
  - `GET https://api.github.com/repos/Bieuulls/unnamed-world-project` (Métricas: Stars, Forks, Issues)
  - `GET https://api.github.com/repos/Bieuulls/unnamed-world-project/commits` (Últimos commits em tempo real)
- **Estratégia de Cache e Resiliência:**
  - Para evitar bloqueio por *Rate Limit* da API pública do GitHub (máximo 60 reqs/hora para clientes anônimos), os dados são cacheados no `localStorage` por **2 minutos**.
  - Caso a API demore ou falhe, o site exibe um fallback elegante sem quebrar a interface.

---

## 🌍 4. Sistema Multilíngue (i18n)

O site possui internacionalização nativa com suporte a 7 idiomas:
- **EN** (English - Padrão internacional)
- **PT** (Português do Brasil)
- **ES** (Español)
- **JA** (日本語)
- **FR** (Français)
- **DE** (Deutsch)
- **ZH** (简体中文)

### Como Adicionar um Novo Texto Traduzido:
1. No arquivo `index.html`, adicione o atributo `data-i18n="chave_do_texto"` ao elemento HTML.
2. No arquivo `js/main.js`, localize o objeto `i18nData` e adicione a tradução correspondente em cada idioma.
3. Ao alternar o idioma pelo dropdown da navbar, todos os elementos com `data-i18n` são atualizados instantaneamente pelo DOM sem recarregar a página.

---

## 🎨 5. Sistema de Design e Cores (`css/style.css`)

O site adota uma paleta cinematográfica dark/realista:

| Variável CSS | Valor | Uso |
| :--- | :--- | :--- |
| `--bg-darkest` | `#06080b` | Fundo principal da página |
| `--bg-surface` | `#0c1017` | Fundo de cartões e blocos |
| `--gold-primary` | `#d4af37` | Destaques, títulos imperiais, acentos e bordas nobres |
| `--emerald` | `#10b981` | Indicador de status ativo / conectividade em tempo real |
| `--font-serif` | `'Cinzel', serif` | Títulos e cabeçalhos imersivos de fantasia realista |
| `--font-body` | `'Plus Jakarta Sans', sans-serif` | Textos corridos com máxima legibilidade |

---

## 🚀 6. Como Rodar Localmente

Você não precisa de ferramentas complexas. Basta qualquer servidor HTTP simples:

```bash
# Opção 1: Usando Python (Nativo no Windows/Linux/Mac)
cd web
python -m http.server 3000

# Opção 2: Usando Node / NPX
npx serve web

# Opção 3: Extensão "Live Server" do VS Code / Antigravity
Basta clicar com botão direito em index.html -> "Open with Live Server"
```

Acesse no navegador: `http://localhost:3000`

---

## 🤝 7. Diretrizes para Novos Colaboradores

1. **Fidelidade Visual:** Respeitar a regra de **Realismo Puro**. Nunca adicionar artes em estilo anime, cartoon, chibi ou low-poly.
2. **Performance First:** Manter o código leve, sem bibliotecas pesadas de terceiros desnecessárias.
3. **Semântica HTML5:** Manter tags semânticas (`<header>`, `<nav>`, `<section>`, `<article>`, `<footer>`).
4. **Git Commits Claros:** Use commits no padrão conventional (ex: `feat(web): add live commit feed`, `fix(web): improve mobile layout`).
