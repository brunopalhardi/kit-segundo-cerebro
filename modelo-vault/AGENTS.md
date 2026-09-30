# Cérebro de {{NOME}}

Segundo cérebro em Markdown no método **LLM wiki** do Andrej Karpathy: {{NOME}} captura, o
assistente condensa, organiza e liga as notas. O Obsidian é a janela de leitura; esta pasta é a
fonte da verdade. Caminho: `{{CAMINHO}}`.

## Sobre {{NOME}}

{{SOBRE}}

## Regra #1 — Sigilo

Entra no cérebro o que {{NOME}} pode reler sem expor ninguém: decisões com o porquê, métodos,
frameworks, aprendizados, referências, e conhecimento sobre clientes e parceiros no nível do
trabalho (o que pediram, o que funcionou, o que foi decidido).

Fica fora, sempre: senhas, tokens e chaves; CPF, documentos, endereço e telefone de terceiros;
{{SIGILO}}

Na dúvida se algo é sensível, pergunte antes de gravar. É a única pergunta prévia deste cérebro.

## Estrutura

- `raw/` — material bruto como chegou (artigo, transcrição, PDF, anotação solta). Imutável: lê-se, nunca se edita.
- `wiki/sources/` — uma nota por fonte: livro, vídeo, artigo, reunião.
- `wiki/concepts/` — ideias, frameworks, padrões, lições.
- `wiki/entities/` — pessoas, empresas, ferramentas.
- `projects/<nome>/` — um projeto ou cliente: `overview.md` (o que é + **Estado atual**) e `decisions.md` (decisões com data e porquê).
- `wiki/_arquivo/` — notas aposentadas.
- `index.md` — o mapa. Leia-o primeiro, sempre.
- `log.md` — histórico do que entrou, só acrescenta.

Leitura sob demanda: `index.md` → busca por palavra → a nota certa. O cérebro inteiro nunca é carregado de uma vez.

## Comandos

| {{NOME}} diz | Faça |
|---|---|
| `salva no cerebro: <X>` | Registre `<X>` (procedimento abaixo). |
| `ingere isso` / `ingere <arquivo>` | Material colado na conversa: salve-o antes em `raw/AAAA-MM-DD-<slug>.md`. Leia o bruto, escreva a nota em `wiki/sources/`, crie ou atualize os conceitos e entidades que ele traz, e registre. |
| `busca no cerebro: <X>` | `index.md` → busca → responda citando as notas como `[[nome-da-nota]]`. |
| `consolida` | Releia as entradas recentes do `log.md` e deixe o `index.md` refletindo o estado atual. |
| `bora continuar <projeto>` | Leia `projects/<projeto>/overview.md` e retome do **Estado atual**. |

## Registrar: grava direto e avisa

Quando a conversa produzir algo que valha daqui a 6 meses, grave sem perguntar e avise numa
linha. Vale: decisão com o porquê; padrão que se repete; preferência de {{NOME}}; conhecimento
sobre pessoa, empresa ou ferramenta; ideia ou framework que {{NOME}} articulou; lição de erro;
referência externa com uma linha do porquê. O trivial e o estado passageiro da conversa ficam
de fora. Motivo: a pergunta "quer que eu salve?" se perde no fim da resposta e nada é salvo.

O registro está feito quando os cinco passos estão feitos:

1. Procure nota sobre o tema (`index.md` + busca). Existe → atualize-a. Não existe → crie.
2. Escreva a nota no lugar certo, com o formato abaixo.
3. Nota nova → uma linha no `index.md`, na seção certa.
4. Uma linha no `log.md`: `- AAAA-MM-DD | create|update <arquivo> — <o quê>`.
5. Salve a versão: `git add -A && git commit -m "cerebro: <o quê>"`. Com remoto configurado: `git pull --rebase && git push`.

Feche com o aviso numa linha separada:

> 📌 Registrei no cérebro: `wiki/concepts/<nota>.md` — <o quê, em uma frase>.

Se {{NOME}} pedir para tirar: mova a nota para `wiki/_arquivo/`, tire a linha do `index.md`, anote no `log.md`.

## Problema resolvido, registro atualizado

Quando algo registrado como problema ou pendência for resolvido ou mudar, atualize a nota:
preserve o histórico e acrescente o estado atual com data. Toda nota descreve o presente com
fidelidade: o que foi resolvido aparece como resolvido.

## Formato de nota

```yaml
---
name: slug-em-kebab-case
type: source | concept | entity | project
created: AAAA-MM-DD
tags: [tag1, tag2]
---
```

- Uma nota, um assunto. Passou de ~300 linhas, quebre em notas menores ligadas entre si.
- Ligue notas com `[[nome-da-nota]]`. Link para nota que ainda não existe é bem-vindo: marca o que falta escrever.
- Português. Citação em outra língua: original + síntese.
- Datas absolutas (30/09/2026).
- Quem tem nome de produto e apelido registra os dois em `aliases:` no frontmatter.
