from os import listdir
import re

def get_diff(last, new):
	last_map = {}
	new_map = {}
	with open(last) as f:
		lines = f.readlines()
		headers = lines[0].split('\t')
		last_content = lines[1].split('\t')
		c = 0
		while (c < len(headers)):
			last_map[headers[c]] = last_content[c]
			c+=1
	with open(new) as f:
		lines = f.readlines()
		new_content = lines[1].split('\t')
		c = 0
		while (c < len(headers)):
			new_map[headers[c]] = new_content[c]
			c+=1
	diff = {}
	for h in headers:
		last_val = last_map[h]
		new_val = new_map[h]
		diff[h] = int(new_val) - int(last_val)
	return diff

def get_reports():
	files = listdir('../src/sparql')
	reports = []
	for f in files:
		if '-report.rq' in f:
			reports.append(re.sub('\.rq$', '', f))
	return reports

if __name__ == '__main__':
	reports = get_reports()
	output = ['RELEASE DIFF REPORT']
	for r in reports:
		last = 'reports/' + r + '-last.tsv'
		new = 'reports/' + r + '-new.tsv'
		output.append('\n' + r.upper())
		diff = get_diff(last, new)
		for h, v in diff.iteritems():
			t = '\t'
			if len(h.strip()) < 5:
				t = '\t\t\t'
			elif len(h.strip()) < 9:
				t = '\t\t'
			sign = '+'
			if v < 0:
				sign = '-'
			out = '\t' + re.sub('^\?', '', h.strip()) + t + sign + str(v)
			output.append(out)
	with open('reports/report-diff.txt', 'w+') as f:
		for o in output:
			f.write(o + '\n')
