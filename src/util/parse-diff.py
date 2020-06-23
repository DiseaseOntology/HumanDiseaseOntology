import sys
import os


def main(args):
    diff_file = args[1]
    out_file = args[2]

    removed = []
    curie_to_label = {}

    with open(diff_file, 'r') as f:
        for line in f:
            if line.startswith('- EquivalentClasses') or line.startswith('- SubClassOf'):
                curie = line.split('<')[1].split('>')[0]
                label = line.split('[')[1].split(']')[0]
                removed.append(curie)
                curie_to_label[curie] = label

    removed = list(set(removed))
    with open(out_file, 'w') as f2:
        for m in removed:
            label = curie_to_label[m]
            f2.write(f'{m} ({label})\n')

    if len(removed) > 0:
        print(f"WARNING: {len(removed)} terms with removed axioms to review - see {out_file}")
    else:
        print("No subclass or equivalent axioms removed!")


if __name__ == '__main__':
    main(sys.argv)
