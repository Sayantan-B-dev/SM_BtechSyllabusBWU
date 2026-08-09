# -*- coding: utf-8 -*-
import os
import sys
from pathlib import Path
from collections import defaultdict
from rich.console import Console
from rich.table import Table
from rich import box

IGNORE_DIRS = {'.git', 'node_modules', '__pycache__', '.venv', 'venv', '.mypy_cache', '.pytest_cache', '.opencode'}
IGNORE_EXTS = {'.pyc'}

def human_size(size):
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size < 1024:
            return f"{size:.1f} {unit}"
        size /= 1024
    return f"{size:.1f} TB"

def scan(root):
    ext_data = defaultdict(lambda: {'count': 0, 'size': 0})
    all_files = []
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = [d for d in dirnames if d not in IGNORE_DIRS and not d.startswith('.')]
        for f in filenames:
            ext = Path(f).suffix.lower()
            if ext in IGNORE_EXTS or f.startswith('.'):
                continue
            full = os.path.join(dirpath, f)
            try:
                size = os.path.getsize(full)
            except OSError:
                continue
            key = ext if ext else '(no extension)'
            ext_data[key]['count'] += 1
            ext_data[key]['size'] += size
            all_files.append((full, size))
    return ext_data, sorted(all_files, key=lambda x: x[1], reverse=True)

def bar(percent, width=15):
    filled = int(width * percent / 100)
    return '[bold green]' + '|' * filled + '[/bold green]' + '-' * (width - filled)

def main():
    console = Console()
    root = os.getcwd()
    data, all_files = scan(root)
    total = sum(v['size'] for v in data.values())
    sorted_exts = sorted(data.items(), key=lambda x: x[1]['size'], reverse=True)

    # Extension table
    ext_table = Table(
        title="STORAGE ANALYSIS BY FILE EXTENSION",
        box=box.ROUNDED,
        title_style="bold cyan",
        show_header=True,
        header_style="bold magenta",
        padding=(0, 2),
    )
    ext_table.add_column("Extension", style="bold yellow", min_width=14)
    ext_table.add_column("Count", justify="right", style="cyan")
    ext_table.add_column("Size", justify="right", style="green")
    ext_table.add_column("%", justify="right", style="magenta")
    ext_table.add_column("Distribution", min_width=20)

    for ext, info in sorted_exts:
        pct = (info['size'] / total * 100) if total else 0
        display = ext if ext != '(no extension)' else '(none)'
        ext_table.add_row(
            display,
            str(info['count']),
            human_size(info['size']),
            f"{pct:.1f}%",
            bar(pct),
        )

    ext_table.add_row(
        "[bold]TOTAL[/bold]",
        f"[bold]{sum(v['count'] for v in data.values())}[/bold]",
        f"[bold]{human_size(total)}[/bold]",
        "[bold]100%[/bold]",
        "",
        style="on dark_green",
    )

    console.print()
    console.print(ext_table)

    # Top 20 big files table
    top_table = Table(
        title="TOP 20 BIGGEST FILES",
        box=box.ROUNDED,
        title_style="bold red",
        show_header=True,
        header_style="bold magenta",
        padding=(0, 2),
    )
    top_table.add_column("#", justify="right", style="dim", width=3)
    top_table.add_column("File Path", style="white", min_width=40)
    top_table.add_column("Size", justify="right", style="bold green")

    for i, (path, size) in enumerate(all_files[:20], 1):
        rel = os.path.relpath(path, root)
        top_table.add_row(str(i), rel, human_size(size))

    console.print()
    console.print(top_table)
    console.print()

if __name__ == "__main__":
    main()
