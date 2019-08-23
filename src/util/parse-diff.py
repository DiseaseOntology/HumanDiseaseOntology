import sys

def main(args):
	diff_file = args[1]
	out_file = args[2]

	removed = []
	added = []
	with open(diff_file, 'r') as f:
		for line in f:
			if line.startswith('- EquivalentClasses') or line.startswith('- SubClassOf'):
				curie = line.split('<')[1].split('>')[0]
				removed.append(curie)
			elif line.startswith('+ EquivalentClasses') or line.startswith('+ SubClassOf'):
				curie = line.split('<')[1].split('>')[0]
				added.append(curie)

	missing = list(set(removed) - set(added))

	if len(missing) > 0:
		print("%d terms with removed axioms to review" % len(missing))

	with open(out_file, 'w+') as f:
		for m in missing:
			f.write(m + '\n')

if __name__ == '__main__':
	main(sys.argv)