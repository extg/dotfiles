#!/usr/bin/env bash

# Скрипт для синхронизации настроек VS Code/Cursor из dotfiles репозитория
# Создает симлинки из стандартных директорий редакторов в dotfiles

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
VSCODE_DIR="$DOTFILES_DIR/vscode"

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Функция для создания симлинка
create_symlink() {
  local source="$1"
  local target="$2"
  local editor_name="$3"

  # Создаем родительскую директорию если её нет
  local target_dir="$(dirname "$target")"
  if [ ! -d "$target_dir" ]; then
    echo -e "${YELLOW}Creating directory: $target_dir${NC}"
    mkdir -p "$target_dir"
  fi

  # Проверяем существует ли уже симлинк
  if [ -L "$target" ]; then
    local current_link="$(readlink "$target")"
    if [ "$current_link" = "$source" ]; then
      echo -e "${GREEN}✓${NC} $editor_name: $(basename "$target") already linked"
      return 0
    else
      echo -e "${YELLOW}⚠${NC}  $editor_name: $(basename "$target") is linked to different location"
      echo "   Current: $current_link"
      echo "   Expected: $source"
      read -p "   Replace? (y/n) " -n 1 -r
      echo
      if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
      fi
      rm "$target"
    fi
  # Проверяем существует ли обычный файл
  elif [ -f "$target" ]; then
    echo -e "${YELLOW}⚠${NC}  $editor_name: $(basename "$target") exists as regular file"
    read -p "   Backup and replace with symlink? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      return 1
    fi
    mv "$target" "$target.backup.$(date +%Y%m%d_%H%M%S)"
    echo "   Backed up to: $target.backup.$(date +%Y%m%d_%H%M%S)"
  fi

  # Создаем симлинк
  ln -s "$source" "$target"
  echo -e "${GREEN}✓${NC} $editor_name: $(basename "$target") linked successfully"
}

# Проверяем что директория vscode существует
if [ ! -d "$VSCODE_DIR" ]; then
  echo -e "${RED}Error: $VSCODE_DIR directory not found${NC}"
  exit 1
fi

echo "Syncing VS Code/Cursor settings from dotfiles..."
echo "Source: $VSCODE_DIR"
echo ""

# Файлы для синхронизации
FILES=(
  "settings.json"
  "keybindings.json"
  "extensions.txt"
)

# Опционально: mcp.json (только если существует в dotfiles)
if [ -f "$VSCODE_DIR/mcp.json" ]; then
  FILES+=("mcp.json")
fi

# VS Code директории (в порядке приоритета)
VSCODE_PATHS=(
  "$HOME/Library/Application Support/Code/User"
  "$HOME/Library/Application Support/Code - Insiders/User"
)

# Cursor директория
CURSOR_PATH="$HOME/Library/Application Support/Cursor/User"

# Счетчики
success_count=0
skip_count=0
total_operations=0

# Синхронизация для Cursor
echo -e "${YELLOW}=== Cursor ===${NC}"
for file in "${FILES[@]}"; do
  total_operations=$((total_operations + 1))
  if create_symlink "$VSCODE_DIR/$file" "$CURSOR_PATH/$file" "Cursor"; then
    success_count=$((success_count + 1))
  else
    skip_count=$((skip_count + 1))
  fi
done
echo ""

# Синхронизация для VS Code
for vscode_path in "${VSCODE_PATHS[@]}"; do
  # Проверяем существует ли директория VS Code
  if [ -d "$(dirname "$vscode_path")" ]; then
    echo -e "${YELLOW}=== VS Code ($(basename "$(dirname "$vscode_path")")) ===${NC}"
    for file in "${FILES[@]}"; do
      total_operations=$((total_operations + 1))
      if create_symlink "$VSCODE_DIR/$file" "$vscode_path/$file" "VS Code"; then
        success_count=$((success_count + 1))
      else
        skip_count=$((skip_count + 1))
      fi
    done
    echo ""
  fi
done

# Итоговая статистика
echo "================================"
echo -e "Summary:"
echo -e "  ${GREEN}✓${NC} Linked: $success_count"
if [ $skip_count -gt 0 ]; then
  echo -e "  ${YELLOW}⊘${NC} Skipped: $skip_count"
fi
echo "================================"
echo ""
echo "Settings are now synced!"
echo "Any changes made in Cursor or VS Code will be reflected in:"
echo "  $VSCODE_DIR"
