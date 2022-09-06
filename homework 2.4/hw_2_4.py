import glob
import os.path


def searching_result(list_of_files, string):
    search_result = []
    for file in list_of_files:
        with open(file) as f:
            data = f.read()
            if string in data:
                search_result.append(file)
    return search_result


def print_searching_result(list_of_files):
    for file in list_of_files:
        print(file)
    n = len(list_of_files)
    if n % 10 == 1 and (n % 100 < 10 or n % 100 > 20) :
        print('Всего: {} файл'.format(n))
    elif 2 <= n % 10 <= 4 and (n % 100 < 10 or n % 100 > 20) :
        print('Всего: {} файлa'.format(n))
    else:
        print('Всего: {} файлов'.format(n))


def search(target_files):
    search_string = input('Введите искомую строку (q - выход): ')
    if search_string != 'q':
        print_searching_result(searching_result(target_files, search_string))
        temp_files = []
        for file in searching_result(target_files, search_string):
            temp_files.append(file)
        return search(temp_files)
    else:
        print('-GameOver-')


migrations = 'Migrations'
#migrations = 'Advanced Migrations'
files = glob.glob(os.path.join(migrations, "*.sql"))
search(files)
