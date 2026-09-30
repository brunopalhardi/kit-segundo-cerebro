# Instalar o segundo cérebro — roteiro para o Claude

Você (Claude Code) está instalando o segundo cérebro para a pessoa na sua frente. Ela
provavelmente **não é programadora**: fale português simples, explique cada termo técnico numa
frase e faça uma pergunta por vez. Rode você os comandos; peça a ela só o que exige a mão dela
(janela do navegador, instalar aplicativo, login). Cada passo termina no critério indicado.

## 1. Entrevista

Pergunte, uma por vez, e guarde as respostas:

1. **Nome** — como ela quer ser chamada.
2. **Trabalho** — o que faz, para quem, e 1 a 3 projetos ou clientes em andamento.
3. **Sigilo** — o que nunca pode entrar no cérebro além de senhas e documentos de terceiros.
   Sugira exemplos da área dela (consultoria: faturamento e contrato de cliente; saúde: qualquer
   dado de paciente; jurídico: peças e dados de processo) e deixe-a ajustar.
4. **Pasta** — onde criar. Sugira `~/Documents/Cerebro`.
5. **Backup no GitHub** — explique: "é uma cópia do cérebro na nuvem, privada, com histórico de
   cada versão; precisa de uma conta gratuita no github.com". Sim ou não.

Feito quando as 5 respostas estão guardadas.

## 2. Pré-requisito: Git

Rode `git --version`. Faltando no Mac, rode `xcode-select --install`, explique que vai abrir uma
janela da Apple pedindo para instalar as "ferramentas de linha de comando" e espere ela
confirmar que terminou. Feito quando `git --version` responde uma versão.

## 3. Criar o cérebro

A partir da pasta deste kit:

```bash
bash scripts/instalar.sh --nome "<nome>" --destino "<pasta>"
```

O script copia o modelo, cria o histórico (git), instala o bloco "Segundo cérebro" no
`~/.claude/CLAUDE.md` (e no `~/.codex/AGENTS.md` se ela usa Codex) e instala a skill
`encerrar-sessao`. Feito quando as três linhas com ✓ aparecem.

## 4. Personalizar

No cérebro criado:

1. No `AGENTS.md`, troque `{{SOBRE}}` por 3 a 6 linhas sobre ela (trabalho, público, jeito de
   trabalhar) e `{{SIGILO}}` pela lista da pergunta 3, terminando em ponto final.
2. Crie `wiki/entities/<slug-do-nome>.md` com o perfil dela (formato de nota do `AGENTS.md`).
3. Para cada projeto ou cliente citado, copie `projects/_modelo/` para `projects/<slug>/` e
   preencha o que ela contou, respeitando o sigilo.
4. Atualize `index.md` e `log.md` e salve a versão (`git add -A && git commit -m "cerebro: personalização"`).

Feito quando `grep -rn "{{" --include='*.md' <pasta>` não devolve nada e `git status` está limpo.

## 5. Backup no GitHub (só se ela disse sim)

1. `gh --version`. Faltando: com Homebrew, `brew install gh`; sem, peça que baixe e instale o
   pacote para macOS em https://cli.github.com.
2. Peça que ela digite `! gh auth login` e siga no navegador (GitHub.com → HTTPS → login pelo navegador).
3. `cd <pasta> && gh repo create cerebro --private --source . --push`
4. Ligue o envio automático do Obsidian:
   `perl -pi -e 's/"disablePush": true/"disablePush": false/; s/"autoPullOnBoot": false/"autoPullOnBoot": true/' .obsidian/plugins/obsidian-git/data.json`
   e salve a versão com push.

Feito quando `git -C <pasta> status -sb` mostra `## main...origin/main` sem commits pendentes.

## 6. Obsidian

Guie, esperando ela confirmar cada item:

1. Baixar e instalar em https://obsidian.md.
2. Abrir → **Abrir pasta como cofre** (*Open folder as vault*) → escolher a pasta do cérebro.
3. Se aparecer o aviso de plugins da comunidade: **Confiar no autor e ativar plugins**.
4. **Configurações → Plugins da comunidade → Procurar** → "Git" (autor Vinzent) → **Instalar** → **Ativar**.
   A configuração já vem pronta: salva uma versão a cada 10 minutos.

Feito quando ela diz que vê as notas `metodo-karpathy` e `grava-direto-e-avisa` no Obsidian.

## 7. Primeiro uso, junto

Peça que ela diga agora, nesta conversa, `salva no cerebro:` + uma ideia real do trabalho dela.
Faça o registro seguindo o `AGENTS.md` do cérebro e peça que ela veja a nota nova aparecer no
Obsidian. Feito quando ela confirma que viu.

## 8. Fechamento

Mostre a tabela de comandos do `README.md` do cérebro e diga, em duas frases, as duas regras que
fazem o método funcionar: o Claude grava sozinho e avisa com 📌 (se não quiser a nota, é só pedir
para tirar), e antes de fechar uma conversa de trabalho basta dizer "vou fechar" para o estado
ficar salvo.
