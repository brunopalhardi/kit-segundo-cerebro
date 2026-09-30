# kit-segundo-cerebro — manutenção

Kit distribuível: outras pessoas baixam este repositório e o Claude delas segue o `INSTALAR.md`.

- Tudo aqui é **genérico**. Nome, cliente ou dado de qualquer pessoa real fica fora do repositório;
  a personalização acontece na instalação, na máquina de quem instala.
- Marcadores no `modelo-vault/`: `{{NOME}}`, `{{CAMINHO}}`, `{{DATA}}` (trocados pelo script) e
  `{{SOBRE}}`, `{{SIGILO}}` (preenchidos pelo Claude no passo 4). `{{date}}` em
  `.obsidian/plugins/obsidian-git/data.json` pertence ao plugin e fica como está.
- Mudou uma regra do método? Edite `modelo-vault/AGENTS.md` e confira se `INSTALAR.md`,
  `README.md` e `docs/guia.html` continuam dizendo o mesmo.
- Teste de ponta a ponta antes de publicar: rode `scripts/instalar.sh` com `HOME` apontando para
  uma pasta temporária e confira os ✓, a ausência de `{{NOME}}`/`{{CAMINHO}}`/`{{DATA}}` e o commit inicial.
- O cérebro de teste fica **fora de `~/.claude/`** (ex.: `/private/tmp/...`): o Claude Code protege essa
  área e recusa gravações ali em modo não interativo. Para testar os comandos com um Claude real:
  `claude -p "salva no cerebro: ..." --permission-mode acceptEdits` dentro da pasta de teste.
