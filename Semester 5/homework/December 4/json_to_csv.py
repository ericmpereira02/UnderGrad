import csv, os, json

def translate(file):
    input = open('file.json');
    data = json.load(input);
    input.close()
    f=csv.writer(open('file.csv', 'wb+'));
    f.writerow(data[0].keys());
    for row in data:
        f.writerow(row.values());

