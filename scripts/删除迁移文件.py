import os

exclude_file_paths = ['.venv']
root_file_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
print(f'扫描删除迁移文件的根目录：{root_file_path}')
for dir_path, dir_names, file_names in os.walk(root_file_path):
    dir_names[:] = [d for d in set(dir_names) - set(exclude_file_paths)]
    if 'migrations' not in dir_names:
        continue
    dir_name = dir_names[dir_names.index('migrations')]

    migrations_file_path = os.path.join(dir_path, dir_name)
    for migrations_dir_path, migrations_dir_names, migrations_file_names in os.walk(migrations_file_path):
        for migrations_file_name in migrations_file_names:
            if migrations_file_name == '__init__.py':
                continue
            migration_file_path = os.path.join(migrations_dir_path, migrations_file_name)
            print(f'删除迁移文件：{migration_file_path}')
            os.remove(migration_file_path)
