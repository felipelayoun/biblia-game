# BibliaGame 📖

Jogo de cartas bíblico multiplayer para evangelismo. **1000 perguntas**, dois níveis (Aprendiz/Sábio), gratuito.

---

## 📦 O que tem aqui

| Arquivo | Para que serve |
|---|---|
| `index.html` | **O jogo completo.** Abra no navegador para testar. |
| `supabase-setup.sql` | SQL pra rodar uma vez no Supabase (cria as tabelas) |
| `perguntas-completas.json` | As 1000 perguntas separadas (caso queira editar) |
| `README.md` | Este arquivo |

---

## 🎮 Como testar AGORA (sem configurar nada)

1. Abra `index.html` no navegador (duplo-clique)
2. Vai aparecer um banner laranja: "🧪 Modo preview"
3. **Abra outra aba** com o mesmo arquivo
4. Aba 1: clique em **"Sou o Sábio"** → cria sala, anota o código
5. Aba 2: clique em **"Entrar como Aprendiz"** → digita o código
6. Joga normalmente entre as abas

**Importante:** modo preview só funciona entre abas do mesmo navegador. Pra multiplayer real entre celulares, configure o Supabase abaixo.

---

## 🚀 Como publicar no seu domínio (3 passos, ~25 min)

### Passo 1 — Configurar Supabase (servidor multiplayer)

1. Acesse [supabase.com](https://supabase.com) e crie conta (grátis)
2. Clique em **"New project"**:
   - Nome: `bibliagame`
   - Senha do banco: anote em algum lugar
   - Região: **South America (São Paulo)**
   - Plano: **Free**
3. Aguarde ~2 minutos enquanto cria
4. No menu lateral → **SQL Editor** → **New query**
5. Cole o conteúdo de `supabase-setup.sql` e clique **"Run"**
6. Vá em **Settings → API** e copie:
   - **Project URL** (ex: `https://xyzabc.supabase.co`)
   - **anon public** key (chave longa começando com `eyJ...`)

### Passo 2 — Inserir as credenciais no jogo

Abra `index.html` num editor de texto (VS Code, Sublime, até bloco de notas).

Procure por estas duas linhas:

```javascript
const SUPABASE_URL = '__SUPABASE_URL__';
const SUPABASE_ANON_KEY = '__SUPABASE_ANON_KEY__';
```

Substitua pelos seus valores:

```javascript
const SUPABASE_URL = 'https://xyzabc.supabase.co';
const SUPABASE_ANON_KEY = 'eyJ...sua-chave-aqui';
```

Salve.

### Passo 3 — Hospedar no seu domínio

**Opção mais fácil — Netlify (grátis):**

1. Vá em [app.netlify.com](https://app.netlify.com) e faça login
2. Na tela inicial, **arraste o `index.html`** para a área "Sites"
3. Pronto! Já tem um link tipo `random-name-xyz.netlify.app`
4. Para conectar seu domínio: **Site settings → Domain management → Add custom domain**
5. Siga as instruções pra apontar o DNS (~10 min)

**Alternativa — sua hospedagem brasileira:**

Se você já tem hospedagem associada ao domínio (Hostinger, Locaweb, KingHost, etc), faça upload do `index.html` via cPanel ou FTP. Renomeie para `index.html` se quiser que apareça direto no domínio.

---

## ✏️ Editando as perguntas

Quer adicionar/remover/corrigir perguntas? Tem duas formas:

**Forma rápida:** edite direto no `index.html`. Procure por `<script id="questions-data"` e edite o JSON dentro.

**Forma organizada:** edite `perguntas-completas.json`, depois me peça pra reinjetar no HTML.

### Estrutura de uma pergunta

```json
{
  "id": 1,
  "cat": "JES",
  "age": "T",
  "theme": "Nome do tema",
  "d": {
    "q": "Pergunta nível Aprendiz",
    "a": "Resposta",
    "ref": "João 3:16"
  },
  "s": {
    "q": "Pergunta nível Sábio (mais difícil)",
    "a": "Resposta detalhada",
    "ref": "João 3:16"
  }
}
```

### Categorias disponíveis

- `AT` — Antigo Testamento
- `NT` — Novo Testamento
- `JES` — Vida de Jesus
- `PER` — Personagens
- `PAR` — Parábolas
- `MIL` — Milagres
- `PRO` — Profecias
- `DOU` — Doutrina
- `GEO` — Geografia bíblica
- `LIV` — Livros da Bíblia

### Faixas etárias

- `C` — Criança
- `J` — Jovem/Adulto
- `T` — Todos

---

## 🎯 Como o jogo funciona

1. **Sábio (host)** cria a sala, escolhe categorias e meta de pontos
2. **Aprendizes** entram com o código da sala
3. Sábio inicia a partida
4. A cada rodada:
   - Sábio escolhe nível Aprendiz (1pt) ou Sábio (2pt)
   - Carta é virada — todos veem a pergunta, só o Sábio vê a resposta
   - Sábio lê a pergunta em voz alta
   - Aprendizes respondem em voz alta
   - Sábio toca no nome de quem acertou pra dar pontos
5. Primeiro a chegar na meta vence

---

## 🛠️ Suporte / dúvidas

Esse arquivo foi criado em conjunto com o Claude (Anthropic). Para mais ajustes, basta abrir uma nova conversa e pedir.

**Versão:** 3.0 · 1000 perguntas · multiplayer Supabase
