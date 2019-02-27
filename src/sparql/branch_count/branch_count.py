#!/usr/bin/env python3

import os, subprocess, sys

count_dir = 'src/sparql/branch_count/'
report_dir = 'build/reports/counts/'
queries = ['anatomical_entity', 
		   'cellular_proliferation', 
		   'genetic', 
		   'infectious_agent', 
		   'mental_health', 
		   'metabolism', 
		   'physical_disorder', 
		   'syndrome']
robot_cmd = 'java -jar build/robot.jar query \
 --input %s --query %s %s'

def main(args):
	input_ont = args[1]
	output = args[2]

	if not os.path.exists(report_dir):
		os.makedirs(report_dir)

	for q in queries:
		query = count_dir + q + '.rq'
		out = report_dir + q + '.tsv'
		cmd = robot_cmd % (input_ont, query, out)
		subprocess.check_call(cmd, shell=True)

	counts = []
	counts.append('Node\tCount\n')
	for q in queries:
		out = report_dir + q + '.tsv'
		with open(out, 'r') as f:
			lines = f.readlines()
			header = lines[0][1:].rstrip('\n')
			count = lines[1]
			new_line = '%s\t%s' % (header, count)
			counts.append(new_line)

	with open(output, 'w') as f:
		for c in counts:
			f.write(c)

	#cmd = 'rm %s.rdf && rm -rf %s && rm -rf .tdb' % (input_ont, report_dir)
	subprocess.check_call(cmd, shell=True)

if __name__ == '__main__':
	main(sys.argv)
