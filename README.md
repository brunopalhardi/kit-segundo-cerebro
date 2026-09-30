# Kit segundo cérebro

Um segundo cérebro em Markdown, lido no **Obsidian** e mantido pelo **Claude Code**, no método
**LLM wiki** do Andrej Karpathy, com os ajustes que o fizeram funcionar no dia a dia:

- **Grava direto e avisa.** O Claude registra sozinho o que vale guardar e avisa numa linha 📌.
  Perguntar "quer que eu salve?" fazia quase nada ser salvo.
- **Comandos em português:** `salva no cerebro`, `ingere isso`, `busca no cerebro`, `consolida`, `bora continuar <projeto>`.
- **Problema resolvido, registro atualizado:** nenhuma nota fica mentindo sobre o presente.
- **Encerrar sessão salva o estado:** diga "vou fechar" e o próximo passo fica anotado no projeto.
- **Regra de sigilo** personalizada para a área de cada pessoa.
- **Backup automático** com histórico no GitHub (opcional).

## Instalar (Mac, ~20 minutos)

1. Tenha o **Claude Code** instalado e logado (plano pago do Claude): https://claude.com/claude-code
2. Baixe este kit (botão verde **Code → Download ZIP**) e descompacte.
3. Abra o Terminal, entre na pasta do kit e inicie o Claude:
   ```bash
   cd ~/Downloads/kit-segundo-cerebro-main
   claude
   ```
4. Diga: **"Instala meu segundo cérebro seguindo o INSTALAR.md"**.

O Claude faz 5 perguntas, cria tudo, e guia a instalação do Obsidian e do backup.
Guia visual passo a passo: [`docs/guia.html`](./docs/guia.html).

## O que tem aqui

| Pasta/arquivo | Para quê |
|---|---|
| `INSTALAR.md` | Roteiro que o Claude segue na instalação |
| `modelo-vault/` | O cérebro vazio: estrutura, regras (`AGENTS.md`), índice, histórico, 2 notas de exemplo, modelo de projeto, configuração do Obsidian |
| `regras-globais/trecho-global.md` | Bloco que vai no `~/.claude/CLAUDE.md` para os comandos funcionarem de qualquer pasta |
| `skills/encerrar-sessao/` | Skill que salva o estado e registra o que vale antes de fechar a conversa |
| `scripts/instalar.sh` | Faz a parte mecânica. Reexecutar é seguro; `--so-regras` só atualiza regras e skill |

## Já instalei, e agora?

Abra o Claude em qualquer pasta e fale normalmente. Quando algo valer ser guardado, diga
`salva no cerebro: ...` ou deixe o Claude perceber sozinho. Colou um artigo ou a transcrição de
uma reunião? `ingere isso`. Quer lembrar algo? `busca no cerebro: ...`.

Funciona também com o **Codex**: as regras do cérebro ficam no `AGENTS.md`, que ele lê.
