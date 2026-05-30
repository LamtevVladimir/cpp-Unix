#!/bin/bash

# Скрипт переноса изменений из ветки dev в ветку stg
# Создаёт тег с меткой времени

set -e  # Остановить скрипт при любой ошибке

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Начинаем перенос из dev в stg...${NC}"

# 1. Переключиться на dev и получить актуальные изменения
echo -e "${YELLOW}1. Обновляем ветку dev...${NC}"
git checkout dev
git pull origin dev

# 2. Переключиться на stg и обновить её
echo -e "${YELLOW}2. Обновляем ветку stg...${NC}"
git checkout stg
git pull origin stg

# 3. Слить изменения из dev в stg
echo -e "${YELLOW}3. Сливаем dev в stg...${NC}"
if git merge dev --no-ff -m "Merge dev into stg [$(date +'%Y-%m-%d %H:%M:%S')]"; then
    echo -e "${GREEN}   Слияние выполнено успешно${NC}"
else
    echo -e "${RED}   Ошибка слияния! Разрешите конфликты и запустите скрипт заново${NC}"
    exit 1
fi

# 4. Создать тег с текущей датой и временем
TAG_NAME="stg-$(date +%Y%m%d-%H%M%S)"
echo -e "${YELLOW}4. Создаём тег: $TAG_NAME${NC}"
git tag -a "$TAG_NAME" -m "Release to stg on $(date +'%Y-%m-%d %H:%M:%S')"

# 5. Отправить изменения в удалённый репозиторий
echo -e "${YELLOW}5. Отправляем изменения и теги на сервер...${NC}"
git push origin stg
git push origin "$TAG_NAME"

echo -e "${GREEN}✅ Готово!${NC}"
echo -e "${GREEN}   Изменения перенесены из dev в stg${NC}"
echo -e "${GREEN}   Создан тег: $TAG_NAME${NC}"
