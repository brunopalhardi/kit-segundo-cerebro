---
name: encerrar-sessao
description: Use quando a pessoa sinalizar que vai encerrar a sessão — "/clear", "vou fechar", "vou trocar de modelo", "deixa pronto pra próxima" — antes de confirmar. Salva o estado do trabalho no segundo cérebro e registra o que vale guardar.
---

# Encerrar sessão

O caminho do cérebro está no bloco "Segundo cérebro" do CLAUDE.md global. Leia o `AGENTS.md` do cérebro antes do passo 2.

1. **Varredura.** Releia a conversa e liste o que vale daqui a 6 meses: decisão com o porquê, lição de erro, preferência da pessoa, conhecimento sobre pessoa/empresa/ferramenta, referência. Feito quando cada item da lista está registrado no cérebro pelo procedimento "Registrar" do `AGENTS.md`.
2. **Estado do projeto.** Se a conversa trabalhou num projeto ou cliente, atualize a seção **Estado atual (data de hoje)** de `projects/<projeto>/overview.md` com: feito (concreto), pendente, e **um** próximo passo acionável. Projeto novo → crie a pasta a partir de `projects/_modelo/`. Salve a versão (commit e, com remoto, push).
3. **Feche** com as linhas, nesta ordem:

> ✅ Estado salvo em `projects/<projeto>/overview.md`.
> 📌 Registrei no cérebro: `<nota>` — <o quê>. *(uma linha por nota do passo 1)*
> Pode dar `/clear`. Na próxima, diga "bora continuar <projeto>".

O `/clear` é um comando que só a pessoa digita; o passo 3 termina entregando essa ação a ela.
