#!/usr/bin/env bash
# Instala o segundo cérebro a partir do kit.
#   bash scripts/instalar.sh --nome "Nome" --destino "$HOME/Documents/Cerebro"
#   bash scripts/instalar.sh --so-regras --destino "<cérebro existente>"   -> só (re)instala regras globais e skill
# Reexecutar é seguro: o cérebro existente nunca é sobrescrito e o bloco global é substituído no lugar.
set -euo pipefail

KIT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NOME=""; DESTINO=""; SO_REGRAS=0
while [ $# -gt 0 ]; do
  case "$1" in
    --nome) NOME="$2"; shift 2 ;;
    --destino) DESTINO="$2"; shift 2 ;;
    --so-regras) SO_REGRAS=1; shift ;;
    *) echo "Opção desconhecida: $1" >&2; exit 2 ;;
  esac
done
[ -n "$DESTINO" ] || { echo "Falta --destino" >&2; exit 2; }
command -v git >/dev/null || { echo "Git não encontrado. No Mac: xcode-select --install" >&2; exit 3; }
DESTINO="${DESTINO/#\~/$HOME}"
HOJE="$(date +%Y-%m-%d)"

if [ "$SO_REGRAS" -eq 0 ]; then
  [ -n "$NOME" ] || { echo "Falta --nome" >&2; exit 2; }
  if [ -e "$DESTINO" ] && [ -n "$(ls -A "$DESTINO" 2>/dev/null)" ]; then
    echo "A pasta $DESTINO já existe e não está vazia. Escolha outro --destino." >&2; exit 4
  fi
  mkdir -p "$DESTINO"
  cp -R "$KIT/modelo-vault/." "$DESTINO/"
  DESTINO="$(cd "$DESTINO" && pwd)"
  export NOME DESTINO HOJE
  find "$DESTINO" -name '*.md' -not -path '*/.git/*' -print0 | xargs -0 perl -pi -e \
    's/\{\{NOME\}\}/$ENV{NOME}/g; s/\{\{CAMINHO\}\}/$ENV{DESTINO}/g; s/\{\{DATA\}\}/$ENV{HOJE}/g'
  git -C "$DESTINO" init -q -b main
  git -C "$DESTINO" config user.name >/dev/null || git -C "$DESTINO" config user.name "$NOME"
  git -C "$DESTINO" config user.email >/dev/null || git -C "$DESTINO" config user.email "cerebro@localhost"
  git -C "$DESTINO" add -A
  git -C "$DESTINO" commit -q -m "cerebro: nasce a partir do kit-segundo-cerebro"
  echo "✓ Cérebro criado em $DESTINO"
else
  [ -f "$DESTINO/AGENTS.md" ] || { echo "Não achei um cérebro em $DESTINO" >&2; exit 4; }
  DESTINO="$(cd "$DESTINO" && pwd)"
fi

# Bloco de regras globais: substitui o bloco existente ou acrescenta no fim.
aplica_bloco() {
  local alvo="$1"
  mkdir -p "$(dirname "$alvo")"; touch "$alvo"
  local bloco; bloco="$(sed "s|{{CAMINHO}}|$DESTINO|g" "$KIT/regras-globais/trecho-global.md")"
  BLOCO="$bloco" perl -0777 -i -pe '
    my $b = $ENV{BLOCO};
    if (/<!-- BEGIN:segundo-cerebro -->.*?<!-- END:segundo-cerebro -->/s) {
      s/<!-- BEGIN:segundo-cerebro -->.*?<!-- END:segundo-cerebro -->/$b/s;
    } else {
      $_ .= (length($_) && !/\n\z/ ? "\n" : "") . (length($_) ? "\n" : "") . $b . "\n";
    }' "$alvo"
  echo "✓ Regras globais em $alvo"
}
aplica_bloco "$HOME/.claude/CLAUDE.md"
[ -d "$HOME/.codex" ] && aplica_bloco "$HOME/.codex/AGENTS.md"

mkdir -p "$HOME/.claude/skills"
rm -rf "$HOME/.claude/skills/encerrar-sessao"
cp -R "$KIT/skills/encerrar-sessao" "$HOME/.claude/skills/"
echo "✓ Skill encerrar-sessao instalada"
