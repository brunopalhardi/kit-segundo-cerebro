---
name: metodo-karpathy
type: source
created: {{DATA}}
tags: [metodo, segundo-cerebro, llm-wiki]
---

# Método Karpathy — LLM wiki como segundo cérebro

**Origem:** Andrej Karpathy (ex-OpenAI e Tesla) propôs em abril de 2025 um jeito simples de
montar uma base de conhecimento pessoal com a ajuda de uma IA: arquivos Markdown numa pasta do
computador, que a IA lê e organiza. Batizou de **LLM wiki**.

## A ideia em três camadas

| Camada | O que é | Quem escreve |
|---|---|---|
| `raw/` | Material bruto: artigo, transcrição de reunião, PDF, anotação solta | Você |
| `wiki/` | Notas curtas, uma por assunto, ligadas entre si com `[[links]]` | O assistente, sob seu comando |
| `AGENTS.md` + `index.md` + `log.md` | Regras + mapa + histórico | Os dois |

## Por que funciona

- **Arquivo seu, no seu computador.** Markdown abre em qualquer lugar, dura décadas e não prende você a nenhum aplicativo.
- **A IA lê sob demanda.** Ela começa pelo `index.md` e abre só a nota que interessa, em vez de carregar tudo.
- **Links criam um mapa.** No Obsidian, o gráfico mostra como as ideias se conectam; link para nota que ainda não existe mostra o que falta escrever.
- **Histórico no Git.** Cada registro vira uma versão; nada se perde.

## Limites

- Acima de ~100 a 200 notas grandes, o índice precisa de cuidado (o comando `consolida` existe para isso).
- Tudo que o assistente lê passa pela IA: por isso a Regra #1 de sigilo no [[AGENTS]].

## Ajustes deste cérebro em relação ao original

1. **Grava direto e avisa** em vez de perguntar antes — ver [[grava-direto-e-avisa]].
2. **Problema resolvido, registro atualizado:** nenhuma nota fica descrevendo como pendente o que já foi resolvido.
3. **Projetos com Estado atual:** `bora continuar <projeto>` retoma o trabalho de onde parou.
4. **Resumo ao encerrar a sessão:** antes de fechar, o assistente salva o estado e varre a conversa atrás do que vale guardar.
