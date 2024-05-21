#!/bin/bash
COUNT=$(wc -l < ~/Documents/personal/notes/todo.md)
TODOS=$(cat ~/Documents/personal/notes/todo.md | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
