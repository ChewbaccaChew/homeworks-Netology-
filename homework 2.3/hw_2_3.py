import re
import json
import chardet

list_of_files = ['newsafr.json', 'newscy.json', 'newsfr.json', 'newsit.json']

def encodings_chart():
        encodings_chart = {}
        for file in list_of_files:
                with open(file, 'rb') as f:
                    data = f.read()
                    result = chardet.detect(data)
                    encodings_chart[file] = result['encoding']
        return encodings_chart

def clean_description_list(raw_list):
        description_list = []
        for word in raw_list:
            result = re.sub('[\,\.\(]*(\w+)[\,\.\)]', r'\1', word)
            description_list.append(result)
        return description_list

def list_of_counts_from_chart(random_chart):
        list_of_counts = []
        for k, v in random_chart.items():
            if v not in list_of_counts:
                list_of_counts.append(v)
        list_of_counts.sort(reverse = True)
        return list_of_counts

def print_top_words(random_list_of_counts, random_chart):
        counter = 0
        for i in random_list_of_counts:
            for k, v in random_chart.items():
                if v == i:
                    counter += 1
                    if counter <= 10:
                        print(k, v)
                    else:
                        break

def top_words_from_newsit():
        with open('newsit.json', encoding = encodings_chart()['newsit.json']) as f:
                chart = {}
                data = json.load(f)
                for i in data['rss']['channel']['item']:
                        description_list_raw = i['description'].split()
                        for word in clean_description_list(description_list_raw):
                                if len(word) > 6 and word.isalpha():
                                        if word not in chart:
                                                chart[word] = 1
                                        else:
                                                chart[word] += 1
        print('newsit.json')
        print_top_words(list_of_counts_from_chart(chart), chart)

def top_words_from_newsafr():
    with open('newsafr.json', encoding = encodings_chart()['newsafr.json']) as f:
        chart = {}
        data = json.load(f)
        for i in data['rss']['channel']['item']:
            description_list_raw = i['description']['__cdata'].split()
            for word in clean_description_list(description_list_raw):
                if len(word) > 6 and word.isalpha():
                    if word not in chart:
                        chart[word] = 1
                    else:
                        chart[word] += 1
    print('newsafr.json')
    print_top_words(list_of_counts_from_chart(chart), chart)

def top_words_from_newsfr():
    with open('newsfr.json', encoding = encodings_chart()['newsfr.json']) as f:
        chart = {}
        data = json.load(f)
        for i in data['rss']['channel']['item']:
            description_list_raw = i['description']['__cdata'].split()
            for word in clean_description_list(description_list_raw):
                if len(word) > 6 and word.isalpha():
                    if word not in chart:
                        chart[word] = 1
                    else:
                        chart[word] += 1
    print('newsfr.json')
    print_top_words(list_of_counts_from_chart(chart), chart)

def top_words_from_newscy():
    with open('newscy.json', encoding = encodings_chart()['newscy.json']) as f:
        chart = {}
        data = json.load(f)
        for i in data['rss']['channel']['item']:
            description_list_raw = i['description']['__cdata'].split()
            for word in clean_description_list(description_list_raw):
                if len(word) > 6 and word.isalpha():
                    if word not in chart:
                        chart[word] = 1
                    else:
                        chart[word] += 1
    print('newscy.json')
    print_top_words(list_of_counts_from_chart(chart), chart)

top_words_from_newsit()
top_words_from_newsfr()
top_words_from_newsafr()
top_words_from_newscy()
