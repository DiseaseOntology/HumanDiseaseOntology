from argparse import ArgumentParser, FileType


def main():
    p = ArgumentParser()
    p.add_argument('term_file', type=FileType('r'))
    p.add_argument('output')
    args = p.parse_args()

    term_file = args.term_file
    next(term_file)
    labels = {}
    for line in term_file:
        curie = line.split('\t')[0].replace('"', "")
        label = line.split('\t')[1].strip().lower().replace('"', "")
        if label in labels:
            curies = labels[label]
        else:
            curies = []
        curies.append(curie)
        labels[label] = curies
    term_file.close()

    output_path = args.output
    output_file = open(output_path, 'w')
    output_file.write('Label,DOID ID,HP ID\n')
    overlap = 0
    for label, curies in labels.items():
        if len(curies) > 1:
            overlap += 1
            doid = None
            hpid = None
            if len(curies) != 2:
                print('ERROR: {0} CURIES for {1}'.format(len(curies), label))
                continue
            for c in curies:
                if c.startswith('DOID'):
                    doid = c.replace('_', ':')
                if c.startswith('HP'):
                    hpid = c.replace('_', ':')
            output_file.write('{0},{1},{2}\n'.format(label, doid, hpid))
    output_file.close()

    if overlap > 0:
        print('{0} HP terms overlap with DO terms! See {1} for details'.format(overlap, args.output))
    else:
        print('No overlap between HP and DO terms!')


if __name__ == '__main__':
    main()
