import argparse
from pathlib import Path


def remove_png_strings_in_json(root_dir: Path, dry_run: bool = False) -> int:
    json_files = list(root_dir.rglob('*.json'))
    changed_count = 0

    for file_path in json_files:
        if file_path.is_file():
            text = file_path.read_text(encoding='utf-8')
            if '.png' in text:
                new_text = text.replace('.png', '')
                if not dry_run:
                    file_path.write_text(new_text, encoding='utf-8')
                changed_count += 1
                print(f"{'DRY-RUN:' if dry_run else 'UPDATED:'} {file_path}")

    return changed_count


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Remove all ".png" substrings from JSON files in a project.')
    parser.add_argument('path', nargs='?', default='.', help='Root directory to scan (default: current directory)')
    parser.add_argument('--dry-run', action='store_true', help='Show files that would change without modifying them')
    args = parser.parse_args()

    root = Path(args.path).resolve()
    if not root.exists() or not root.is_dir():
        raise SystemExit(f'Error: path does not exist or is not a directory: {root}')

    total = remove_png_strings_in_json(root, dry_run=args.dry_run)
    print(f"\nProcessed {len(list(root.rglob('*.json')))} JSON files, changed {total} files.")
